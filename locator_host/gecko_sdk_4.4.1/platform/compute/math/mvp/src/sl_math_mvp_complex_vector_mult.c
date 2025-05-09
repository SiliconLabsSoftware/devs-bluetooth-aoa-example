/***************************************************************************//**
 * @file
 * @brief MVP Math Mul functions.
 *******************************************************************************
 * # License
 * <b>Copyright 2021 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * SPDX-License-Identifier: Zlib
 *
 * The licensor of this software is Silicon Laboratories Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 ******************************************************************************/
#include "sl_mvp.h"
#include "sl_math_mvp.h"
#include "sl_mvp_util.h"
#include "sl_mvp_program_area.h"
#include "sl_common.h"

#define USE_MVP_PROGRAMBUILDER    0

sl_status_t sl_math_mvp_complex_vector_mult_real_f16(const float16_t *input_a,
                                                     const float16_t *input_b,
                                                     float16_t *output,
                                                     size_t num_elements)
{
  uint32_t len_vector;
  uint32_t len_remainder;
  size_t ofs_remainder;
  uint32_t rows, cols;

  if (!input_a || !input_b || !output || !num_elements) {
    return SL_STATUS_INVALID_PARAMETER;
  }
  // Require input vectors that are word (4-byte) aligned.
  if (!sli_mvp_util_is_pointer_word_aligned(input_a)
      || !sli_mvp_util_is_pointer_word_aligned(input_b)
      || !sli_mvp_util_is_pointer_word_aligned(output)) {
    return SL_STATUS_INVALID_PARAMETER;
  }

  len_vector = (uint32_t)num_elements;
  len_remainder = 0;

  if (num_elements <= SLI_MVP_MAX_ROW_LENGTH) {
    rows = 1;
    cols = len_vector;
  } else {
    while (sli_mvp_util_factorize_number(len_vector, 1024U, &rows, &cols) != SL_STATUS_OK) {
      len_vector--;
      len_remainder++;
    }
  }

  ofs_remainder = num_elements - len_remainder;

#if USE_MVP_PROGRAMBUILDER
  // This is the reference MVP program for the optimized setup below.
  sl_status_t status;
  const int vector_x = SLI_MVP_ARRAY(0);
  const int vector_y = SLI_MVP_ARRAY(1);
  const int vector_z = SLI_MVP_ARRAY(2);
  const int vector_x1 = SLI_MVP_ARRAY(3);
  const int vector_y1 = SLI_MVP_ARRAY(4);

  sli_mvp_program_context_t *p = sli_mvp_get_program_area_context();
  sli_mvp_pb_init_program(p);
  sli_mvp_pb_begin_program(p);

  sli_mvp_pb_config_matrix(p->p, vector_x, (void *)input_a, SLI_MVP_DATATYPE_COMPLEX_BINARY16, rows, cols, &status);
  sli_mvp_pb_config_matrix(p->p, vector_y, (void *)input_b, SLI_MVP_DATATYPE_BINARY16, rows, cols, &status);
  sli_mvp_pb_config_matrix(p->p, vector_z, (void *)output, SLI_MVP_DATATYPE_COMPLEX_BINARY16, (rows + 1), cols, &status);

  sli_mvp_pb_begin_loop(p, rows, &status); {
    sli_mvp_pb_begin_loop(p, cols, &status); {
      sli_mvp_pb_compute(p,
                          SLI_MVP_OP(MULC),
                          SLI_MVP_ALU_X(SLI_MVP_R0)
                          | SLI_MVP_ALU_Y(SLI_MVP_R1)
                          | SLI_MVP_ALU_Z(SLI_MVP_R2),
                          SLI_MVP_LOAD(0, SLI_MVP_R0, vector_x, SLI_MVP_INCRDIM_WIDTH)
                          | SLI_MVP_LOAD(1, SLI_MVP_R1, vector_y, SLI_MVP_INCRDIM_WIDTH),
                          SLI_MVP_STORE(SLI_MVP_R2, vector_z, SLI_MVP_INCRDIM_WIDTH),
                          &status);
    }
    sli_mvp_pb_end_loop(p);
    sli_mvp_pb_postloop_incr_dim(p, vector_x, SLI_MVP_INCRDIM_HEIGHT);
    sli_mvp_pb_postloop_incr_dim(p, vector_y, SLI_MVP_INCRDIM_HEIGHT);
    sli_mvp_pb_postloop_incr_dim(p, vector_z, SLI_MVP_INCRDIM_HEIGHT);
  }
  sli_mvp_pb_end_loop(p);

  if (len_remainder > 0) {
    sli_mvp_pb_config_vector(p->p, vector_x1, (void *)&input_a[ofs_remainder * 2], SLI_MVP_DATATYPE_COMPLEX_BINARY16, len_remainder, &status);
    sli_mvp_pb_config_vector(p->p, vector_y1, (void *)&input_b[ofs_remainder], SLI_MVP_DATATYPE_BINARY16, len_remainder, &status);

    sli_mvp_pb_begin_loop(p, len_remainder, &status); {
      sli_mvp_pb_compute(p,
                          SLI_MVP_OP(MULC),
                          SLI_MVP_ALU_X(SLI_MVP_R0)
                          | SLI_MVP_ALU_Y(SLI_MVP_R1)
                          | SLI_MVP_ALU_Z(SLI_MVP_R2),
                          SLI_MVP_LOAD(0, SLI_MVP_R0, vector_x1, SLI_MVP_INCRDIM_WIDTH)
                          | SLI_MVP_LOAD(1, SLI_MVP_R1, vector_y1, SLI_MVP_INCRDIM_WIDTH),
                          SLI_MVP_STORE(SLI_MVP_R2, vector_z, SLI_MVP_INCRDIM_WIDTH),
                          &status);
    }
    sli_mvp_pb_end_loop(p);
  }

  // Check if any errors found during program generation.
  if (status != SL_STATUS_OK) {
    return status;
  }
  if ((status = sli_mvp_pb_execute_program(p)) != SL_STATUS_OK) {
    return status;
  }
#else

  sli_mvp_cmd_enable();

  // Program array controllers.
  // input_a
  MVP->ARRAY[0].DIM0CFG =
    SLI_MVP_DATATYPE_COMPLEX_BINARY16 << _MVP_ARRAYDIM0CFG_BASETYPE_SHIFT;
  MVP->ARRAY[0].DIM1CFG =
    ((rows - 1) << _MVP_ARRAYDIM1CFG_SIZE_SHIFT) | (cols << _MVP_ARRAYDIM1CFG_STRIDE_SHIFT);
  MVP->ARRAY[0].DIM2CFG =
    ((cols - 1) << _MVP_ARRAYDIM2CFG_SIZE_SHIFT) | (1 << _MVP_ARRAYDIM2CFG_STRIDE_SHIFT);
  MVP->ARRAY[0].ADDRCFG = (sli_mvp_addr_reg_t)input_a;
  // input_b
  MVP->ARRAY[1].DIM0CFG =
    SLI_MVP_DATATYPE_BINARY16 << _MVP_ARRAYDIM0CFG_BASETYPE_SHIFT;
  MVP->ARRAY[1].DIM1CFG =
    ((rows - 1) << _MVP_ARRAYDIM1CFG_SIZE_SHIFT) | (cols << _MVP_ARRAYDIM1CFG_STRIDE_SHIFT);
  MVP->ARRAY[1].DIM2CFG =
    ((cols - 1) << _MVP_ARRAYDIM2CFG_SIZE_SHIFT) | (1 << _MVP_ARRAYDIM2CFG_STRIDE_SHIFT);
  MVP->ARRAY[1].ADDRCFG =
    (sli_mvp_addr_reg_t)input_b;
  // output
  MVP->ARRAY[2].DIM0CFG =
    SLI_MVP_DATATYPE_COMPLEX_BINARY16 << _MVP_ARRAYDIM0CFG_BASETYPE_SHIFT;
  MVP->ARRAY[2].DIM1CFG =
    ((rows) << _MVP_ARRAYDIM1CFG_SIZE_SHIFT) | (cols << _MVP_ARRAYDIM1CFG_STRIDE_SHIFT);
  MVP->ARRAY[2].DIM2CFG =
    ((cols - 1) << _MVP_ARRAYDIM2CFG_SIZE_SHIFT) | (1 << _MVP_ARRAYDIM2CFG_STRIDE_SHIFT);
  MVP->ARRAY[2].ADDRCFG = (sli_mvp_addr_reg_t)output;

  // Program loop controllers.
  MVP->LOOP[0].CFG = (rows - 1) << _MVP_LOOPCFG_NUMITERS_SHIFT;
  MVP->LOOP[1].CFG = ((cols - 1) << _MVP_LOOPCFG_NUMITERS_SHIFT)
                     | ((SLI_MVP_LOOP_INCRDIM(SLI_MVP_ARRAY(0), SLI_MVP_INCRDIM_HEIGHT)
                         | SLI_MVP_LOOP_INCRDIM(SLI_MVP_ARRAY(1), SLI_MVP_INCRDIM_HEIGHT)
                         | SLI_MVP_LOOP_INCRDIM(SLI_MVP_ARRAY(2), SLI_MVP_INCRDIM_HEIGHT))
                        << _MVP_LOOPCFG_ARRAY0INCRDIM0_SHIFT);

  // Program instruction(s).
  MVP->INSTR[0].CFG0 = SLI_MVP_ALU_X(SLI_MVP_R0) | SLI_MVP_ALU_Y(SLI_MVP_R1) | SLI_MVP_ALU_Z(SLI_MVP_R2);
  MVP->INSTR[0].CFG1 = SLI_MVP_LOAD(0, SLI_MVP_R0, SLI_MVP_ARRAY(0), SLI_MVP_INCRDIM_WIDTH)
                       | SLI_MVP_LOAD(1, SLI_MVP_R1, SLI_MVP_ARRAY(1), SLI_MVP_INCRDIM_WIDTH)
                       | SLI_MVP_STORE(SLI_MVP_R2, SLI_MVP_ARRAY(2), SLI_MVP_INCRDIM_WIDTH);
  MVP->INSTR[0].CFG2 = (SLI_MVP_OP(MULC) << _MVP_INSTRCFG2_ALUOP_SHIFT)
                        | MVP_INSTRCFG2_LOOP0BEGIN
                        | MVP_INSTRCFG2_LOOP0END
                        | MVP_INSTRCFG2_LOOP1BEGIN
                        | MVP_INSTRCFG2_LOOP1END;

  size_t last_instruction_idx = 0;

  if (len_remainder > 0) {
    // Handle the remainder.
    // Program array controllers.
    // input_a
    MVP->ARRAY[3].DIM0CFG =
      SLI_MVP_DATATYPE_COMPLEX_BINARY16 << _MVP_ARRAYDIM0CFG_BASETYPE_SHIFT;
    MVP->ARRAY[3].DIM1CFG =
      0;
    MVP->ARRAY[3].DIM2CFG =
      ((len_remainder - 1) << _MVP_ARRAYDIM2CFG_SIZE_SHIFT) | (1 << _MVP_ARRAYDIM2CFG_STRIDE_SHIFT);
    MVP->ARRAY[3].ADDRCFG = (sli_mvp_addr_reg_t)&input_a[ofs_remainder * 2];
    // input_b
    MVP->ARRAY[4].DIM0CFG =
      SLI_MVP_DATATYPE_BINARY16 << _MVP_ARRAYDIM0CFG_BASETYPE_SHIFT;
    MVP->ARRAY[4].DIM1CFG =
      0;
    MVP->ARRAY[4].DIM2CFG =
      ((len_remainder - 1) << _MVP_ARRAYDIM2CFG_SIZE_SHIFT) | (1 << _MVP_ARRAYDIM2CFG_STRIDE_SHIFT);
    MVP->ARRAY[4].ADDRCFG = (sli_mvp_addr_reg_t)&input_b[ofs_remainder];

    // Program loop controllers.
    MVP->LOOP[2].CFG = (len_remainder - 1) << _MVP_LOOPCFG_NUMITERS_SHIFT;

    // Program instructions.
    MVP->INSTR[1].CFG0 = SLI_MVP_ALU_X(SLI_MVP_R0) | SLI_MVP_ALU_Y(SLI_MVP_R1) | SLI_MVP_ALU_Z(SLI_MVP_R2);
    MVP->INSTR[1].CFG1 = SLI_MVP_LOAD(0, SLI_MVP_R0, SLI_MVP_ARRAY(3), SLI_MVP_INCRDIM_WIDTH)
      | SLI_MVP_LOAD(1, SLI_MVP_R1, SLI_MVP_ARRAY(4), SLI_MVP_INCRDIM_WIDTH)
      | SLI_MVP_STORE(SLI_MVP_R2, SLI_MVP_ARRAY(2), SLI_MVP_INCRDIM_WIDTH);
    MVP->INSTR[1].CFG2 = (SLI_MVP_OP(MULC) << _MVP_INSTRCFG2_ALUOP_SHIFT)
      | MVP_INSTRCFG2_LOOP2BEGIN
      | MVP_INSTRCFG2_LOOP2END;

    // Move the next instruction index
    last_instruction_idx += 1;
  }

  // Set ENDPROG.
  MVP->INSTR[last_instruction_idx].CFG2 |= MVP_INSTRCFG2_ENDPROG;

  // Start program.
  MVP->CMD = MVP_CMD_INIT | MVP_CMD_START;
#endif

  return sli_mvp_cmd_wait_for_completion();
}

