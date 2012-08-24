#------------------------------------------------------------------------------#
#                                                                              #
#                               DEFAULT TARGET                                 #
#                                                                              #
#------------------------------------------------------------------------------#
.SUFFIXES:
.DEFAULT: help
.PHONY: help
help:
	$(help_text)


#------------------------------------------------------------------------------#
#                                                                              #
#                                CONFIGURATION                                 #
#                                                                              #
#------------------------------------------------------------------------------#
BUILD_TYPES        := autoesl binary matlab

autoesl_OUTPUT_DIR := bin
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

# $(call add-flags,CURRENT_FLAGS,FLAG FLAG ...)
# Add flags to a CFLAG-style string.
define add-flags
$(call pretty,
	$(foreach FLAG,$(2),$(shell \
		$(ECHO) -n "$(1)" | \
		$(GREP) -q "\-$(FLAG)" && \
			$(ECHO) -n "$(1)" || \
			$(ECHO) -n "$(1) -$(FLAG)"
	))
)
endef

# $(call evaluate,EVAL_CMD)
# An alternative to $(eval) that will call $(info) as well as $(eval), if DEBUG
# is defined.
ifdef DEBUG
define evaluate
$(info $(1))$(eval $(1))
endef
else
define evaluate
$(eval $(1))
endef
endif

# $(help-text)
# The text to be displayed when make is run without any targets.
define help_text
-@$(ECHO) "/==============================================================================\\"
-@$(ECHO) "|                          TopN_Outlier_Pruning_Block                          |"
-@$(ECHO) "\\==============================================================================/"
-@$(ECHO)
-@$(ECHO) " USAGE:"
-@$(ECHO) "     make [DEBUG=.] ("
-@$(ECHO) "                     <TASK> |"
-@$(ECHO) "                     <BUILD_TYPE>[-<BUILD_MODE>] |"
-@$(ECHO) "                     <TARGET>[-<BUILD_MODE>]"
-@$(ECHO) "                    )"
-@$(ECHO)
-@$(ECHO) " TASKS:"
-@$(ECHO) "     clean"
-@$(ECHO) "     clean-<BUILD_TYPE>"
-@$(ECHO) "     distclean"
-@$(ECHO) "     distclean-<BUILD_TYPE>"
-@$(ECHO) "     help"
-@$(ECHO) "     info"
-@$(ECHO)
-@$(ECHO) " BUILD_TYPES:"
-@$(ECHO) "     all"
-@$(foreach TYPE,$(BUILD_TYPES),$(ECHO) "     $(TYPE)";)
-@$(ECHO) ""
-@$(ECHO) " BUILD_MODES:"
-@$(ECHO) "     debug"
-@$(ECHO) "     release (default)"
-@$(ECHO)
-@$(ECHO) " TARGETS:"
-@$(foreach TARGET,$(ALL_TARGETS),$(ECHO) "     $(TARGET)";)
-@$(ECHO)
endef

# $(call parse-mex-options,OPTION_NAME)
# Parse options from the mex compiler.
define parse-mex-options
$(shell \
	$(MXX) -v 2>/dev/null | \
	$(SED) -n -e 's/\s*$(1)\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p'
)
endef

# $(call pretty,STRING)
# Remove duplicate whitespace from a string. Removes the following:
#     - Repeated whitespace
#     - Leading whitespace
#     - Trailing whitespace
define pretty
$(shell \
	$(ECHO) -n "$(1)" | \
	$(SED) \
		-e 's/\s\s\+/ /' \
		-e 's/^\s\+//' \
		-e 's/\s\+$$//'
)
endef

# $(call print-variable,var)
# Print the name and value of a variable.
print-variable = $(info $(1)=$($(1)))

# $(call print-variables)
# Print all makefile variables.
define print-variables
$(foreach VAR,$(sort $(filter-out print-variable%,$(.VARIABLES))), 
	$(if $(filter file,$(origin $(VAR))),
		$(call print-variable,$(VAR))))
endef

# $(call remove-flag,CURRENT_FLAGS,FLAG FLAG ...)
# Remove a flag from a CFLAG-style string.
define remove-flags
$(shell \
	$(ECHO) -n "$(1)" | \
	$(SED) $(foreach FLAG,$(2), -e 's/-$(FLAG)\s\+//')
)
endef

#-------------------------------------------------------------------------------

# $(eval $(all-template))
# Create an "all" targets, along with associated release and debug targets.
define all-template
# All targets
.PHONY: all all-release release all-debug debug
all all-release release: set-release $$(ALL_TARGETS)
all-debug debug: set-debug $$(ALL_TARGETS)


endef

# $(eval $(call build-type-template,BUILD_TYPE))
define build-type-template
# BUILD_TYPE = $(1)
.PHONY: $(1) $(1)-release $(1)-debug
$(1) $(1)-release: set-release $$($(1)_TARGETS)
$(1)-debug: set-debug $$($(1)_TARGETS)

