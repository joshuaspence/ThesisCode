#------------------------------------------------------------------------------#
#                                                                              #
#                                MAKE OPTIONS                                  #
#                                                                              #
#------------------------------------------------------------------------------#
ALL_TARGETS :=
ALL_OBJS    :=

.SUFFIXES:
.DEFAULT: release
release:

#------------------------------------------------------------------------------#
#                                                                              #
#                                FIND MATLAB                                   #
#                                                                              #
#------------------------------------------------------------------------------#
MATLAB_DIR := $(shell matlab -e 2>/dev/null | sed -n 's/MATLAB=\(.\+\)/\1/p')
ARCH       := $(shell matlab -e 2>/dev/null | sed -n 's/ARCH=\(.\+\)/\1/p')

#------------------------------------------------------------------------------#
#                                                                              #
#                              UTILITY MACROS                                  #
#                                                                              #
#------------------------------------------------------------------------------#

# $(call parse-mex-options,OPTION_NAME)
# Parse options from the mex compiler.
define parse-mex-options
$(shell $(MXX) -v 2>/dev/null | sed -n 's/\s*$1\s*=\s*\(\(-.\+\s\+\)\+\)/\1/p')
endef

# $(call pretty,STRING)
# Remove duplicate whitespace from a string. Removes the following:
#	 - Repeated whitespace
#	 - Leading whitespace
#	 - Trailing whitespace
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

#-------------------------------------------------------------------------------

# $(call object-template,OBJECT)
define object-template
ALL_OBJS += $$(LIB_OUTPUT_DIR)/$(1).o

$$(LIB_OUTPUT_DIR)/$(1).o: $$(LIB_SOURCE_DIR)/$(1).cc
	-@echo "Compiling: $$@"
	$$(call pretty,$$(MXX) $$(MXXFLAGS) CFLAGS='$$(CFLAGS)' CXXFLAGS='$$(CXXFLAGS)' LDFLAGS='$$(LDFLAGS)' -c -outdir $$(LIB_OUTPUT_DIR) $$^)
	-@echo
endef

# $(call private-target,TARGET)
define private-target
ALL_TARGETS += $$(OUTPUT_DIR)/$(1).$$(MEXEXT)

$$(OUTPUT_DIR)/$(1).$$(MEXEXT): $$(SOURCE_DIR)/$(1).c $$(LIB_OUTPUT_DIR)/lib$$(LIB).a
	-@echo "Compiling: $$@"
	$$(call pretty,$$(MXX) $$(MXXFLAGS) $$(PRIVATE_MXXFLAGS) CFLAGS='$$(CFLAGS) $$(PRIVATE_CFLAGS)' CXXFLAGS='$$(CXXFLAGS) $$(PRIVATE_CXXFLAGS)' LDFLAGS='$$(LDFLAGS)' -o $$@ $$<)
	-@echo
endef


#------------------------------------------------------------------------------#
#                                                                              #
#                            ARCHITECTURE VARIABLES                            #
#                                                                              #
#------------------------------------------------------------------------------#
ifndef MXX
	ifeq ($(shell uname),Darwin)
		MXX	  := $(call pretty,$(MATLAB_DIR)/bin/mex -$(ARCH))
		MEXEXT   := $(shell $(MATLAB_DIR)/bin/mexext)
		MXXFLAGS := -I$(MATLAB_DIR)/extern/include
	endif
	ifeq ($(shell uname),Linux)
		MXX	  := $(call pretty,$(MATLAB_DIR)/bin/mex -$(ARCH))
		MEXEXT   := $(shell $(MATLAB_DIR)/bin/mexext)
		MXXFLAGS := -I$(MATLAB_DIR)/extern/include
	endif
else
	MEXEXT := $(shell MEXEXT)
endif

ifeq ($(ARCH),glnx86)
	MEXEXT    := mexglx
	ARCH_TYPE := x86
	LIB       := mbgl-linux-32
endif
ifeq ($(ARCH),glnxa64)
	MEXEXT    := mexa64
	ARCH_TYPE := x64
	LIB       := mbgl-linux-64-large
endif
ifeq ($(ARCH),mac)
	MEXEXT    := mexmac
	ARCH_TYPE := x86
	LIB       := mbgl-macosx-ppc-32
endif
ifeq ($(ARCH),maci)
	MEXEXT    := mexmaci
	ARCH_TYPE := x86
	LIB       := mbgl-macosx-intel-32
endif
ifeq ($(ARCH),maci64)
	MEXEXT    := mexmaci64
	ARCH_TYPE := x64
endif
ifeq ($(ARCH),sol2)
	MEXEXT    := mexsol
	ARCH_TYPE := x86
	LIB       :=
endif
ifeq ($(ARCH),sol64)
	MEXEXT    := mexs64
	ARCH_TYPE := x64
	LIB       :=
endif
ifeq ($(ARCH),win64)
	MEXEXT    := mexw64
	ARCH_TYPE := x64
	LIB       := mbgl-pcwin64-large
