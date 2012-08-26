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
TARGETS := TopN_Outlier_Pruning_Block_SORTED \
           TopN_Outlier_Pruning_Block_UNSORTED \
           TopN_Outlier_Pruning_Block_NO_BLOCKING \
           TopN_Outlier_Pruning_Block_HARDCODED

TopN_Outlier_Pruning_Block_SORTED_CFLAGS         = $(call flags,DBLOCKING DSORTED_INSERT)
TopN_Outlier_Pruning_Block_SORTED_CXXFLAGS       = $(call flags,DBLOCKING DSORTED_INSERT)
TopN_Outlier_Pruning_Block_SORTED_MXXFLAGS       = $(call flags,DBLOCKING DSORTED_INSERT)

TopN_Outlier_Pruning_Block_UNSORTED_CFLAGS       = $(call flags,DBLOCKING DUNSORTED_INSERT)
TopN_Outlier_Pruning_Block_UNSORTED_CXXFLAGS     = $(call flags,DBLOCKING DUNSORTED_INSERT)
TopN_Outlier_Pruning_Block_UNSORTED_MXXFLAGS     = $(call flags,DBLOCKING DUNSORTED_INSERT)

TopN_Outlier_Pruning_Block_NO_BLOCKING_CFLAGS   = $(call flags,DNO_BLOCKING DSORTED_INSERT)
TopN_Outlier_Pruning_Block_NO_BLOCKING_CXXFLAGS = $(call flags,DNO_BLOCKING DSORTED_INSERT)
TopN_Outlier_Pruning_Block_NO_BLOCKING_MXXFLAGS = $(call flags,DNO_BLOCKING DSORTED_INSERT)

TopN_Outlier_Pruning_Block_HARDCODED_CFLAGS     = $(call flags,DBLOCKING DSORTED_INSERT DHARDCODED_VECTOR_DIMS=200 DHARDCODED_K=15 DHARDCODED_N=40)
TopN_Outlier_Pruning_Block_HARDCODED_CXXFLAGS   = $(call flags,DBLOCKING DSORTED_INSERT DHARDCODED_VECTOR_DIMS=200 DHARDCODED_K=15 DHARDCODED_N=40)
TopN_Outlier_Pruning_Block_HARDCODED_MXXFLAGS   = $(call flags,DBLOCKING DSORTED_INSERT DHARDCODED_VECTOR_DIMS=200 DHARDCODED_K=15 DHARDCODED_N=40)

SOURCE_DIR           := source
COMMON_SOURCES       := $(SOURCE_DIR)/top_n_outlier_pruning_block.c \
                        $(SOURCE_DIR)/stats.c

autoesl_OUTPUT_DIR   := AutoESL
autoesl_TCLEXT       := tcl
autoesl_CFLAGS        = $(call flags,D__AUTOESL__)
autoesl_TOP_FUNC     := top_n_outlier_pruning_block
autoesl_PART         := xc6vlx240tff1156-1
autoesl_CLOCK_PERIOD := 10
autoesl_SOLUTION     := solution1
autoesl_SOURCES      :=
autoesl_TBSOURCES    :=
autoesl_TCLSOURCES   := $(SOURCE_DIR)/directives.tcl

binary_OUTPUT_DIR    := bin
binary_EXT           := bin
binary_CFLAGS         = $(call flags,D__C__ DVARDUMP)
binary_SOURCES       := $(SOURCE_DIR)/wrapper.c \
                        $(SOURCE_DIR)/test.c \
                        $(SOURCE_DIR)/vardump.c

matlab_OUTPUT_DIR    := bin
matlab_EXT            = $(MEXEXT)
matlab_CFLAGS         = $(call flags,D__MEX__ DVARDUMP)
matlab_SOURCES       := $(SOURCE_DIR)/matlab_wrapper.c \
                        $(SOURCE_DIR)/vardump.c


#------------------------------------------------------------------------------#
#                                                                              #
#                                 PROGRAMS                                     #
#                                                                              #
#------------------------------------------------------------------------------#
DELETE   := rm
DIRNAME  := dirname
ECHO     := echo
GREP     := egrep
MAKEDIR  := mkdir -p
READLINK := readlink -f
SED      := sed
TEST     := test
UNAME    := uname


#------------------------------------------------------------------------------#
#                                                                              #
#                              UTILITY MACROS                                  #
#                                                                              #
#------------------------------------------------------------------------------#

