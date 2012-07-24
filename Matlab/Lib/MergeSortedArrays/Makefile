#------------------------------------------------------------------------------#
#                                                                              #
#                                FIND MATLAB                                   #
#                                                                              #
#------------------------------------------------------------------------------
MATLAB_DIR := $(shell matlab -e 2>/dev/null | sed -n 's/MATLAB=\(.\+\)/\1/p')

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
CFLAGS   := $(shell $(MATLAB_DIR)/bin/mex -v 2>/dev/null | sed -n 's/\s*CFLAGS\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')
CXXFLAGS := $(shell $(MATLAB_DIR)/bin/mex -v 2>/dev/null | sed -n 's/\s*CXXFLAGS\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')
MXXFLAGS :=
LDFLAGS  := $(shell $(MATLAB_DIR)/bin/mex -v 2>/dev/null | sed -n 's/\s*LDFLAGS\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')

# Remove 'ANSI standard' flags
CFLAGS   := $(shell echo -n $(CFLAGS) | sed 's/-ansi\s\+//')
CXXFLAGS := $(shell echo -n $(CXXFLAGS) | sed 's/-ansi\s\+//')

# Additional flags
CFLAGS   += -std=c99 -W -Wall -pedantic -fmessage-length=0
CXXFLAGS += -std=c++0x -W -Wall -pedantic -fmessage-length=0
MXXFLAGS += -largeArrayDims
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
		MXX      := $(MATLAB_DIR)/bin/mex
		MEXEXT   := $(shell $(MATLAB_DIR)/bin/mexext)
		MXXFLAGS += -I$(MATLAB_DIR)/extern/include
	endif
	ifeq ($(shell uname),Linux)
		MXX      := $(MATLAB_DIR)/bin/mex
		MEXEXT   := $(shell $(MATLAB_DIR)/bin/mexext) 
		MXXFLAGS += -I$(MATLAB_DIR)/extern/include
	endif
else
	MEXEXT := $(shell MEXEXT) 
endif

#------------------------------------------------------------------------------#
#                                                                              #
#                              DEPENDENCY RULES                                # 
#                                                                              #
#------------------------------------------------------------------------------#
# Default build configuration
.DEFAULT: release

TARGET     := mergerowsmex mergemex
MEXTARGET  := $(TARGET:%=%.$(MEXEXT))

FILES      := $(TARGET)
SOURCES    := $(foreach f,$(FILES),$(addsuffix .c,$f))
DEPS       := $(foreach s,$(SOURCES),$(addsuffix .d,$s))
OBJS       := $(foreach f,$(FILES),$(addsuffix .o,$f))

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

all: depend $(MEXTARGET)

%.$(MEXEXT): %.c
	$(MXX) CFLAGS='$(CFLAGS)' CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) -o $@ $(filter %.c,$^)
	
clean:
	@rm -f $(MEXTARGET) $(DEPS) $(foreach d,$(DEPS),$(addsuffix .bak,$d))
	@echo "clean completed"

# Dependency generation
depend: $(SOURCES)
depend: $(DEPS)

# Generate a dependency for a C file
%.c.d: %.c
	@echo $(MAKEDEPEND_TOKEN) > $@
	$(MAKEDEPEND) $(MAKEDEPEND_FLAGS) -f $@  -s $(MAKEDEPEND_TOKEN) -- $(CFLAGS) $(MXXFLAGS) -- $^ 2>/dev/null
	@sed -i 's/^.*\.o:/$(MEXTARGET):/' $@

# Generate a dependency for a C++ file
%.cpp.d: %.c
	@echo $(MAKEDEPEND_TOKEN) > $@
	$(MAKEDEPEND) $(MAKEDEPEND_FLAGS) -f $@  -s $(MAKEDEPEND_TOKEN) -- $(CXXFLAGS) $(MXXFLAGS) -- $^ 2>/dev/null
	@sed -i 's/^.*\.o:/$(MEXTARGET):/' $@

# Include generated dependency files
include $(wildcard *.d)