endif
ifeq ($(ARCH),win32)
	MEXEXT    := mexw32
	ARCH_TYPE := x86
	LIB       := mbgl-pcwin32
endif


#------------------------------------------------------------------------------#
#                                                                              #
#                              COMPILER FLAGS                                  #
#                                                                              #
#------------------------------------------------------------------------------#

# Default flags (these will be overridden)
CFLAGS   := $(call parse-mex-options,CFLAGS)
CXXFLAGS := $(call parse-mex-options,CXXFLAGS)
LDFLAGS  := $(call parse-mex-options,LDFLAGS)

# Remove 'ANSI standard' flags
CFLAGS   := $(call remove-flag,$(CFLAGS),ansi)
CXXFLAGS := $(call remove-flag,$(CXXFLAGS),ansi)

# Additional flags
CFLAGS   += -fmessage-length=0 -Wno-deprecated
CXXFLAGS += -fmessage-length=0 -Wno-deprecated
MXXFLAGS +=
LDFLAGS  +=

# Architecture specific
ifeq ($(ARCH_TYPE), x86)
CFLAGS   +=
CXXFLAGS +=
MXXFLAGS += -compatibleArrayDims
LDFLAGS  +=
endif
ifeq ($(ARCH_TYPE), x64)
CFLAGS   += -fPIC -DMATLAB_BGL_LARGE_ARRAYS
CXXFLAGS += -fPIC -DMATLAB_BGL_LARGE_ARRAYS
MXXFLAGS += -largeArrayDims -DMATLAB_BGL_LARGE_ARRAYS
LDFLAGS  +=
endif

# Debug flags
CFLAGS_DEBUG   := -g -O0 -DDEBUG -D_DEBUG
CXXFLAGS_DEBUG := -g -O0 -DDEBUG -D_DEBUG
MXXFLAGS_DEBUG := -DDEBUG -D_DEBUG
LDFLAGS_DEBUG  := -g

# Optimization flags
CFLAGS_OPT   := -O3 -DNDEBUG
CXXFLAGS_OPT := -O3 -DNDEBUG
MXXFLAGS_OPT := -O -DNDEBUG
LDFLAGS_OPT  := -O3

# Archiver
ARCHIVER	   := ar
ARCHIVER_FLAGS := rc


#------------------------------------------------------------------------------#
#                                                                              #
#                              DEPENDENCY RULES                                #
#                                  libmbgl                                     #
#                                                                              #
#------------------------------------------------------------------------------#

LIB_SOURCE_DIR := libmbgl
LIB_OUTPUT_DIR := libmbgl
MXXFLAGS   += -I$(LIB_SOURCE_DIR)/ -I$(LIB_SOURCE_DIR)/boost1.36/include

FILES := components max_flow orderings searches shortest_path spanning_trees statistics layouts planar

ALL_TARGETS += $(LIB_OUTPUT_DIR)/lib$(LIB).a

$(foreach FILE,$(FILES),$(eval $(call object-template,$(FILE))))

$(LIB_OUTPUT_DIR)/lib$(LIB).a: $(ALL_OBJS)
	-@echo "Archiving: $@"	
	$(call pretty,$(ARCHIVER) $(ARCHIVER_FLAGS) $@ $^)
	$(call pretty,rm $(ALL_OBJS))
	-@echo


#------------------------------------------------------------------------------#
#                                                                              #
#                              DEPENDENCY RULES                                #
#                                  private                                     #
#                                                                              #
#------------------------------------------------------------------------------#

SOURCE_DIR := private
OUTPUT_DIR := private

PRIVATE_CFLAGS   += -Wall
PRIVATE_CXXFLAGS += -Wall
PRIVATE_MXXFLAGS += -I$(SOURCE_DIR) -I$(LIB_OUTPUT_DIR)/include -L$(LIB_OUTPUT_DIR) -l$(LIB)

FILES := biconnected_components_mex \
		 test_matching_mex \
		 matching_mex \
		 astar_search_mex \
		 bfs_dfs_vis_mex \
		 topological_order_mex \
		 fruchterman_reingold_mex \
		 mst_mex \
		 dominator_tree_mex \
		 kamada_kawai_spring_layout_mex \
		 path_from_pred_mex \
		 planar_edges_mex \
		 matlab_bgl_all_sp_mex \
		 components_mex \
		 max_flow_mex \
		 core_numbers_mex \
		 clustering_coefficients_mex \
		 dfs_mex \
		 matlab_bgl_sp_mex \
		 planar_test_mex \
		 betweenness_centrality_mex \
		 planar_drawing_mex \
		 gursoy_atun_mex \
		 bfs_mex

$(foreach FILE,$(FILES),$(eval $(call private-target,$(FILE))))


#------------------------------------------------------------------------------#
#                                                                              #
#                                  TARGETS                                     #
#                                                                              #
#------------------------------------------------------------------------------#

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
	$(call pretty,rm -f $(ALL_TARGETS) $(ALL_OBJS))
	-@echo "Clean completed."

.PHONY: distclean
distclean: clean
