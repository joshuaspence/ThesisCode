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

# Remove duplicate whitespace from a string. Removes the following:
#     - Repeated whitespace
#     - Leading whitespace
#     - Trailing whitespace
# $(call pretty,STRING)
define pretty
$(shell echo -n "$1" | sed \
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

# Test an architecture and see if MATLAB complains
# $(call try-architecture,ARCH)
define try-architecture
$(shell yes 'n' | $(MATLAB_DIR)/bin/matlab $1 -e 2>/dev/null | egrep -q 'No MATLAB bin directory for this machine architecture|Unsupported version' || echo 0)
endef

# Discover the system architecture to use for MATLAB
# $(call discover-architecture)
discover-architecture := $(if $(call try-architecture,),,$(foreach arch,$(ALL_ARCH),$(if $(call try-architecture,$(arch)),$(arch),)))

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

# makedepend
MAKEDEPEND       := makedepend
MAKEDEPEND_FLAGS := -Y
MAKEDEPEND_TOKEN := '\# MAKEDEPENDS'

# Parse options from the mex compiler
# $(call parse-mex-options,OPTION_NAME)
define parse-mex-options
$(shell $(MXX) -v 2>/dev/null | sed -n 's/\s*$1\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')
endef

# Remove a flag from a CFLAG-style string.
# $(call remove-flag,FLAGS,FLAG)
define remove-flag
$(shell echo -n $1 | sed 's/-$2\s\+//')
endef

# Default flags (these will be overridden)
CFLAGS   := $(call parse-mex-options,CFLAGS)
CXXFLAGS := $(call parse-mex-options,CXXFLAGS)
MXXFLAGS :=
LDFLAGS  := $(call parse-mex-options,LDFLAGS)

# Remove 'ANSI standard' flags
CFLAGS   := $(call remove-flag,$(CFLAGS),ansi)
CXXFLAGS := $(call remove-flag,$(CXXFLAGS),ansi)

# Additional flags
CFLAGS   += -std=c99 -W -Wall -pedantic -fmessage-length=0 -D__MEX__
CXXFLAGS += -std=c++0x -W -Wall -pedantic -fmessage-length=0 -D__MEX__
MXXFLAGS +=
LDFLAGS  +=

# Debug flags
CFLAGS_DEBUG   := -g -O0 -DDEBUG -DSTATS -DLOGGING -DLOG_LEVEL=LOG_LEVEL_0
CXXFLAGS_DEBUG := -g -O0 -DDEBUG -DSTATS -DLOGGING -DLOG_LEVEL=LOG_LEVEL_0
MXXFLAGS_DEBUG :=
LDFLAGS_DEBUG  := -g

# Optimization flags
CFLAGS_OPT   := -O3 -DNDEBUG
CXXFLAGS_OPT := -O3 -DNDEBUG
MXXFLAGS_OPT := -O
LDFLAGS_OPT  := -O3

#------------------------------------------------------------------------------#
#                                                                              #
#                              DEPENDENCY RULES                                #
#                                                                              #
#------------------------------------------------------------------------------#
.SUFFIXES:
.DEFAULT: release

TARGETS    := TopN_Outlier_Pruning_Block_C_SORTED \
              TopN_Outlier_Pruning_Block_C_UNSORTED \
              TopN_Outlier_Pruning_Block_C_NO_BLOCKING
FILES      := top_n_outlier_pruning_block matlab_wrapper stats
        
MEXTARGETS := $(foreach t,$(TARGETS),$(addsuffix .$(MEXEXT),$t))
SOURCES    := $(foreach f,$(FILES),$(addsuffix .c,$f))
DEPS       := $(foreach s,$(SOURCES),$(addsuffix .d,$s))

TopN_Outlier_Pruning_Block_C_SORTED_FLAGS      := -DSORTED_INSERT
TopN_Outlier_Pruning_Block_C_UNSORTED_FLAGS    := -DUNSORTED_INSERT
TopN_Outlier_Pruning_Block_C_NO_BLOCKING_FLAGS := -DNO_BLOCKING -DSORTED_INSERT

# $(call target-template,TARGET)
define target-template
$(1).$(MEXEXT): $(SOURCES) $(DEPS)
	-@echo "Compiling: $$@"
	$$(call pretty,$$(MXX) CFLAGS='$$(CFLAGS) $$($(1)_FLAGS)' CXXFLAGS='$$(CXXFLAGS) $$($(1)_FLAGS)' LDFLAGS='$$(LDFLAGS)' $$(MXXFLAGS) -o $$@ $$(filter %.c,$$^))
	-@echo
endef

# Compile the MEX functions
$(foreach t,$(TARGETS),$(eval $(call target-template,$t)))

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
all: $(MEXTARGETS)
	-@echo "Done."

#------------------------------------------------------------------------------#
#                                                                              #
#                               CLEAN TARGETS                                  #
#                                                                              #
#------------------------------------------------------------------------------#
.PHONY: clean
clean:
	-@echo "Cleaning..."
	rm -f $(MEXTARGETS) $(DEPS)
	-@echo "Clean completed."

.PHONY: distclean
distclean: clean
	-@echo "Cleaning..."
	rm -f *.d *.$(MEXEXT)
	-@echo "Clean completed."

#------------------------------------------------------------------------------#
#                                                                              #
#                             MAKEDEPEND TARGETS                               #
#                                                                              #
#------------------------------------------------------------------------------#

# Dependency generation
.PHONY: depend
depend: $(SOURCES) $(DEPS)

# Generate a dependency for a C file
# NOTE: We aren't making .o files, so we will pretend that the source files are
# the object files.
%.c.d: %.c
	-@echo "Creating dependency file: $@"
	@echo $(MAKEDEPEND_TOKEN) > $@
	$(call pretty,$(MAKEDEPEND) $(MAKEDEPEND_FLAGS) -o.c -f $@ -s $(MAKEDEPEND_TOKEN) -- $(CFLAGS) $(MXXFLAGS) -- $^ 2>/dev/null)
	-@rm $@.bak
	-@echo

# Generate a dependency for a C++ file
# NOTE: We aren't making .o files, so we will pretend that the source files are
# the object files.
%.cpp.d: %.c
	-@echo "Creating dependency file: $@"
	@echo $(MAKEDEPEND_TOKEN) > $@
	$(call pretty,$(MAKEDEPEND) $(MAKEDEPEND_FLAGS) -o.cpp -f $@ -s $(MAKEDEPEND_TOKEN) -- $(CXXFLAGS) $(MXXFLAGS) -- $^ 2>/dev/null)
	-@rm $@.bak
	-@echo

# Include generated dependency files
-include $(DEPS)

#------------------------------------------------------------------------------#
#                                                                              #
#                                INFO TARGET                                   #
#                                                                              #
#------------------------------------------------------------------------------#
.PHONY: info
info:
	$(call print-variables)
