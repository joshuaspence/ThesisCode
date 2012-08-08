#------------------------------------------------------------------------------#
#                                                                              #
#                                FIND MATLAB                                   #
#                                                                              #
#------------------------------------------------------------------------------
MATLAB_DIR := $(shell matlab -e 2>/dev/null | sed -n 's/MATLAB=\(.\+\)/\1/p')

# Detect architecture
ALL_ARCH := -glnx86 -glnxa64 -mac -maci -maci64 -sol2 -sol64
define try-architecture
$(shell echo 'n' | $(MATLAB_DIR)/bin/matlab $1 -e 2>/dev/null | egrep -q 'No MATLAB bin directory for this machine architecture|Unsupported version' || echo 0)
endef
discover_architecture := $(if $(call try-architecture,),,$(foreach arch,$(ALL_ARCH),$(if $(call try-architecture,$(arch)),$(arch),)))
ARCH := $(call discover_architecture)

#------------------------------------------------------------------------------#
#                                                                              #
#                              COMPILER FLAGS                                  #
#                                                                              #
#------------------------------------------------------------------------------#

# makedepend
MAKEDEPEND       := makedepend
MAKEDEPEND_FLAGS := -Y
MAKEDEPEND_TOKEN := '\# MAKEDEPENDS'

# Default flags
CFLAGS   := $(shell $(MATLAB_DIR)/bin/mex $(ARCH) -v 2>/dev/null | sed -n 's/\s*CFLAGS\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')
CXXFLAGS := $(shell $(MATLAB_DIR)/bin/mex $(ARCH) -v 2>/dev/null | sed -n 's/\s*CXXFLAGS\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')
MXXFLAGS :=
LDFLAGS  := $(shell $(MATLAB_DIR)/bin/mex $(ARCH) -v 2>/dev/null | sed -n 's/\s*LDFLAGS\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')

# Remove 'ANSI standard' flags
CFLAGS   := $(shell echo -n $(CFLAGS) | sed 's/-ansi\s\+//')
CXXFLAGS := $(shell echo -n $(CXXFLAGS) | sed 's/-ansi\s\+//')

# Additional flags
CFLAGS   += -std=c99 -W -Wall -pedantic -fmessage-length=0
CXXFLAGS += -std=c++0x -W -Wall -pedantic -fmessage-length=0
MXXFLAGS +=
LDFLAGS  +=

# Debug flags
CFLAGS_DEBUG   := -g -O0 -DDEBUG
CXXFLAGS_DEBUG := -g -O0 -DDEBUG
MXXFLAGS_DEBUG :=
LDFLAGS_DEBUG  := -g

# Optimization flags
CFLAGS_OPT   := -O3 -DNDEBUG
CXXFLAGS_OPT := -O3 -DNDEBUG
MXXFLAGS_OPT := -O
LDFLAGS_OPT  := -O3

#------------------------------------------------------------------------------#
#                                                                              #
#                            ARCHITECTURE VARIABLES                            #
#                                                                              #
#------------------------------------------------------------------------------#
ifndef MXX
	ifeq ($(shell uname),Darwin)
		MXX      := $(MATLAB_DIR)/bin/mex $(ARCH)
		MEXEXT   := $(shell $(MATLAB_DIR)/bin/mexext)
		MXXFLAGS += -I$(MATLAB_DIR)/extern/include
	endif
	ifeq ($(shell uname),Linux)
		MXX      := $(MATLAB_DIR)/bin/mex $(ARCH)
		MEXEXT   := $(shell $(MATLAB_DIR)/bin/mexext)
		MXXFLAGS += -I$(MATLAB_DIR)/extern/include
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
	ifeq ($(strip $(ARCH)), "-mac")
		MEXEXT := mexmac
	endif
	ifeq ($(strip $(ARCH)), "-maci")
		MEXEXT := mexmaci
	endif
	ifeq ($(strip $(ARCH)), "-maci64")
		MEXEXT := mexmaci64
	endif
	ifeq ($(strip $(ARCH)), "-sol2")
		MEXEXT := mexsol
	endif
	ifeq ($(strip $(ARCH)), "-sol64")
		MEXEXT := mexs64
	endif
	ifeq ($(strip $(ARCH)), "-win64")
		MEXEXT := mexw64
	endif
	ifeq ($(strip $(ARCH)), "-win32")
		MEXEXT := mexw32
	endif
endif

#------------------------------------------------------------------------------#
#                                                                              #
#                              DEPENDENCY RULES                                #
#                                                                              #
#------------------------------------------------------------------------------#
.SUFFIXES:
.DEFAULT: release

TARGETS    := TopN_Outlier_Pruning_Block_C_SORTED \
              TopN_Outlier_Pruning_Block_C_UNSORTED
MEXTARGETS := $(foreach t,$(TARGETS),$(addsuffix .$(MEXEXT),$t))
FILES      := top_n_outlier_pruning_block matlab_wrapper
SOURCES    := $(foreach f,$(FILES),$(addsuffix .c,$f))
DEPS       := $(foreach s,$(SOURCES),$(addsuffix .d,$s))

TopN_Outlier_Pruning_Block_C_SORTED_FLAGS   := -DSORTED_INSERT
TopN_Outlier_Pruning_Block_C_UNSORTED_FLAGS := -DUNSORTED_INSERT

define target-template
$(1).$$(MEXEXT): $(SOURCES) $(DEPS)
	-@echo "Compiling: $$@"
	$$(MXX) CFLAGS='$$(CFLAGS) $$($(1)_FLAGS)' CXXFLAGS='$$(CXXFLAGS) $$($(1)_FLAGS)' LDFLAGS='$$(LDFLAGS)' $$(MXXFLAGS) -o $$@ $$(filter %.c,$$^)
	-@echo
endef

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

# Compile the MEX functions
$(foreach t,$(TARGETS),$(eval $(call target-template,$t)))

.PHONY: all
all: $(MEXTARGETS)
	-@echo "Done."

.PHONY: clean
clean:
	-@echo "Cleaning..."
	rm -f $(MEXTARGETS) $(DEPS)
	-@echo "Clean completed."

.PHONY: distclean
distclean: clean

# Dependency generation
.PHONY: depend
 depend: $(SOURCES) $(DEPS)
	
# Generate a dependency for a C file
# NOTE: We aren't making .o files, so we will pretend that the source files are
# the object files.
%.c.d: %.c
	-@echo "Creating dependency file: $@"
	@echo $(MAKEDEPEND_TOKEN) > $@
	$(MAKEDEPEND) $(MAKEDEPEND_FLAGS) -o.c -f $@ -s $(MAKEDEPEND_TOKEN) -- $(CFLAGS) $(MXXFLAGS) -- $^ 2>/dev/null
	-@rm $@.bak
	-@echo

# Generate a dependency for a C++ file
# NOTE: We aren't making .o files, so we will pretend that the source files are
# the object files.
%.cpp.d: %.c
	-@echo "Creating dependency file: $@"
	@echo $(MAKEDEPEND_TOKEN) > $@
	$(MAKEDEPEND) $(MAKEDEPEND_FLAGS) -o.cpp -f $@ -s $(MAKEDEPEND_TOKEN) -- $(CXXFLAGS) $(MXXFLAGS) -- $^ 2>/dev/null
	-@rm $@.bak
	-@echo
	
# Include generated dependency files
include $(wildcard *.d)
