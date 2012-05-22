#------------------------------------------------------------------------------#
#                                                                              #
#                              COMPILER FLAGS                                  #
#                                                                              #
#------------------------------------------------------------------------------#

# Default flags
CFLAGS   := -D_GNU_SOURCE -fexceptions -fPIC -fno-omit-frame-pointer -pthread
CXXFLAGS := -D_GNU_SOURCE -fPIC -fno-omit-frame-pointer -pthread
MXXFLAGS :=
LDFLAGS  :=

# Additional flags
CFLAGS   += -std=c99   -W -Wall -pedantic -fmessage-length=0
CXXFLAGS += -std=c++0x -W -Wall -pedantic -fmessage-length=0
MXXFLAGS += 
LDFLAGS  += 

#------------------------------------------------------------------------------#
#                                                                              #
#                            ARCHITECTURE VARIABLES                            #
#                                                                              #
# add these to your user profile in order to specify your own.                 #
#------------------------------------------------------------------------------#
MATLAB_DIR := MATLAB/R2012a
ifndef MXX
	ifeq ($(shell uname),Darwin)
		MXX      := /Applications/$(MATLAB_DIR)/bin/mex
		MEXEXT   := $(shell /Applications/$(MATLAB_DIR)/bin/mexext)
		MXXFLAGS += -I/Applications/$(MATLAB_DIR)/extern/include
		LDFLAGS  += -pthread -shared -Wl,--version-script,/Applications/$(MATLAB_DIR)/extern/lib/glnxa64/mexFunction.map -Wl,--no-undefined
	endif
	ifeq ($(shell uname),Linux)
		MXX      := /usr/local/$(MATLAB_DIR)/bin/mex
		MEXEXT   := $(shell /usr/local/$(MATLAB_DIR)/bin/mexext) 
		MXXFLAGS += -I/usr/local/$(MATLAB_DIR)/extern/include
		LDFLAGS  += -pthread -shared -Wl,--version-script,/usr/local/$(MATLAB_DIR)/extern/lib/glnxa64/mexFunction.map -Wl,--no-undefined
	endif
else
	MEXEXT := $(shell MEXEXT) 
endif

#------------------------------------------------------------------------------#
#                                                                              #
#                              OTHER VARIABLES                                 #
#                                                                              #
#------------------------------------------------------------------------------#
ARCHIVENAME := TopN_Outlier_Pruning_Block

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
HDRS       := 
TARGET     :=  TopN_Outlier_Pruning_Block
#BINTARGET := $(TARGET:%=%.bin)
MEXTARGET  := $(TARGET:%=%.$(MEXEXT))

release: CFLAGS   += -O3
release: CXXFLAGS += -O3
release: all

debug: CFLAGS   += -DDEBUG -g -O0
debug: CXXFLAGS += -DDEBUG -g -O0
debug: MXXFLAGS += -DDEBUG -g
debug: all

all: $(BINTARGET) $(MEXTARGET)

%.bin: %.c
	$(CXX) $(CXXFLAGS) -o $@ $<

%.mexa64: %.c
	$(MXX) CFLAGS='$(CFLAGS)' CXXFLAGS='$(CXXFLAGS)' LDFLAGS='$(LDFLAGS)' $(MXXFLAGS) -o $@ $<
	
clean:
	@rm -f $(BINTARGET) $(MEXTARGET)
	@echo "clean completed"
	
#------------------------------------------------------------------------------#
#                                                                              #
#                   CREATE A DISTRIBUTION IN A ZIP FILE                        #
#                                                                              #
# move resources to a kdtree folder, tar them, then remove the temp directory  # 
# and its content completely                                                   #
#------------------------------------------------------------------------------#
dist:   
	rm -rf $(ARCHIVENAME)
	mkdir $(ARCHIVENAME)
	cp *.mexmaci $(ARCHIVENAME)
	cp *.m $(ARCHIVENAME)
	cp -L *.h $(ARCHIVENAME) #follow symlinks
	cp *.cpp $(ARCHIVENAME)
	cp CHANGES $(ARCHIVENAME)
	cp TODO $(ARCHIVENAME)
	cp README $(ARCHIVENAME)
	cp Makefile $(ARCHIVENAME)
	#tar -cvf $(ARCHIVENAME).tar.gz $(ARCHIVENAME)
	zip -r -v ${ARCHIVENAME}.zip ${ARCHIVENAME}
	rm -rf $(ARCHIVENAME)
	echo $(VAR)
