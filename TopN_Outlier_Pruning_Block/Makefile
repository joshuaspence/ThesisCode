#------------------------------------------------------------------------------#
#                                                                              #
#                                MAKE OPTIONS                                  #
#                                                                              #
#------------------------------------------------------------------------------#
.SUFFIXES:
.DEFAULT: help


#------------------------------------------------------------------------------#
#                                                                              #
#                               DEFAULT TARGET                                 #
#                                                                              #
#------------------------------------------------------------------------------#
.PHONY: help
help:
	$(help_text)


#------------------------------------------------------------------------------#
#                                                                              #
#                                CONFIGURATION                                 #
#                                                                              #
#------------------------------------------------------------------------------#
BUILD_TYPES        := autoesl binary matlab

autoesl_OUTPUT_DIR := AutoESL
autoesl_EXT        := esl
autoesl_FLAGS      := -D__AUTOESL__

binary_OUTPUT_DIR  := bin
binary_EXT         := bin
binary_FLAGS       := -D__C__

matlab_OUTPUT_DIR  := bin
matlab_EXT          = $(MEXEXT)
matlab_FLAGS       := -D__MEX__

SOURCE_DIR         := source


#------------------------------------------------------------------------------#
#                                                                              #
#                                 PROGRAMS                                     #
#                                                                              #
#------------------------------------------------------------------------------#
DELETE  := rm
ECHO    := echo
GREP    := egrep
MAKEDIR := mkdir -p
SED     := sed
TEST    := test

#------------------------------------------------------------------------------#
#                                                                              #
#                              UTILITY MACROS                                  #
#                                                                              #
#------------------------------------------------------------------------------#

# $(help-text)
define help_text
-@$(ECHO) "/==============================================================================\\"
-@$(ECHO) "|                          TopN_Outlier_Pruning_Block                          |"
-@$(ECHO) "\\==============================================================================/"
-@$(ECHO) ""
-@$(ECHO) " USAGE:"
-@$(ECHO) "     make <TASK>"
-@$(ECHO) "     make all[-<BUILD_MODE>]"
-@$(ECHO) "     make <BUILD_TYPE>[-<BUILD_MODE>]"
-@$(ECHO) "     make <TARGET>"
-@$(ECHO) ""
-@$(ECHO) " TASKS:"
-@$(ECHO) "     help"
-@$(ECHO) "     clean | clean-all"
-@$(ECHO) "     clean-<ARCHITECTURE>"
-@$(ECHO) "     distclean | distclean-all"
-@$(ECHO) "     info"
-@$(ECHO) ""
-@$(ECHO) " BUILD_TYPE:"
-@$(foreach TYPE,$(BUILD_TYPES),$(ECHO) "     $(TYPE)";)
-@$(ECHO) ""
-@$(ECHO) " BUILD_MODE:"
-@$(ECHO) "     (none)"
-@$(ECHO) "     debug"
-@$(ECHO) "     release"
-@$(ECHO) ""
-@$(ECHO) " TARGET:"
-@$(foreach TARGET,$(ALL_TARGETS),$(ECHO) "     $(TARGET)";)
-@$(ECHO) ""
endef

# $(call parse-mex-options,OPTION_NAME)
# Parse options from the mex compiler.
define parse-mex-options
$(shell $(MXX) -v 2>/dev/null | $(SED) -n 's/\s*$1\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')
endef

# $(call pretty,STRING)
# Remove duplicate whitespace from a string. Removes the following:
#     - Repeated whitespace
#     - Leading whitespace
#     - Trailing whitespace
define pretty
$(shell $(ECHO) -n "$1" | $(SED) \
-e 's/\s\s\+/ /' \
-e 's/^\s\+//' \
-e 's/\s\+$$//'
)
endef

# $(call print-variable,var)
# Print the name and value of a variable.
print-variable = $(info $1=$($1))

# $(call print-variables)
# Print all makefile variables
define print-variables
$(foreach V,$(sort $(filter-out print-variable%,$(.VARIABLES))), 
	$(if $(filter file,$(origin $V)),
		$(call print-variable,$V)))
endef

