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
# NOTE: Must make libmbgl BEFORE private
SUBDIRS := libmbgl private

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
distsclean:
	$(MUTE)for d in $(SUBDIRS); do ($(CHANGE_DIR) $$d && $(MAKE) $@) done