sl_status_t sl_math_mvp_complex_vector_mult_f16(const float16_t *input_a,
                                                const float16_t *input_b,
                                                float16_t *output,
                                                size_t num_elements)
{
  uint32_t len_vector;
  uint32_t len_remainder;
  size_t ofs_remainder;
  uint32_t rows, cols;
  sl_status_t status;

  if (!input_a || !input_b || !output || !num_elements) {
    return SL_STATUS_INVALID_PARAMETER;
  }
  // Require input vectors that are word (4-byte) aligned.
  if (!sli_mvp_util_is_pointer_word_aligned(input_a)
      || !sli_mvp_util_is_pointer_word_aligned(input_b)
      || !sli_mvp_util_is_pointer_word_aligned(output)) {
    return SL_STATUS_INVALID_PARAMETER;
  }

  len_vector = (uint32_t)num_elements;
  len_remainder = 0;

  // Factorize vector length into rows * cols.
  if (num_elements <= SLI_MVP_MAX_ROW_LENGTH) {
    rows = 1;
    cols = len_vector;
  } else {
    while (sli_mvp_util_factorize_number(len_vector, 1024U, &rows, &cols) != SL_STATUS_OK) {
      len_vector--;
      len_remainder++;
    }
  }

  ofs_remainder = num_elements - len_remainder;

#if USE_MVP_PROGRAMBUILDER
  // This is the reference MVP program for the optimized setup below.
  const int vector_x = SLI_MVP_ARRAY(0);
  const int vector_y = SLI_MVP_ARRAY(1);
  const int vector_z = SLI_MVP_ARRAY(2);

  sli_mvp_program_context_t *p = sli_mvp_get_program_area_context();
  sli_mvp_pb_init_program(p);
  sli_mvp_pb_begin_program(p);

  sli_mvp_pb_config_matrix(p->p, vector_x, (void *)input_a, SLI_MVP_DATATYPE_COMPLEX_BINARY16, rows, cols, &status);
  sli_mvp_pb_config_matrix(p->p, vector_y, (void *)input_b, SLI_MVP_DATATYPE_COMPLEX_BINARY16, rows, cols, &status);
  sli_mvp_pb_config_matrix(p->p, vector_z, (void *)output, SLI_MVP_DATATYPE_COMPLEX_BINARY16, rows, cols, &status);

  sli_mvp_pb_begin_loop(p, rows, &status); {
    sli_mvp_pb_begin_loop(p, cols, &status); {
      sli_mvp_pb_compute(p,
                         SLI_MVP_OP(MULC),
                         SLI_MVP_ALU_X(SLI_MVP_R0)
                         | SLI_MVP_ALU_Y(SLI_MVP_R1)
                         | SLI_MVP_ALU_Z(SLI_MVP_R2),
                         SLI_MVP_LOAD(0, SLI_MVP_R0, vector_x, SLI_MVP_INCRDIM_WIDTH)
                         | SLI_MVP_LOAD(1, SLI_MVP_R1, vector_y, SLI_MVP_INCRDIM_WIDTH),
                         SLI_MVP_STORE(SLI_MVP_R2, vector_z, SLI_MVP_INCRDIM_WIDTH),
                         &status);
    }
    sli_mvp_pb_end_loop(p);
    sli_mvp_pb_postloop_incr_dim(p, vector_x, SLI_MVP_INCRDIM_HEIGHT);
    sli_mvp_pb_postloop_incr_dim(p, vector_y, SLI_MVP_INCRDIM_HEIGHT);
    sli_mvp_pb_postloop_incr_dim(p, vector_z, SLI_MVP_INCRDIM_HEIGHT);
  }
  sli_mvp_pb_end_loop(p);

  // Check if any errors found during program generation.
  if (status != SL_STATUS_OK) {
    return status;
  }
  if ((status = sli_mvp_pb_execute_program(p)) != SL_STATUS_OK) {
    return status;
  }

  if (len_remainder > 0) {
    sli_mvp_pb_config_vector(p->p, vector_x, (void *)&input_a[ofs_remainder * 2], SLI_MVP_DATATYPE_COMPLEX_BINARY16, len_remainder, &status);
    sli_mvp_pb_config_vector(p->p, vector_y, (void *)&input_b[ofs_remainder * 2], SLI_MVP_DATATYPE_COMPLEX_BINARY16, len_remainder, &status);
    sli_mvp_pb_config_vector(p->p, vector_z, (void *)&output[ofs_remainder * 2], SLI_MVP_DATATYPE_COMPLEX_BINARY16, len_remainder, &status);

    sli_mvp_pb_begin_loop(p, len_remainder, &status); {
      sli_mvp_pb_compute(p,
        SLI_MVP_OP(MULC),
        SLI_MVP_ALU_X(SLI_MVP_R0)
        | SLI_MVP_ALU_Y(SLI_MVP_R1)
        | SLI_MVP_ALU_Z(SLI_MVP_R2),
        SLI_MVP_LOAD(0, SLI_MVP_R0, vector_x, SLI_MVP_INCRDIM_WIDTH)
        | SLI_MVP_LOAD(1, SLI_MVP_R1, vector_y, SLI_MVP_INCRDIM_WIDTH),
        SLI_MVP_STORE(SLI_MVP_R2, vector_z, SLI_MVP_INCRDIM_WIDTH),
        &status);
    }
    sli_mvp_pb_end_loop(p);

    // Check if any errors found during program generation.
    if (status != SL_STATUS_OK) {
      return status;
    }
    if ((status = sli_mvp_pb_execute_program(p)) != SL_STATUS_OK) {
      return status;
    }
  }
  status = sli_mvp_cmd_wait_for_completion();
#else

  sli_mvp_cmd_enable();

  // Program array controllers.
  MVP->ARRAY[0].DIM0CFG = MVP->ARRAY[1].DIM0CFG = MVP->ARRAY[2].DIM0CFG =
    SLI_MVP_DATATYPE_COMPLEX_BINARY16 << _MVP_ARRAYDIM0CFG_BASETYPE_SHIFT;
  MVP->ARRAY[0].DIM1CFG = MVP->ARRAY[1].DIM1CFG = MVP->ARRAY[2].DIM1CFG =
    ((rows - 1) << _MVP_ARRAYDIM1CFG_SIZE_SHIFT) | (cols << _MVP_ARRAYDIM1CFG_STRIDE_SHIFT);
  MVP->ARRAY[0].DIM2CFG = MVP->ARRAY[1].DIM2CFG = MVP->ARRAY[2].DIM2CFG =
    ((cols - 1) << _MVP_ARRAYDIM2CFG_SIZE_SHIFT) | (1 << _MVP_ARRAYDIM2CFG_STRIDE_SHIFT);
  MVP->ARRAY[0].ADDRCFG = (sli_mvp_addr_reg_t)input_a;
  MVP->ARRAY[1].ADDRCFG = (sli_mvp_addr_reg_t)input_b;
  MVP->ARRAY[2].ADDRCFG = (sli_mvp_addr_reg_t)output;

  // Program loop controllers.
  MVP->LOOP[0].CFG = (rows - 1) << _MVP_LOOPCFG_NUMITERS_SHIFT;
  MVP->LOOP[1].CFG = ((cols - 1) << _MVP_LOOPCFG_NUMITERS_SHIFT)
                     | ((SLI_MVP_LOOP_INCRDIM(SLI_MVP_ARRAY(0), SLI_MVP_INCRDIM_HEIGHT)
                         | SLI_MVP_LOOP_INCRDIM(SLI_MVP_ARRAY(1), SLI_MVP_INCRDIM_HEIGHT)
                         | SLI_MVP_LOOP_INCRDIM(SLI_MVP_ARRAY(2), SLI_MVP_INCRDIM_HEIGHT))
                        << _MVP_LOOPCFG_ARRAY0INCRDIM0_SHIFT);

  // Program instruction(s).
  MVP->INSTR[0].CFG0 = SLI_MVP_ALU_X(SLI_MVP_R0) | SLI_MVP_ALU_Y(SLI_MVP_R1) | SLI_MVP_ALU_Z(SLI_MVP_R2);
  MVP->INSTR[0].CFG1 = SLI_MVP_LOAD(0, SLI_MVP_R0, SLI_MVP_ARRAY(0), SLI_MVP_INCRDIM_WIDTH)
                       | SLI_MVP_LOAD(1, SLI_MVP_R1, SLI_MVP_ARRAY(1), SLI_MVP_INCRDIM_WIDTH)
                       | SLI_MVP_STORE(SLI_MVP_R2, SLI_MVP_ARRAY(2), SLI_MVP_INCRDIM_WIDTH);
  MVP->INSTR[0].CFG2 = (SLI_MVP_OP(MULC) << _MVP_INSTRCFG2_ALUOP_SHIFT)
                       | MVP_INSTRCFG2_LOOP0BEGIN
                       | MVP_INSTRCFG2_LOOP0END
                       | MVP_INSTRCFG2_LOOP1BEGIN
                       | MVP_INSTRCFG2_LOOP1END
                       | MVP_INSTRCFG2_ENDPROG;

  // Start program.
  MVP->CMD = MVP_CMD_INIT | MVP_CMD_START;
  if ((status = sli_mvp_cmd_wait_for_completion()) != SL_STATUS_OK) {
    return status;
  }

  if (len_remainder > 0) {
    // Program array controllers.
    MVP->ARRAY[0].DIM0CFG = MVP->ARRAY[1].DIM0CFG = MVP->ARRAY[2].DIM0CFG =
      SLI_MVP_DATATYPE_COMPLEX_BINARY16 << _MVP_ARRAYDIM0CFG_BASETYPE_SHIFT;
    MVP->ARRAY[0].DIM1CFG = MVP->ARRAY[1].DIM1CFG = MVP->ARRAY[2].DIM1CFG =
      0;
    MVP->ARRAY[0].DIM2CFG = MVP->ARRAY[1].DIM2CFG = MVP->ARRAY[2].DIM2CFG =
      ((len_remainder - 1) << _MVP_ARRAYDIM2CFG_SIZE_SHIFT) | (1 << _MVP_ARRAYDIM2CFG_STRIDE_SHIFT);
    MVP->ARRAY[0].ADDRCFG = (sli_mvp_addr_reg_t)&input_a[ofs_remainder * 2];
    MVP->ARRAY[1].ADDRCFG = (sli_mvp_addr_reg_t)&input_b[ofs_remainder * 2];
    MVP->ARRAY[2].ADDRCFG = (sli_mvp_addr_reg_t)&output[ofs_remainder * 2];

    // Program loop controllers.
    MVP->LOOP[0].CFG = (len_remainder - 1) << _MVP_LOOPCFG_NUMITERS_SHIFT;

    // Program instruction(s).
    MVP->INSTR[0].CFG0 = SLI_MVP_ALU_X(SLI_MVP_R0) | SLI_MVP_ALU_Y(SLI_MVP_R1) | SLI_MVP_ALU_Z(SLI_MVP_R2);
    MVP->INSTR[0].CFG1 = SLI_MVP_LOAD(0, SLI_MVP_R0, SLI_MVP_ARRAY(0), SLI_MVP_INCRDIM_WIDTH)
      | SLI_MVP_LOAD(1, SLI_MVP_R1, SLI_MVP_ARRAY(1), SLI_MVP_INCRDIM_WIDTH)
      | SLI_MVP_STORE(SLI_MVP_R2, SLI_MVP_ARRAY(2), SLI_MVP_INCRDIM_WIDTH);
    MVP->INSTR[0].CFG2 = (SLI_MVP_OP(MULC) << _MVP_INSTRCFG2_ALUOP_SHIFT)
      | MVP_INSTRCFG2_LOOP0BEGIN
      | MVP_INSTRCFG2_LOOP0END
      | MVP_INSTRCFG2_ENDPROG;

    // Start program.
    MVP->CMD = MVP_CMD_INIT | MVP_CMD_START;
    status = sli_mvp_cmd_wait_for_completion();
  }
#endif

  return status;
}