# $(call remove-flag,FLAGS,FLAG)
# Remove a flag from a CFLAG-style string.
define remove-flag
$(shell $(ECHO) -n $1 | $(SED) 's/-$2\s\+//')
endef

# $(call autoesl-ready)
# Check that AutoESL can communicate with the licensing server correctly.
define autoesl-ready
$(shell $(ECHO) 'exit' | $(AUTOESL) | $(GREP) -q 'FLEXnet Licensing error')
endef

#-------------------------------------------------------------------------------

# $(eval $(call build-type-template,ARCHITECTURE))
define build-type-template
.PHONY: $(1)
$(1): $$($(1)_TARGETS)

.PHONY: clean-$(1)
clean-$(1):
	-@$$(ECHO) "Cleaning $(1)..."
	$$(call pretty,$$(DELETE) -f $$($(1)_TARGETS))
	-@$$(ECHO) "Clean completed."
	-@$$(ECHO) ""

.PHONY: distclean-$(1)
distclean-$(1): clean-$(1)
endef

# $(eval $(call debug-template,TARGET))
# Debug build
define debug-template
.PHONY:		$(1)-debug
$(1)-debug:	CFLAGS   += $$(CFLAGS_DEBUG)
$(1)-debug:	CXXFLAGS += $$(CXXFLAGS_DEBUG)
$(1)-debug:	MXXFLAGS += $$(MXXFLAGS_DEBUG)
$(1)-debug:	LDFLAGS  += $$(LDFLAGS_DEBUG)
$(1)-debug:	ESLFLAGS += $$(ESLFLAGS_DEBUG)
$(1)-debug:	$(1)
endef

# $(eval $(call release-template,TARGET))
# Release build
define release-template
.PHONY:    $(1)-release
$(1)-release: CFLAGS   += $$(CFLAGS_OPT)
$(1)-release: CXXFLAGS += $$(CXXFLAGS_OPT)
$(1)-release: MXXFLAGS += $$(MXXFLAGS_OPT)
$(1)-release: LDFLAGS  += $$(LDFLAGS_OPT)
$(1)-release: ESLFLAGS += $$(ESLFLAGS_OPT)
$(1)-release: $(1)
endef

# $(eval $(call target-template,TARGET))
define target-template
autoesl_TARGETS += $$(autoesl_OUTPUT_DIR)/$(1).$$(autoesl_EXT)
$$(autoesl_OUTPUT_DIR)/$(1).$$(autoesl_EXT): $$(COMMON_SOURCES) $$(autoesl_SOURCES)
	-@$$(MAKEDIR) $$(autoesl_OUTPUT_DIR)
	-@$$(ECHO) "Compiling: $$@"
	$$(if $$(call autoesl-ready),$$(call pretty,$$(CC) $$(autoesl_FLAGS) $$(CFLAGS) $$($(1)_CFLAGS) -o $$@ $$^),-@$$(ECHO) "AutoESL not ready.")
	-@$$(ECHO)

binary_TARGETS += $$(binary_OUTPUT_DIR)/$(1).$$(binary_EXT)
$$(binary_OUTPUT_DIR)/$(1).$$(binary_EXT): $$(COMMON_SOURCES) $$(binary_SOURCES)
	-@$$(MAKEDIR) $$(binary_OUTPUT_DIR)
	-@$$(ECHO) "Compiling: $$@"
	$$(call pretty,$$(CC) $$(binary_FLAGS) $$(CFLAGS) $$($(1)_CFLAGS) -o $$@ $$^)
	-@$$(ECHO) ""

matlab_TARGETS += $$(matlab_OUTPUT_DIR)/$(1).$$(matlab_EXT)
$$(matlab_OUTPUT_DIR)/$(1).$$(matlab_EXT): $$(COMMON_SOURCES) $$(matlab_SOURCES)
	-@$$(MAKEDIR) $$(matlab_OUTPUT_DIR)
	-@$$(ECHO) "Compiling: $$@"
	$$(call pretty,$$(MXX) $$(matlab_FLAGS) $$(MXXFLAGS) $$($(1)_MXXFLAGS) CFLAGS='$$(CFLAGS) $$($(1)_CFLAGS)' CXXFLAGS='$$(CXXFLAGS) $$($(1)_CXXFLAGS)' LDFLAGS='$$(LDFLAGS)' -o $$@ $$^)
	-@$$(ECHO) ""

