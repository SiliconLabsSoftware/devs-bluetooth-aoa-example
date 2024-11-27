.SUFFIXES:				# ignore builtin rules
.PHONY: clean configure build clean_build

TYPE ?= Debug #Release
BUILD_DIR ?= build

clean_build: clean configure build

clean:
	@echo 'Cleaning every build directory!'
	rm -rf ${BUILD_DIR}
configure:
	@echo 'CMAKE configure...!'
	cmake locator_host_cmake -B ${BUILD_DIR} -G "Ninja" -DCMAKE_BUILD_TYPE:STRING=${TYPE} -DCMAKE_TOOLCHAIN_FILE:STRING=toolchain.cmake
build:
	@echo 'CMAKE build...!'
	cmake --build ${BUILD_DIR} --parallel --config ${TYPE}