# $(call add-flags,CURRENT_FLAGS,FLAG FLAG ...)
# Add flags to a CFLAG-style string.
define add-flags
$(call pretty,
$(shell $(ECHO) -n "$(1) ")
$(foreach FLAG,$(2),$(shell \
$(ECHO) -n "$(1)" | \
$(GREP) -q "\-$(FLAG)" || \
$(ECHO) -n "-$(FLAG)"
))
)
endef

# $(call create-directory,DIRECTORY)
# Create a directory, if it does not yet e
define create-directory
-@if $$(TEST) ! -d $(1); then \
	$(call trace-message,"Creating directory: $(1)"); \
	$$(MAKEDIR) $(1); \
fi
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

# $(call flags,FLAG FLAG ...)
# Create a CFLAG-style string.
define flags
$(call pretty,$(foreach FLAG,$(1),-$(FLAG)))
endef

# $(call get-relative-path,FROM,TO)
# Get the relative file path between two directories.
get-relative-path = $(shell \
source="$$($(READLINK) $1)"; \
target="$$($(READLINK) $2)"; \
\
common_part="$$source"; \
back="."; \
while [ "$${target\#$$common_part}" = "$${target}" ]; do \
	common_part="$$($(DIRNAME) $$common_part)"; \
	back="$${back}/.."; \
done; \
\
back=$$($(ECHO) $$back | $(SED) 's/\.\///'); \
\
$(ECHO) $${back}$${target\#$$common_part}; \
)

# $(help-text)
# The text to be displayed when make is run without any targets.
define help_text
-@$(ECHO) "/==============================================================================\\"
-@$(ECHO) "|                          TopN_Outlier_Pruning_Block                          |"
-@$(ECHO) "\\==============================================================================/"
-@$(ECHO)
-@$(ECHO) " USAGE:"
-@$(ECHO) "     make [DEBUG=1] [mode=<BUILD_MODE>] (<TASK> | <BUILD_TYPE> | <TARGET> )"
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
-@$(ECHO) "     autoesl"
-@$(ECHO) "     binary"
-@$(ECHO) "     matlab"
-@$(ECHO) ""
-@$(ECHO) " BUILD_MODES:"
-@$(ECHO) "     debug"
-@$(ECHO) "     release (default)"
-@$(ECHO)
-@$(ECHO) " TARGETS:"
-@$(foreach TARGET,$(sort $(ALL_TARGETS)),$(ECHO) "     $(TARGET)";)
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

# $(call trace-message,msg)
# Print a message to STDOUT.
trace-message = -@$(ECHO) $1

# Characters that are hard to specify in certain places
space := $(empty) $(empty)
colon := \:
comma := ,

# Useful shell definitions
sh_true	 := :
sh_false := ! :

#-------------------------------------------------------------------------------

# $(eval $(all-template))
define all-template
################################################################################
# All targets
################################################################################
.PHONY: all
all: $$(ALL_TARGETS)


endef

# $(eval $(call build-type-template,BUILD_TYPE))
define build-type-template
################################################################################
# BUILD_TYPE = $(1)
################################################################################
.PHONY: $(1)
$(1): $$($(1)_TARGETS)

.PHONY: clean-$(1) distclean-$(1)
clean-$(1) distclean-$(1):
	$(call trace-message,"Cleaning $(1)...")
	$$(DELETE) -r -f $$($(1)_CLEAN)
	$(call trace-message,"Clean completed.")
	$(call trace-message,)


endef

# $(eval $(clean-all-template))
define clean-all-template
################################################################################
# Clean targets
################################################################################
.PHONY: clean clean-all
clean clean-all: clean-autoesl clean-binary clean-matlab

.PHONY: distclean distclean-all
distclean distclean-all: distclean-autoesl distclean-binary distclean-matlab


endef

# $(eval $(call autoesl-target-template,PROJECT,SOLUTION))
define autoesl-target-template
autoesl_CLEAN   += $$(autoesl_OUTPUT_DIR)/$(1) autoesl.log $$(autoesl_OUTPUT_DIR)/autobuild.log
ALL_CLEAN       += $$(autoesl_OUTPUT_DIR)/$(1)

# AutoESL: TCL scripts
autoesl_TARGETS += $$(autoesl_OUTPUT_DIR)/$(1).project.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).solution.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).elaborate.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).autosyn.$$(autoesl_TCLEXT)
autoesl_CLEAN   += $$(autoesl_OUTPUT_DIR)/$(1).project.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).solution.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).elaborate.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).autosyn.$$(autoesl_TCLEXT)
ALL_TARGETS     += $$(autoesl_OUTPUT_DIR)/$(1).project.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).solution.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).elaborate.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).autosyn.$$(autoesl_TCLEXT)
ALL_CLEAN       += $$(autoesl_OUTPUT_DIR)/$(1).project.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).solution.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).elaborate.$$(autoesl_TCLEXT) \
                   $$(autoesl_OUTPUT_DIR)/$(1).autosyn.$$(autoesl_TCLEXT)

