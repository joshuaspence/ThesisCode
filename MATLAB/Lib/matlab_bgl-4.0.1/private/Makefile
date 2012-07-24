#------------------------------------------------------------------------------#
#                                                                              #
#                                FIND MATLAB                                   #
#                                                                              #
#------------------------------------------------------------------------------#
MATLAB_DIR := $(shell matlab -e 2>/dev/null | sed -n 's/MATLAB=\(.\+\)/\1/p')

#------------------------------------------------------------------------------#
#                                                                              #
#                              COMPILER FLAGS                                  #
#                                                                              #
#------------------------------------------------------------------------------#

# Default flags
CFLAGS   := $(shell $(MATLAB_DIR)/bin/mex -v 2>/dev/null | sed -n 's/\s*CFLAGS\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')
CXXFLAGS := $(shell $(MATLAB_DIR)/bin/mex -v 2>/dev/null | sed -n 's/\s*CXXFLAGS\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')
MXXFLAGS :=
LDFLAGS  := $(shell $(MATLAB_DIR)/bin/mex -v 2>/dev/null | sed -n 's/\s*LDFLAGS\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')

# Additional flags
CFLAGS   += -DMATLAB_BGL_LARGE_ARRAYS
CXXFLAGS += -DMATLAB_BGL_LARGE_ARRAYS
MXXFLAGS += -largeArrayDims
LDFLAGS  += 

# Debug flags
CFLAGS_DEBUG   := -g -O0 -DDEBUG
CXXFLAGS_DEBUG := -g -O0 -DDEBUG
MXXFLAGS_DEBUG := -g
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
#                                CONFIGURATION                                 # 
#                                                                              #
#------------------------------------------------------------------------------#
# The target files
FILES         := $(patsubst %.c,%,$(wildcard *.c))

# Libraries
#LIBS          := mbgl-linux-32 mbgl-linux-64 mbgl-linux-64-large
LIBS          := mbgl-linux-64-large

# The output directories
LIB_DIR       := ../libmbgl
OUT_DIR       := .
SOURCE_DIR    := .

# The targets
MEX_TARGETS   := $(FILES:%=$(OUT_DIR)/%.$(MEXEXT))

# Include directories
INCLUDE_DIR   := . ../libmbgl/include
INCLUDE_FLAGS := $(foreach include, $(INCLUDE_DIR), -I$(include))

# Library flags
LIBDIR_FLAGS  := $(LIB_DIR:%=-L%)
LIB_FLAGS     := $(LIBS:%=-l%)

#------------------------------------------------------------------------------#
#                                                                              #
#                                   TARGETS                                    # 
#                                                                              #
#------------------------------------------------------------------------------#
release: CFLAGS   += $(CFLAGS_OPT)
release: CXXFLAGS += $(CXXFLAGS_OPT)
release: MXXFLAGS += $(MXXFLAGS_OPT)
release: LDFLAGS  += $(LDFLAGS_OPT)
release: all

debug: CFLAGS   += $(CFLAGS_DEBUG)
debug: CXXFLAGS += $(CXXFLAGS_DEBUG)
debug: MXXFLAGS += $(MXXFLAGS_DEBUG)
debug: LDFLAGS  += $(LDFLAGS_DEBUG)
debug: all

all: $(MEX_TARGETS)

clean:
	@rm -f $(MEX_TARGETS)
	@echo "clean completed"

distclean: clean

#------------------------------------------------------------------------------#
#                                                                              #
#                              DEPENDENCY RULES                                # 
#                                                                              #
#------------------------------------------------------------------------------#
$(OUT_DIR)/%.$(MEXEXT): $(SOURCE_DIR)/%.c
	$(MXX) $(INCLUDE_FLAGS) CFLAGS='$(CFLAGS)' CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) $(LIBDIR_FLAGS) $(LIB_FLAGS) -o $@ $^