.PHONY: clean-$(1) distclean-$(1)
clean-$(1) distclean-$(1):
	-@$$(ECHO) "Cleaning $(1)..."
	$$(DELETE) -f $$($(1)_TARGETS)
	-@$$(ECHO) "Clean completed."
	-@$$(ECHO)


endef

# $(eval $(clean-all-template))
define clean-all-template
# Clean targets
.PHONY: clean clean-$(1)
clean clean-all: $$(foreach BUILD_TYPE,$$(BUILD_TYPES),clean-$$(BUILD_TYPE))

.PHONY: distclean distclean-all
distclean distclean-all: $$(foreach BUILD_TYPE,$$(BUILD_TYPES),clean-$$(BUILD_TYPE))


endef

# $(eval $(call target-template,TARGET))
define target-template
# TARGET = $(1)
autoesl_TARGETS += $$(autoesl_OUTPUT_DIR)/$(1).$$(autoesl_EXT)
#ALL_TARGETS     += $$(autoesl_OUTPUT_DIR)/$(1).$$(autoesl_EXT)
$$(autoesl_OUTPUT_DIR)/$(1).$$(autoesl_EXT): $$(COMMON_SOURCES) $$(autoesl_SOURCES)
	@if $$(TEST) ! -d $$(autoesl_OUTPUT_DIR); then \
		$$(ECHO) "Creating directory: $$(autoesl_OUTPUT_DIR)"; \
		$$(MAKEDIR) $$(autoesl_OUTPUT_DIR); \
	fi
	-@$$(ECHO) "Compiling: $$@"
	$$(call pretty,$$(CC) $$(autoesl_FLAGS) $$(ESLFLAGS) $$($(1)_CFLAGS) -o $$@ $$^)
	-@$$(ECHO)

binary_TARGETS += $$(binary_OUTPUT_DIR)/$(1).$$(binary_EXT)
ALL_TARGETS    += $$(binary_OUTPUT_DIR)/$(1).$$(binary_EXT)
$$(binary_OUTPUT_DIR)/$(1).$$(binary_EXT): $$(COMMON_SOURCES) $$(binary_SOURCES)
	-@if $$(TEST) ! -d $$(binary_OUTPUT_DIR); then \
		$$(ECHO) "Creating directory: $$(binary_OUTPUT_DIR)"; \
		$$(MAKEDIR) $$(binary_OUTPUT_DIR); \
	fi
	-@$$(ECHO) "Compiling: $$@"
	$$(call pretty,$$(CC) $$(binary_FLAGS) $$(CFLAGS) $$($(1)_CFLAGS) -o $$@ $$^)
	-@$$(ECHO)

matlab_TARGETS += $$(matlab_OUTPUT_DIR)/$(1).$$(matlab_EXT)
ALL_TARGETS    += $$(matlab_OUTPUT_DIR)/$(1).$$(matlab_EXT)
$$(matlab_OUTPUT_DIR)/$(1).$$(matlab_EXT): $$(COMMON_SOURCES) $$(matlab_SOURCES)
	-@if $$(TEST) ! -d $$(matlab_OUTPUT_DIR); then \
		$$(ECHO) "Creating directory: $$(matlab_OUTPUT_DIR)"; \
		$$(MAKEDIR) $$(matlab_OUTPUT_DIR); \
	fi
	-@$$(ECHO) "Compiling: $$@"
	$$(call pretty,$$(MXX) $$(matlab_FLAGS) $$(MXXFLAGS) $$($(1)_MXXFLAGS) CFLAGS='$$(CFLAGS) $$($(1)_CFLAGS)' CXXFLAGS='$$(CXXFLAGS) $$($(1)_CXXFLAGS)' LDFLAGS='$$(LDFLAGS)' -o $$@ $$^)
	-@$$(ECHO)


endef

# $(eval set-debug-template)
define set-debug-template
# Enable debug flags
.PHONY: set-debug
set-debug: CFLAGS   += $$(CFLAGS_DEBUG)
set-debug: CXXFLAGS += $$(CXXFLAGS_DEBUG)
set-debug: MXXFLAGS += $$(MXXFLAGS_DEBUG)
set-debug: LDFLAGS  += $$(LDFLAGS_DEBUG)
set-debug: ESLFLAGS += $$(ESLFLAGS_DEBUG)

endef

# $(eval set-release-template)
define set-release-template
# Enable optimisation flags
.PHONY: set-release
set-release: CFLAGS   += $$(CFLAGS_OPT)
set-release: CXXFLAGS += $$(CXXFLAGS_OPT)
set-release: MXXFLAGS += $$(MXXFLAGS_OPT)
set-release: LDFLAGS  += $$(LDFLAGS_OPT)
set-release: ESLFLAGS += $$(ESLFLAGS_OPT)

endef