$$(autoesl_OUTPUT_DIR)/$(1).project.$$(autoesl_TCLEXT):
	$(call create-directory,$$(autoesl_OUTPUT_DIR))
	$(call trace-message,"Creating TCL script: $$@")
	( \
		$$(ECHO) "cd $$(autoesl_OUTPUT_DIR)"; \
		$$(ECHO) "open_project $(1)"; \
		$$(ECHO) "set_top $$(autoesl_TOP_FUNC)"; \
		$$(foreach FILE,$$(COMMON_SOURCES) $$(autoesl_SOURCES),$$(ECHO) "add_file $$(call get-relative-path,$$(autoesl_OUTPUT_DIR),$$(CURDIR))/$$(FILE) -cflags \"$$(autoesl_CFLAGS) $$($(1)_CFLAGS)\"";) \
		$$(foreach FILE,$$(autoesl_TESTBENCH),$$(ECHO) "add_file -tb $$(call get-relative-path,$$(autoesl_OUTPUT_DIR),$$(CURDIR))/$$(FILE) -cflags \"$$(autoesl_CFLAGS) $$($(1)_CFLAGS)\"";) \
		$$(foreach TCL,$$(autoesl_TCLSOURCES),$$(ECHO) "source $$(call get-relative-path,$$(autoesl_OUTPUT_DIR),$$(CURDIR))/$$(TCL)";) \
		$$(ECHO) "exit"; \
	) > $$@
	$(call trace-message,)
$$(autoesl_OUTPUT_DIR)/$(1).solution.$$(autoesl_TCLEXT):
	$(call create-directory,$$(autoesl_OUTPUT_DIR))
	$(call trace-message,"Creating TCL script: $$@")
	( \
		$$(ECHO) "cd $$(autoesl_OUTPUT_DIR)"; \
		$$(ECHO) "open_project $(1)"; \
		$$(ECHO) "open_solution $(2)"; \
		$$(ECHO) "set_part {$$(autoesl_PART)}"; \
		$$(ECHO) "create_clock -period $$(autoesl_CLOCK_PERIOD)"; \
		$$(ECHO) "exit"; \
	) > $$@
	$(call trace-message,)
$$(autoesl_OUTPUT_DIR)/$(1).elaborate.$$(autoesl_TCLEXT):
	$(call create-directory,$$(autoesl_OUTPUT_DIR))
	$(call trace-message,"Creating TCL script: $$@")
	( \
		$$(ECHO) "cd $$(autoesl_OUTPUT_DIR)"; \
		$$(ECHO) "open_project $(1)"; \
		$$(ECHO) "open_solution $(2)"; \
		$$(ECHO) "elaborate"; \
		$$(ECHO) "exit"; \
	) > $$@
	$(call trace-message,)
$$(autoesl_OUTPUT_DIR)/$(1).autosyn.$$(autoesl_TCLEXT):
	$(call create-directory,$$(autoesl_OUTPUT_DIR))
	$(call trace-message,"Creating TCL script: $$@")
	( \
		$$(ECHO) "cd $$(autoesl_OUTPUT_DIR)"; \
		$$(ECHO) "open_project $(1)"; \
		$$(ECHO) "open_solution $(2)"; \
		$$(ECHO) "elaborate"; \
		$$(ECHO) "autosyn"; \
		$$(ECHO) "exit"; \
	) > $$@
	$(call trace-message,)

# AutoESL: Create project
autoesl_TARGETS += $$(autoesl_OUTPUT_DIR)/$(1)/autopilot.app
ALL_TARGETS     += $$(autoesl_OUTPUT_DIR)/$(1)/autopilot.app
$$(autoesl_OUTPUT_DIR)/$(1)/autopilot.app: $$(autoesl_OUTPUT_DIR)/$(1).project.$$(autoesl_TCLEXT)
	$(call trace-message,"Creating project: $$@")
	$$(AUTOESL) -f $$<
	$(call trace-message,)

