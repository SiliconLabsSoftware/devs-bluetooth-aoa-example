#ifndef BLUETOOTH_H
#define BLUETOOTH_H

#include <stdbool.h>
#include "sl_bt_api.h"

#define SL_BT_COMPONENT_CONNECTIONS 0

// Initialize Bluetooth core functionality
void sl_bt_init(void);

// Polls bluetooth stack for an event and processes it
void sl_bt_step(void);

/**
 * Tell if the application can process a new Bluetooth event in its current
 * state, for example, based on resource availability status.
 * If true is returned by this function, sl_bt_process_event will be called
 * for event processing. Otherwise, the event will be kept in stack's event
 * queue until the application can process it.
 *
 * @note Default implementation of this function returns true.
 * Application can override it for own business logic.
 *
 * @param len Data length of the event
 * @return ture if event can be processed; false otherwise
 */
bool sl_bt_can_process_event(uint32_t len);

// Processes a single bluetooth event
void sl_bt_process_event(sl_bt_msg_t *evt);

void sl_bt_on_event(sl_bt_msg_t* evt);


#endif // BLUETOOTH_H
