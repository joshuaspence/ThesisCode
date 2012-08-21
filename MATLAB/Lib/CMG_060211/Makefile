#------------------------------------------------------------------------------#
#                                                                              #
#                                MAKE OPTIONS                                  #
#                                                                              #
#------------------------------------------------------------------------------#
.SUFFIXES:
.DEFAULT: release
release:


#------------------------------------------------------------------------------#
#                                                                              #
#                                FIND MATLAB                                   #
#                                                                              #
#------------------------------------------------------------------------------#
MATLAB_DIR := $(shell matlab -e 2>/dev/null | sed -n 's/MATLAB=\(.\+\)/\1/p')


#------------------------------------------------------------------------------#
#                                                                              #
#                              UTILITY MACROS                                  #
#                                                                              #
#------------------------------------------------------------------------------#

# $(call discover-architecture)
# Discover the system architecture to use for MATLAB.
discover-architecture := $(if $(call try-architecture,),,$(foreach arch,$(ALL_ARCH),$(if $(call try-architecture,$(arch)),$(arch),)))

# $(call parse-mex-options,OPTION_NAME)
# Parse options from the mex compiler.
define parse-mex-options
$(shell $(MXX) -v 2>/dev/null | sed -n 's/\s*$1\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')
endef

# $(call pretty,STRING)
# Remove duplicate whitespace from a string. Removes the following:
#     - Repeated whitespace
#     - Leading whitespace
#     - Trailing whitespace
define pretty
$(shell echo -n "$1" | sed \
-e 's/\s\s\+/ /' \
-e 's/^\s\+//' \
-e 's/\s\+$$//'
)
endef

# $(call remove-flag,FLAGS,FLAG)
# Remove a flag from a CFLAG-style string.
define remove-flag
$(shell echo -n $1 | sed 's/-$2\s\+//')
endef

# $(call try-architecture,ARCH)
# Test an architecture and see if MATLAB complains.
define try-architecture
$(shell yes 'n' | $(MATLAB_DIR)/bin/matlab $1 -e 2>/dev/null | egrep -q 'No MATLAB bin directory for this machine architecture|Unsupported version' || echo 0)
endef


#------------------------------------------------------------------------------#
#                                                                              #
#                            DETECT ARCHITECTURE                               #
#                                                                              #
# This seemed to be necessary when running a 32-bit student version of MATLAB  #
# on a 64-bit machine, for example. Basically, try different architecture      #
# flags until MATLAB stops complaining.                                        #
#                                                                              #
#------------------------------------------------------------------------------#
ALL_ARCH := -glnx86 -glnxa64 -mac -maci -maci64 -sol2 -sol64
ARCH := $(call discover-architecture)


#------------------------------------------------------------------------------#
#                                                                              #
#                            ARCHITECTURE VARIABLES                            #
#                                                                              #
#------------------------------------------------------------------------------#
ifndef MXX
	ifeq ($(shell uname),Darwin)
		MXX      := $(call pretty,$(MATLAB_DIR)/bin/mex $(ARCH))
		MEXEXT   := $(shell $(MATLAB_DIR)/bin/mexext)
		MXXFLAGS := -I$(MATLAB_DIR)/extern/include
	endif
	ifeq ($(shell uname),Linux)
		MXX      := $(call pretty,$(MATLAB_DIR)/bin/mex $(ARCH))
		MEXEXT   := $(shell $(MATLAB_DIR)/bin/mexext)
		MXXFLAGS := -I$(MATLAB_DIR)/extern/include
	endif
else
	MEXEXT := $(shell MEXEXT)
endif

# If the architecture has been overriden, then the mexext script won't return
# the correct extension.
ifneq ($(ARCH),)
	ifeq ($(strip $(ARCH)),-glnx86)
		MEXEXT := mexglx
	endif
	ifeq ($(strip $(ARCH)),-glnxa64)
		MEXEXT := mexa64
	endif
	ifeq ($(strip $(ARCH)),-mac)
		MEXEXT := mexmac
	endif
	ifeq ($(strip $(ARCH)),-maci)
		MEXEXT := mexmaci
	endif
	ifeq ($(strip $(ARCH)),-maci64)
		MEXEXT := mexmaci64
	endif
	ifeq ($(strip $(ARCH)),-sol2)
		MEXEXT := mexsol
	endif
	ifeq ($(strip $(ARCH)),-sol64)
		MEXEXT := mexs64
	endif
	ifeq ($(strip $(ARCH)),-win64)
		MEXEXT := mexw64
	endif
	ifeq ($(strip $(ARCH)),-win32)
		MEXEXT := mexw32
	endif
endif


#------------------------------------------------------------------------------#
#                                                                              #
#                              COMPILER FLAGS                                  #
#                                                                              #
#------------------------------------------------------------------------------#