# AutoESL: Create solution
autoesl_TARGETS += $$(autoesl_OUTPUT_DIR)/$(1)/$(2)/$(2).aps
ALL_TARGETS     += $$(autoesl_OUTPUT_DIR)/$(1)/$(2)/$(2).aps
$$(autoesl_OUTPUT_DIR)/$(1)/$(2)/$(2).aps: $$(autoesl_OUTPUT_DIR)/$(1).solution.$$(autoesl_TCLEXT) $$(autoesl_OUTPUT_DIR)/$(1)/autopilot.app
	$(call trace-message,"Creating solution: $$@")
	$$(AUTOESL) -f $$<
	$(call trace-message,)

# AutoESL: Elaborate
autoesl_TARGETS += $$(autoesl_OUTPUT_DIR)/$(1)/$(2)/$(2).directive
ALL_TARGETS     += $$(autoesl_OUTPUT_DIR)/$(1)/$(2)/$(2).directive
$$(autoesl_OUTPUT_DIR)/$(1)/$(2)/$(2).directive: $$(autoesl_OUTPUT_DIR)/$(1).elaborate.$$(autoesl_TCLEXT) $$(autoesl_OUTPUT_DIR)/$(1)/$(2)/$(2).aps
	$(call trace-message,"Elaborating: $$@")
	$$(AUTOESL) -f $$<
	$(call trace-message,)

# AutoESL: Synthesise
$(1)_AUTOESL_TARGETS := $$(autoesl_OUTPUT_DIR)/$(1)/$(2)/syn/systemc/$$(autoesl_TOP_FUNC).cpp \
                        $$(autoesl_OUTPUT_DIR)/$(1)/$(2)/syn/systemc/$$(autoesl_TOP_FUNC).h \
                        $$(autoesl_OUTPUT_DIR)/$(1)/$(2)/syn/verilog/$$(autoesl_TOP_FUNC).v \
                        $$(autoesl_OUTPUT_DIR)/$(1)/$(2)/syn/vhdl/AESL_pkg.vhd \
                        $$(autoesl_OUTPUT_DIR)/$(1)/$(2)/syn/vhdl/$$(autoesl_TOP_FUNC).vhd
autoesl_TARGETS += $$($(1)_AUTOESL_TARGETS)
ALL_TARGETS     += $$($(1)_AUTOESL_TARGETS)
$$($(1)_AUTOESL_TARGETS): $$(autoesl_OUTPUT_DIR)/$(1).autosyn.$$(autoesl_TCLEXT) $$(autoesl_OUTPUT_DIR)/$(1)/$(2)/$(2).directive
	$(call trace-message,"Synthesising: $$@")
	$$(AUTOESL) -f $$<
	$(call trace-message,)

endef

# $(eval $(call target-template,TARGET))
define target-template
################################################################################
# TARGET = $(1)
################################################################################
# AutoESL
$(call autoesl-target-template,$(1),$(autoesl_SOLUTION))

# Binary
binary_TARGETS += $$(binary_OUTPUT_DIR)/$(1).$$(binary_EXT)
binary_CLEAN   += $$(binary_OUTPUT_DIR)/$(1).$$(binary_EXT)
ALL_TARGETS    += $$(binary_OUTPUT_DIR)/$(1).$$(binary_EXT)
ALL_CLEAN      += $$(binary_OUTPUT_DIR)/$(1).$$(binary_EXT)
$$(binary_OUTPUT_DIR)/$(1).$$(binary_EXT): $$(COMMON_SOURCES) $$(binary_SOURCES)
	$(call create-directory,$$(binary_OUTPUT_DIR))
	$(call trace-message,"Compiling: $$@")
	$$(call pretty,$$(CC) $$(binary_CFLAGS) $$(CFLAGS) $$($(1)_CFLAGS) -o $$@ $$^)
	$(call trace-message,)

# Matlab
matlab_TARGETS += $$(matlab_OUTPUT_DIR)/$(1).$$(matlab_EXT)
matlab_CLEAN   += $$(matlab_OUTPUT_DIR)/$(1).$$(matlab_EXT)
ALL_TARGETS    += $$(matlab_OUTPUT_DIR)/$(1).$$(matlab_EXT)
ALL_CLEAN      += $$(matlab_OUTPUT_DIR)/$(1).$$(matlab_EXT)
$$(matlab_OUTPUT_DIR)/$(1).$$(matlab_EXT): $$(COMMON_SOURCES) $$(matlab_SOURCES)
	$(call create-directory,$$(matlab_OUTPUT_DIR))
	$(call trace-message,"Compiling: $$@")
	$$(call pretty,$$(MXX) $$(matlab_CFLAGS) $$(MXXFLAGS) $$($(1)_MXXFLAGS) CFLAGS='$$(CFLAGS) $$($(1)_CFLAGS)' CXXFLAGS='$$(CXXFLAGS) $$($(1)_CXXFLAGS)' LDFLAGS='$$(LDFLAGS)' -o $$@ $$^)
	$(call trace-message,)


