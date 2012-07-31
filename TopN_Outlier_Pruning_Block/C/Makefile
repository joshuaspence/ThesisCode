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
# Default build configuration
.DEFAULT: release

TARGET     := TopN_Outlier_Pruning_Block
MEXTARGET  := $(TARGET:%=%.$(MEXEXT))

FILES      := top_n_outlier_pruning_block matlab_wrapper
SOURCES    := $(foreach f,$(FILES),$(addsuffix .c,$f))
DEPS       := $(foreach s,$(SOURCES),$(addsuffix .d,$s))

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
all: $(MEXTARGET)

$(MEXTARGET): $(SOURCES) $(DEPS)
	$(MXX) CFLAGS='$(CFLAGS)' CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) -o $@ $(filter %.c,$^)

.PHONY: clean
clean:
	@rm -f $(MEXTARGET) $(DEPS)
	@echo "clean completed"

.PHONY: distclean
distclean: clean

# Dependency generation
.PHONY: depend
depend: $(SOURCES) $(DEPS)

# Generate a dependency for a C file
%.c.d: %.c
	@echo $(MAKEDEPEND_TOKEN) > $@
	$(MAKEDEPEND) $(MAKEDEPEND_FLAGS) -f $@ -s $(MAKEDEPEND_TOKEN) -- $(CFLAGS) $(MXXFLAGS) -- $^ 2>/dev/null
	@sed -i 's/^.*\.o:/$(MEXTARGET):/' $@
	@rm $@.bak

# Generate a dependency for a C++ file
%.cpp.d: %.c
	@echo $(MAKEDEPEND_TOKEN) > $@
	$(MAKEDEPEND) $(MAKEDEPEND_FLAGS) -f $@ -s $(MAKEDEPEND_TOKEN) -- $(CXXFLAGS) $(MXXFLAGS) -- $^ 2>/dev/null
	@sed -i 's/^.*\.o:/$(MEXTARGET):/' $@

# Include generated dependency files
include $(wildcard *.d)
