.SUFFIXES:				# ignore builtin rules
.PHONY: all locator_host locator_ncp

TARGET ?= clean_build
TYPE ?= Debug #Release

all: locator_host locator_ncp

locator_host locator_ncp:
	@echo 'Building $@...!'
	${MAKE} -C $@ ${TARGET} TYPE=${TYPE}
