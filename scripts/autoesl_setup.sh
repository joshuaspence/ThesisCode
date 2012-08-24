#!/bin/bash

function echo_and_exec {
	echo $@
	$@
}

XILINX_DIR=/opt/Xilinx

AUTOESL_DIR=$XILINX_DIR/2012.1/AutoESL
AUTOESL_COMMON_DIR=$XILINX_DIR/2012.1/common

EDK_DIR=$XILINX_DIR/13.2/ISE_DS/EDK
EDK_COMMON_DIR=$XILINX_DIR/13.2/ISE_DS/common

echo "==============================================================================="
echo "Make sure that you sourced this file, using 'source $0', "
echo "and not executed the file using '$0'."
echo "==============================================================================="
echo ""

# Check that AUTOESL_DIR is set correctly
if [[ ! -x $AUTOESL_DIR/bin/autoesl ]]; then
    echo "autoesl executable not found in '$AUTOESL_DIR'" >&2
    exit 1
fi

# Add AutoESL to the current path
export PATH=$AUTOESL_DIR/bin:$AUTOESL_COMMON_DIR/bin/lin64:$EDK_DIR/bin/lin64:$EDK_COMMON_DIR/bin/lin64:$PATH
echo "PATH=$PATH"
echo ""

# Point to the university licensing server
echo_and_exec export XILINXD_LICENSE_FILE=2100@129.78.98.100
echo_and_exec export LM_LICENSE_FILE=2100@129.78.98.100
echo ""

echo "Done!"
