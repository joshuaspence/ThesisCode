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
# add these to your user profile in order to specify your own.                 #
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
# USAGE OF RELEASE AND DEBUG MODE                                              #
# to compile a release file (without debug hooks and more efficient) just type #
# make. On the other hand, to enable debugging portions of the code (output)   #
# and add debugging links to the binary (needed for line by line execution)    #
# use :make debug"                                                             #
#                                                                              #
# EXPLANATION OF A RULE                                                        #
# anything (%) that terminates in .bin for which an explicit rule is not       #  
# available is made dependable on the file which has same name but .cpp        #
# extension. The compiler (CXX) with options (CXXFLAGS) is called on each of   #
# the elements that trigger the rule ($@, which is left side of ":") and       #
# produces an output with filename expressed by the "first" of elements from   #
# which it depends ($< or right side of ":")                                   #
#------------------------------------------------------------------------------#
# Default build configuration
.DEFAULT: release

TARGET     := TopN_Outlier_Pruning_Block
MEXTARGET  := $(TARGET:%=%.$(MEXEXT))

FILES      := $(TARGET) utility
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

%.mexa64: %.c $(SOURCES)
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