ALL_TARGETS += $$(autoesl_OUTPUT_DIR)/$(1).$$(autoesl_EXT) \
			   $$(binary_OUTPUT_DIR)/$(1).$$(binary_EXT) \
			   $$(matlab_OUTPUT_DIR)/$(1).$$(matlab_EXT)
endef


#------------------------------------------------------------------------------#
#                                                                              #
#                             MATLAB CONFIGURATION                             #
#                                                                              #
#------------------------------------------------------------------------------#
MATLAB_DIR := $(shell matlab -e 2>/dev/null | sed -n 's/MATLAB=\(.\+\)/\1/p')
ARCH       := $(shell matlab -e 2>/dev/null | sed -n 's/ARCH=\(.\+\)/\1/p')

ifndef MXX
	ifeq ($(shell uname),Darwin)
		MXX      := $(call pretty,$(MATLAB_DIR)/bin/mex -$(ARCH))
		MEXEXT   := $(shell $(MATLAB_DIR)/bin/mexext)
		MXXFLAGS := -I$(MATLAB_DIR)/extern/include
	endif
	ifeq ($(shell uname),Linux)
		MXX      := $(call pretty,$(MATLAB_DIR)/bin/mex -$(ARCH))
		MEXEXT   := $(shell $(MATLAB_DIR)/bin/mexext)
		MXXFLAGS := -I$(MATLAB_DIR)/extern/include
	endif
else
	MEXEXT := $(shell mexext)
endif

ifeq ($(ARCH),glnx86)
	MEXEXT    := mexglx
	ARCH_TYPE := x86
endif
ifeq ($(ARCH),glnxa64)
	MEXEXT    := mexa64
	ARCH_TYPE := x64
endif
ifeq ($(ARCH),mac)
	MEXEXT    := mexmac
	ARCH_TYPE := x86
endif
ifeq ($(ARCH),maci)
	MEXEXT    := mexmaci
	ARCH_TYPE := x86
 endif
ifeq ($(ARCH),maci64)
	MEXEXT    := mexmaci64
	ARCH_TYPE := x64
endif
ifeq ($(ARCH),sol2)
	MEXEXT    := mexsol
	ARCH_TYPE := x86
endif
ifeq ($(ARCH),sol64)
	MEXEXT    := mexs64
	ARCH_TYPE := x64
endif
ifeq ($(ARCH),win64)
	MEXEXT    := mexw64
	ARCH_TYPE := x64
endif
ifeq ($(ARCH),win32)
	MEXEXT    := mexw32
	ARCH_TYPE := x86
endif


#------------------------------------------------------------------------------#
#                                                                              #
#                            AUTOESL CONFIGURATION                             #
#                                                                              #
#------------------------------------------------------------------------------#
AUTOESL := autoesl -i

#------------------------------------------------------------------------------#
#                                                                              #
#                              COMPILER FLAGS                                  #
#                                                                              #
#------------------------------------------------------------------------------#

# C compiler
CC       := gcc

# Default flags (these will be overridden)
CFLAGS   := $(call parse-mex-options,CFLAGS)
CXXFLAGS := $(call parse-mex-options,CXXFLAGS)
LDFLAGS  := $(call parse-mex-options,LDFLAGS)

# Remove 'ANSI standard' flags
CFLAGS   := $(call remove-flag,$(CFLAGS),ansi)
CXXFLAGS := $(call remove-flag,$(CXXFLAGS),ansi)

# Additional flags
CFLAGS   += -std=c99 -W -Wall -pedantic -fmessage-length=0
CXXFLAGS += -std=c++0x -W -Wall -pedantic -fmessage-length=0
MXXFLAGS += -DVARDUMP
LDFLAGS  +=
ESLFLAGS +=

# Architecture specific
ifeq ($(ARCH_TYPE), x86)
CFLAGS   +=
CXXFLAGS +=
MXXFLAGS += -compatibleArrayDims
LDFLAGS  +=
ESLFLAGS +=
endif
ifeq ($(ARCH_TYPE), x64)
CFLAGS   +=
CXXFLAGS +=
MXXFLAGS += -largeArrayDims
LDFLAGS  +=
ESLFLAGS +=
endif