#------------------------------------------------------------------------------#
#                                                                              #
#                             MATLAB CONFIGURATION                             #
#                                                                              #
#------------------------------------------------------------------------------#
MATLAB_DIR := $(shell matlab -e 2>/dev/null | $(SED) -n -e 's/MATLAB=\(.\+\)/\1/p')
ARCH       := $(shell matlab -e 2>/dev/null | $(SED) -n -e 's/ARCH=\(.\+\)/\1/p')

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
CFLAGS   := $(call remove-flags,$(CFLAGS),ansi)
CXXFLAGS := $(call remove-flags,$(CXXFLAGS),ansi)

# Additional flags
CFLAGS   := $(call add-flags,$(CFLAGS),std=c99 W Wall pedantic fmessage-length=0)
CXXFLAGS := $(call add-flags,$(CXXFLAGS),std=c++0x W Wall pedantic fmessage-length=0)
MXXFLAGS := $(call add-flags,$(MXXFLAGS),DVARDUMP)
#LDFLAGS  := $(call add-flags,$(ESLFLAGS),)
#ESLFLAGS := $(call add-flags,$(ESLFLAGS),)

# Architecture specific
ifeq ($(ARCH_TYPE), x86)
#CFLAGS   := $(call add-flags,$(CFLAGS),)
#CXXFLAGS := $(call add-flags,$(CXXFLAGS),)
MXXFLAGS := $(call add-flags,$(MXXFLAGS),compatibleArrayDims)
#LDFLAGS  := $(call add-flags,$(LDFLAGS),)
#ESLFLAGS := $(call add-flags,$(ESLFLAGS),)
endif
ifeq ($(ARCH_TYPE), x64)
#CFLAGS   := $(call add-flags,$(CFLAGS),)
#CXXFLAGS := $(call add-flags,$(CXXFLAGS),)
MXXFLAGS := $(call add-flags,$(MXXFLAGS),largeArrayDims)
#LDFLAGS  := $(call add-flags,$(LDFLAGS),)
#ESLFLAGS := $(call add-flags,$(ESLFLAGS),)
endif

# Debug flags
CFLAGS_DEBUG   := $(call add-flags,,g O0 DDEBUG DSTATS)
CXXFLAGS_DEBUG := $(call add-flags,,g O0 DDEBUG DSTATS)
MXXFLAGS_DEBUG := $(call add-flags,,DDEBUG DSTATS)
LDFLAGS_DEBUG  := $(call add-flags,,g)
ESLFLAGS_DEBUG :=

# Optimization flags
CFLAGS_OPT   := $(call add-flags,,O3 DNDEBUG)
CXXFLAGS_OPT := $(call add-flags,,O3 DNDEBUG)
MXXFLAGS_OPT := $(call add-flags,,O DNDEBUG)
LDFLAGS_OPT  := $(call add-flags,,O3)
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


TopN_Outlier_Pruning_Block_C_SORTED_CFLAGS        := $(call add-flags,,DSORTED_INSERT)
TopN_Outlier_Pruning_Block_C_SORTED_CXXFLAGS      := $(call add-flags,,DSORTED_INSERT)
TopN_Outlier_Pruning_Block_C_SORTED_MXXFLAGS      := $(call add-flags,,DSORTED_INSERT)

TopN_Outlier_Pruning_Block_C_UNSORTED_CFLAGS      := $(call add-flags,,DUNSORTED_INSERT)
TopN_Outlier_Pruning_Block_C_UNSORTED_CXXFLAGS    := $(call add-flags,,DUNSORTED_INSERT)
TopN_Outlier_Pruning_Block_C_UNSORTED_MXXFLAGS    := $(call add-flags,,DUNSORTED_INSERT)

TopN_Outlier_Pruning_Block_C_NO_BLOCKING_CFLAGS   := $(call add-flags,,DNO_BLOCKING DSORTED_INSERT)
TopN_Outlier_Pruning_Block_C_NO_BLOCKING_CXXFLAGS := $(call add-flags,,DNO_BLOCKING DSORTED_INSERT)
TopN_Outlier_Pruning_Block_C_NO_BLOCKING_MXXFLAGS := $(call add-flags,,DNO_BLOCKING DSORTED_INSERT)


#------------------------------------------------------------------------------#
#                                                                              #
#                               MACRO EXPANSION                                #
#                                                                              #
#------------------------------------------------------------------------------#
$(foreach t,$(TARGETS),$(call evaluate,$(call target-template,$t)))
$(foreach BUILD_TYPE,$(BUILD_TYPES),$(call evaluate,$(call build-type-template,$(BUILD_TYPE))))

$(call evaluate,$(all-template))
$(call evaluate,$(clean-all-template))
$(call evaluate,$(set-debug-template))
$(call evaluate,$(set-release-template))


#------------------------------------------------------------------------------#
#                                                                              #
#                                INFO TARGET                                   #
#                                                                              #
#------------------------------------------------------------------------------#
.PHONY: info
info:
	$(print-variables)
	-@:
