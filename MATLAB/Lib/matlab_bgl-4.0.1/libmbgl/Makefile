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
CFLAGS   += -Wno-deprecated
CXXFLAGS += -Wno-deprecated
MXXFLAGS += 
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

# Archiver
ARCHIVER       := ar
ARCHIVER_FLAGS := rc

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
# Source files
FILES := components max_flow orderings searches shortest_path spanning_trees statistics layouts planar

# The output libraries
OUT_LIBS_32BIT          := libmbgl-linux-32
OUT_LIBS_64BIT          := libmbgl-linux-64
OUT_LIBS_64BIT_LARGE    := libmbgl-linux-64-large

# Directories
SOURCE_DIR              := .
OBJ_DIR_32BIT           := ./obj-32bit
OBJ_DIR_64BIT           := ./obj-64bit
OBJ_DIR_64BIT_LARGE     := ./obj-64bit_large
OUT_LIB_DIR             := .

# Additional flags for MXX
CFLAGS_32BIT            := 
CXXFLAGS_32BIT          :=
MXXFLAGS_32BIT          := 
CFLAGS_64BIT            := $(MEX_32BIT_FLAGS) -fPIC
CXXFLAGS_64BIT          := $(MEX_32BIT_FLAGS) -fPIC
MXXFLAGS_64BIT          := -largeArrayDims
CFLAGS_64BIT_LARGE      := $(MEX_64BIT_FLAGS) -DMATLAB_BGL_LARGE_ARRAYS
CXXFLAGS_64BIT_LARGE    := $(MEX_64BIT_FLAGS) -DMATLAB_BGL_LARGE_ARRAYS
MXXFLAGS_64BIT_LARGE    := $(MXXFLAGS_64BIT)

# The targets
OBJ_TARGETS_32BIT       := $(FILES:%=$(OBJ_DIR_32BIT)/%.o)
OBJ_TARGETS_64BIT       := $(FILES:%=$(OBJ_DIR_64BIT)/%.o)
OBJ_TARGETS_64BIT_LARGE := $(FILES:%=$(OBJ_DIR_64BIT_LARGE)/%.o)

OBJ_TARGETS             := $(OBJ_TARGETS_32BIT) $(OBJ_TARGETS_64BIT) $(OBJ_TARGETS_64BIT_LARGE)
LIB_TARGETS             := $(OUT_LIBS_32BIT:%=$(OUT_LIB_DIR)/%.a) \
                           $(OUT_LIBS_64BIT:%=$(OUT_LIB_DIR)/%.a) \
                           $(OUT_LIBS_64BIT_LARGE:%=$(OUT_LIB_DIR)/%.a)

# Include directories
INCLUDE_DIR             := . boost1.36/include
INCLUDE_FLAGS           := $(foreach include, $(INCLUDE_DIR), -I$(include))

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

all: $(LIB_TARGETS)

clean:
	@rm -f $(OBJ_TARGETS) $(LIB_TARGETS)
	@echo "clean completed"

distclean: clean

#------------------------------------------------------------------------------#
#                                                                              #
#                              DEPENDENCY RULES                                # 
#                                                                              #
#------------------------------------------------------------------------------#
# Objects (32-bit)
$(OBJ_DIR_32BIT)/%.o: $(SOURCE_DIR)/%.cc
	$(MXX) $(INCLUDE_FLAGS) CFLAGS='$(CFLAGS) $(CFLAGS_32BIT)' CXXFLAGS='$(CXXFLAGS) $(CXXFLAGS_32BIT)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) $(MXXFLAGS_32BIT) -c -outdir $(OBJ_DIR_32BIT) $^

# Objects (64-bit)
$(OBJ_DIR_64BIT)/%.o: $(SOURCE_DIR)/%.cc
	$(MXX) $(INCLUDE_FLAGS) CFLAGS='$(CFLAGS) $(CFLAGS_64BIT)' CXXFLAGS='$(CXXFLAGS) $(CXXFLAGS_64BIT)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) $(MXXFLAGS_64BIT) -c -outdir $(OBJ_DIR_64BIT) $^

# Objects (64-bit large)
$(OBJ_DIR_64BIT_LARGE)/%.o: $(SOURCE_DIR)/%.cc
	$(MXX) $(INCLUDE_FLAGS) CFLAGS='$(CFLAGS) $(CFLAGS_64BIT_LARGE)' CXXFLAGS='$(CXXFLAGS) $(CXXFLAGS_64BIT_LARGE)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) $(MXXFLAGS_64BIT_LARGE) -c -outdir $(OBJ_DIR_64BIT_LARGE) $^

# Archives (32-bit)
$(OUT_LIBS_32BIT:%=$(OUT_LIB_DIR)/%.a): $(OBJ_TARGETS_32BIT)
	$(ARCHIVER) $(ARCHIVER_FLAGS) $@ $^

# Archives (64-bit)
$(OUT_LIBS_64BIT:%=$(OUT_LIB_DIR)/%.a): $(OBJ_TARGETS_64BIT)
	$(ARCHIVER) $(ARCHIVER_FLAGS) $@ $^

# Archives (64-bit large)
$(OUT_LIBS_64BIT_LARGE:%=$(OUT_LIB_DIR)/%.a): $(OBJ_TARGETS_64BIT_LARGE)
	$(ARCHIVER) $(ARCHIVER_FLAGS) $@ $^