# Debug flags
CFLAGS_DEBUG   := -g -O0 -DDEBUG -DSTATS
CXXFLAGS_DEBUG := -g -O0 -DDEBUG -DSTATS
MXXFLAGS_DEBUG := -DDEBUG -DSTATS
LDFLAGS_DEBUG  := -g
ESLFLAGS_DEBUG :=

# Optimization flags
CFLAGS_OPT   := -O3 -DNDEBUG
CXXFLAGS_OPT := -O3 -DNDEBUG
MXXFLAGS_OPT := -O -DNDEBUG
LDFLAGS_OPT  := -O3
ESLFLAGS_OPT :=

#------------------------------------------------------------------------------#
#                                                                              #
#                                   TARGETS                                    #
#                                                                              #
#------------------------------------------------------------------------------#

TARGETS := TopN_Outlier_Pruning_Block_C_SORTED \
           TopN_Outlier_Pruning_Block_C_UNSORTED \
           TopN_Outlier_Pruning_Block_C_NO_BLOCKING

COMMON_SOURCES  := $(SOURCE_DIR)/top_n_outlier_pruning_block.c \
                   $(SOURCE_DIR)/stats.c \
                   $(SOURCE_DIR)/vardump.c
autoesl_SOURCES :=
binary_SOURCES  := $(SOURCE_DIR)/wrapper.c \
                   $(SOURCE_DIR)/test.c
matlab_SOURCES  := $(SOURCE_DIR)/matlab_wrapper.c


TopN_Outlier_Pruning_Block_C_SORTED_CFLAGS        := -DSORTED_INSERT
TopN_Outlier_Pruning_Block_C_SORTED_CXXFLAGS      := -DSORTED_INSERT
TopN_Outlier_Pruning_Block_C_SORTED_MXXFLAGS      := -DSORTED_INSERT

TopN_Outlier_Pruning_Block_C_UNSORTED_CFLAGS      := -DUNSORTED_INSERT
TopN_Outlier_Pruning_Block_C_UNSORTED_CXXFLAGS    := -DUNSORTED_INSERT
TopN_Outlier_Pruning_Block_C_UNSORTED_MXXFLAGS    := -DUNSORTED_INSERT

TopN_Outlier_Pruning_Block_C_NO_BLOCKING_CFLAGS   := -DNO_BLOCKING -DSORTED_INSERT
TopN_Outlier_Pruning_Block_C_NO_BLOCKING_CXXFLAGS := -DNO_BLOCKING -DSORTED_INSERT
TopN_Outlier_Pruning_Block_C_NO_BLOCKING_MXXFLAGS := -DNO_BLOCKING -DSORTED_INSERT

# Compile the MEX functions
$(foreach t,$(TARGETS),$(eval $(call target-template,$t)))


#------------------------------------------------------------------------------#
#                                                                              #
#                             BUILD_TYPE TARGETS                               #
#                                                                              #
#------------------------------------------------------------------------------#
.PHONY: all
all: $(BUILD_TYPES)
$(eval $(call release-template,all))
$(eval $(call debug-template,all))

$(foreach BUILD_TYPE,$(BUILD_TYPES),$(eval $(call build-type-template,$(BUILD_TYPE))))

.PHONY: release
release: all-release

.PHONY: debug
debug: all-debug

#------------------------------------------------------------------------------#
#                                                                              #
#                               CLEAN TARGETS                                  #
#                                                                              #
#------------------------------------------------------------------------------#
.PHONY: clean
clean: clean-all

.PHONY: clean-all
clean-all: $(foreach BUILD_TYPE,$(BUILD_TYPES),clean-$(BUILD_TYPE))

.PHONY: distclean
distclean: distclean-all

.PHONY: distclean-all
distclean-all: $(foreach BUILD_TYPE,$(BUILD_TYPES),distclean-$(BUILD_TYPE))


#------------------------------------------------------------------------------#
#                                                                              #
#                                INFO TARGET                                   #
#                                                                              #
#------------------------------------------------------------------------------#
.PHONY: info
info:
	$(print-variables)
	-@:
