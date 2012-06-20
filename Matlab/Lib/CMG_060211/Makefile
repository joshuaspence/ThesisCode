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
CFLAGS   += 
CXXFLAGS += 
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
MEX_FUNCTIONS_OBJ_TARGETS    := 
MEX_FUNCTIONS_MEX_TARGETS    := adjacency_cmg diagconjugate forest_components graphprofile laplacian2 perturbtril splitforest update_groups vpack
SOLVER_OBJ_TARGETS           := vpv vmv vpvmv vvmul rmvec ldl_solve sspmv preconditioner
SOLVER_SP_MEX_TARGETS        := mx_s_preconditioner
SOLVER_DP_MEX_TARGETS        := mx_d_preconditioner

# The output directories
MEX_FUNCTIONS_OBJ_TARGET_DIR := MATLAB/Hierarchy/MexFunctions
MEX_FUNCTIONS_MEX_TARGET_DIR := MATLAB/Hierarchy/MexFunctions
SOLVER_SP_OBJ_TARGET_DIR     := MATLAB/Solver/sp
SOLVER_DP_OBJ_TARGET_DIR     := MATLAB/Solver/dp
SOLVER_TARGET_DIR            := MATLAB/Solver

# Additional flags for MXX
MEX_FUNCTIONS_FLAGS          :=
SOLVER_FLAGS_SP              := -DSINGLE_PR
SOLVER_FLAGS_DP              :=

# The targets
OBJ_TARGETS                  := $(MEX_FUNCTIONS_OBJ_TARGETS:%=$(MEX_FUNCTIONS_OBJ_TARGET_DIR)/%.o) \
                                $(SOLVER_OBJ_TARGETS:%=$(SOLVER_SP_OBJ_TARGET_DIR)/%.o) \
								$(SOLVER_OBJ_TARGETS:%=$(SOLVER_DP_OBJ_TARGET_DIR)/%.o)
MEX_TARGETS                  := $(MEX_FUNCTIONS_MEX_TARGETS:%=$(MEX_FUNCTIONS_MEX_TARGET_DIR)/%.$(MEXEXT)) \
                                $(SOLVER_SP_MEX_TARGETS:%=$(SOLVER_TARGET_DIR)/%.$(MEXEXT)) \
                                $(SOLVER_DP_MEX_TARGETS:%=$(SOLVER_TARGET_DIR)/%.$(MEXEXT))

# The source files
MEX_FUNCTIONS_SOURCE_DIR     := Source/Hierarchy
SOLVER_SOURCE_DIR            := Source/Solver

# Include directories
INCLUDE_DIR                 := Include
INCLUDE_FLAGS               := $(foreach include, $(INCLUDE_DIR), -I$(include))

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
	@rm -f $(OBJ_TARGETS) $(MEX_TARGETS)
	@echo "clean completed"

distclean: clean

#------------------------------------------------------------------------------#
#                                                                              #
#                              DEPENDENCY RULES                                # 
#                                                                              #
#------------------------------------------------------------------------------#
# MexFunctions (objects)
$(MEX_FUNCTIONS_OBJ_TARGET_DIR)/%.o: $(MEX_FUNCTIONS_SOURCE_DIR)/%.c
	$(MXX) $(MEX_FUNCTIONS_FLAGS) $(INCLUDE_FLAGS) CFLAGS='$(CFLAGS)' CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) -c -outdir $(MEX_FUNCTIONS_OBJ_TARGET_DIR) $^

# MexFunctions (mex)
$(MEX_FUNCTIONS_MEX_TARGET_DIR)/%.$(MEXEXT): $(MEX_FUNCTIONS_SOURCE_DIR)/%.c
	$(MXX) $(MEX_FUNCTIONS_FLAGS) $(INCLUDE_FLAGS) CFLAGS='$(CFLAGS)' CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) -o $@ $^

# Solver single precision (objects)
$(SOLVER_SP_OBJ_TARGET_DIR)/%.o: $(SOLVER_SOURCE_DIR)/%.c
	$(MXX) $(SOLVER_FLAGS_SP) $(INCLUDE_FLAGS) CFLAGS='$(CFLAGS)' CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) -c -outdir $(SOLVER_SP_OBJ_TARGET_DIR) $^

# Solver single precision (mex)
$(SOLVER_SP_MEX_TARGETS:%=$(SOLVER_TARGET_DIR)/%.$(MEXEXT)): $(SOLVER_SP_MEX_TARGETS:%=$(SOLVER_TARGET_DIR)/%.c) $(SOLVER_OBJ_TARGETS:%=$(SOLVER_SP_OBJ_TARGET_DIR)/%.o)
	$(MXX) $(SOLVER_FLAGS_SP) $(INCLUDE_FLAGS) CFLAGS='$(CFLAGS)' CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) -o $@ $^

# Solver double precision (objects)
$(SOLVER_DP_OBJ_TARGET_DIR)/%.o: $(SOLVER_SOURCE_DIR)/%.c
	$(MXX) $(SOLVER_FLAGS_DP) $(INCLUDE_FLAGS) CFLAGS='$(CFLAGS)' CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) -c -outdir $(SOLVER_DP_OBJ_TARGET_DIR) $^

# Solver double precision (mex)
$(SOLVER_DP_MEX_TARGETS:%=$(SOLVER_TARGET_DIR)/%.$(MEXEXT)): $(SOLVER_DP_MEX_TARGETS:%=$(SOLVER_TARGET_DIR)/%.c) $(SOLVER_OBJ_TARGETS:%=$(SOLVER_DP_OBJ_TARGET_DIR)/%.o)
	$(MXX) $(SOLVER_FLAGS_DP) $(INCLUDE_FLAGS) CFLAGS='$(CFLAGS)' CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) -o $@ $^
