################################################################################
# Program configuration
################################################################################
BACKGROUND		:= &
CHANGE_DIR		:= cd
FIND			:= find
IGNORE_RESULT 	:= -
MAKE			:= make
MUTE			:= @
SILENT			:= >/dev/null
SPACE 			:= $(empty) $(empty)
VERYSILENT		:= 1>/dev/null 2>/dev/null

################################################################################
# Folders to recursively make
################################################################################
SUBDIRS := $(shell $(FIND) . -mindepth 1 -maxdepth 1 -type d -o -type l)

################################################################################
# Targets
################################################################################
.PHONY: all
all:
	$(MUTE)for d in $(SUBDIRS); do ($(CHANGE_DIR) $$d && $(MAKE) $@) done

.PHONY: clean
clean:
	$(MUTE)for d in $(SUBDIRS); do ($(CHANGE_DIR) $$d && $(MAKE) $@) done

.PHONY: distclean
distclean:
	$(MUTE)for d in $(SUBDIRS); do ($(CHANGE_DIR) $$d && $(MAKE) $@) done