endef


#------------------------------------------------------------------------------#
#                                                                              #
#                             MATLAB CONFIGURATION                             #
#                                                                              #
#------------------------------------------------------------------------------#
MATLAB_DIR := $(shell matlab -e 2>/dev/null | $(SED) -n -e 's/MATLAB=\(.\+\)/\1/p')
ARCH       := $(shell matlab -e 2>/dev/null | $(SED) -n -e 's/ARCH=\(.\+\)/\1/p')

ifndef MXX
	ifeq ($(shell $(UNAME)),Darwin)
		MXX      := $(call pretty,$(MATLAB_DIR)/bin/mex -$(ARCH))
		MEXEXT   := $(shell $(MATLAB_DIR)/bin/mexext)
		MXXFLAGS := -I$(MATLAB_DIR)/extern/include
	endif
	ifeq ($(shell $(UNAME)),Linux)
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
AUTOESL   := autoesl


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

# Architecture specific
ifeq ($(ARCH_TYPE), x86)
MXXFLAGS := $(call add-flags,$(MXXFLAGS),compatibleArrayDims)
endif
ifeq ($(ARCH_TYPE), x64)
MXXFLAGS := $(call add-flags,$(MXXFLAGS),largeArrayDims)
endif

# Debug flags
CFLAGS_DEBUG   := g O0 DDEBUG DSTATS
CXXFLAGS_DEBUG := g O0 DDEBUG DSTATS
MXXFLAGS_DEBUG := DDEBUG DSTATS
LDFLAGS_DEBUG  := g

# Optimization flags
CFLAGS_OPT     := O3 DNDEBUG
CXXFLAGS_OPT   := O3 DNDEBUG
MXXFLAGS_OPT   := O DNDEBUG
LDFLAGS_OPT    := O3

ifeq ($(mode),)
CFLAGS   := $(call add-flags,$(CFLAGS),$(CFLAGS_OPT))
CXXFLAGS := $(call add-flags,$(CXXFLAGS),$(CXXFLAGS_OPT))
MXXFLAGS := $(call add-flags,$(MXXFLAGS),$(MXXFLAGS_OPT))
LDFLAGS  := $(call add-flags,$(LDFLAGS),$(LDFLAGS_OPT))
else
ifeq ($(mode),debug)
CFLAGS   := $(call add-flags,$(CFLAGS),$(CFLAGS_DEBUG))
CXXFLAGS := $(call add-flags,$(CXXFLAGS),$(CXXFLAGS_DEBUG))
MXXFLAGS := $(call add-flags,$(MXXFLAGS),$(MXXFLAGS_DEBUG))
LDFLAGS  := $(call add-flags,$(LDFLAGS),$(LDFLAGS_DEBUG))
else
ifeq ($(mode),release)
CFLAGS   := $(call add-flags,$(CFLAGS),$(CFLAGS_OPT))
CXXFLAGS := $(call add-flags,$(CXXFLAGS),$(CXXFLAGS_OPT))
MXXFLAGS := $(call add-flags,$(MXXFLAGS),$(MXXFLAGS_OPT))
LDFLAGS  := $(call add-flags,$(LDFLAGS),$(LDFLAGS_OPT))
else
$(error Invalid mode specified. Valid modes are 'debug' and 'release')
endif
endif
endif


#------------------------------------------------------------------------------#
#                                                                              #
#                               MACRO EXPANSION                                #
#                                                                              #
#------------------------------------------------------------------------------#
$(foreach t,$(TARGETS),$(call evaluate,$(call target-template,$t)))

$(call evaluate,$(call build-type-template,autoesl))
$(call evaluate,$(call build-type-template,binary))
$(eval $(call build-type-template,matlab))

$(call evaluate,$(all-template))
$(call evaluate,$(clean-all-template))


#------------------------------------------------------------------------------#
#                                                                              #
#                                INFO TARGET                                   #
#                                                                              #
#------------------------------------------------------------------------------#
.PHONY: info
info:
	$(print-variables)
	$(sh_true)	