# Default flags (these will be overridden)
CFLAGS   := $(call parse-mex-options,CFLAGS)
CXXFLAGS := $(call parse-mex-options,CXXFLAGS)
MXXFLAGS :=
LDFLAGS  := $(call parse-mex-options,LDFLAGS)

# Remove 'ANSI standard' flags
CFLAGS   := $(call remove-flag,$(CFLAGS),ansi)
CXXFLAGS := $(call remove-flag,$(CXXFLAGS),ansi)

# Additional flags
CFLAGS   += -std=c99 -pedantic -fmessage-length=0
CXXFLAGS += -std=c++0x -pedantic -fmessage-length=0
MXXFLAGS += -largeArrayDims
LDFLAGS  +=

# Debug flags
CFLAGS_DEBUG   := -g -O0
CXXFLAGS_DEBUG := -g -O0
MXXFLAGS_DEBUG := -DDEBUG
LDFLAGS_DEBUG  := -g

# Optimization flags
CFLAGS_OPT   := -O3
CXXFLAGS_OPT := -O3
MXXFLAGS_OPT := -O -DNDEBUG
LDFLAGS_OPT  := -O3


#------------------------------------------------------------------------------#
#                                                                              #
#                              DEPENDENCY RULES                                #
#                                                                              #
#------------------------------------------------------------------------------#

SOURCE_DIR := Source
OUTPUT_DIR := MATLAB
MXXFLAGS   += -IInclude
ALL_TARGETS :=

# $(call target-template,TARGET)
define target-template
ALL_TARGETS += $$($(1)_TARGET)
ALL_DEPS    += $$($(1)_DEPS)

$$($(1)_TARGET): $$($(1)_SOURCES)
	-@echo "Compiling: $$@"
	$$(call pretty,$$(MXX) $$(MXXFLAGS) $$($(1)_FLAGS) CFLAGS='$$(CFLAGS)' CXXFLAGS='$$(CXXFLAGS)' LDFLAGS='$$(LDFLAGS)' -o $$@ $$^)
	-@echo
endef

# $(call matlab-target-template,TARGET)
define matlab-target-template
$(1)_TARGET  := $$(OUTPUT_DIR)/Hierarchy/MexFunctions/$(1).$$(MEXEXT)
$(1)_SOURCES := $$(SOURCE_DIR)/Hierarchy/$(1).c
$(1)_FLAGS   :=

$(call target-template,$(1))
endef

# MATLAB targets
MATLAB_TARGETS := adjacency_cmg diagconjugate forest_components graphprofile laplacian2 perturbtril splitforest update_groups vpack
$(foreach TARGET,$(MATLAB_TARGETS),$(eval $(call matlab-target-template,$(TARGET))))

# Solver targets
SOLVER_COMMON := vpv vmv vpvmv vvmul rmvec ldl_solve spmv sspmv preconditioner

mx_s_preconditioner_TARGET  := $(OUTPUT_DIR)/Solver/mx_s_preconditioner.$(MEXEXT)
mx_s_preconditioner_SOURCES := $(foreach file,$(SOLVER_COMMON),$(SOURCE_DIR)/Solver/$(file).c)
mx_s_preconditioner_FLAGS   := -DSINGLE_PR
$(eval $(call target-template,mx_s_preconditioner))

mx_d_preconditioner_TARGET  := $(OUTPUT_DIR)/Solver/mx_d_preconditioner.$(MEXEXT)
mx_d_preconditioner_SOURCES := $(foreach file,$(SOLVER_COMMON),$(SOURCE_DIR)/Solver/$(file).c)
mx_d_preconditioner_FLAGS   :=
$(eval $(call target-template,mx_d_preconditioner))


# Release build
release: CFLAGS   += $(CFLAGS_OPT)
release: CXXFLAGS += $(CXXFLAGS_OPT)
release: MXXFLAGS += $(MXXFLAGS_OPT)
release: LDFLAGS  += $(LDFLAGS_OPT)
release: all

# Debug build
debug:   CFLAGS   += $(CFLAGS_DEBUG)
debug:   CXXFLAGS += $(CXXFLAGS_DEBUG)
debug:   MXXFLAGS += $(MXXFLAGS_DEBUG)
debug:   LDFLAGS  += $(LDFLAGS_DEBUG)
debug:   all

.PHONY: all
all: $(ALL_TARGETS)
	-@echo "Done."

#------------------------------------------------------------------------------#
#                                                                              #
#                               CLEAN TARGETS                                  #
#                                                                              #
#------------------------------------------------------------------------------#
.PHONY: clean
clean:
	-@echo "Cleaning..."
	$(call pretty,rm -f $(ALL_TARGETS))
	-@echo "Clean completed."

.PHONY: distclean
distclean: clean
	-@echo "Cleaning..."
	$(call pretty,rm -f *.$(MEXEXT))
	-@echo "Clean completed."
