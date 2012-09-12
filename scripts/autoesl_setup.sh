#!/bin/bash

################################################################################
#
# Script to setup various environment variables necessary for using AutoESL with
# the university's "tuna" FLEXlm licensing server.
#
# Usage:
#     source autoesl_setup.sh
#
################################################################################

function echo_and_exec {
	echo $@
	$@
}

function pathadd {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$PATH:$1"
    fi
}

XILINX_DIR=/opt/Xilinx
AUTOESL_DIR=$XILINX_DIR/2012.1/AutoESL
AUTOESL_COMMON_DIR=$XILINX_DIR/2012.1/common
EDK_DIR=$XILINX_DIR/13.2/ISE_DS/EDK
EDK_COMMON_DIR=$XILINX_DIR/13.2/ISE_DS/common

ALTERA_DIR=/opt/altera
MODELSIM_DIR=$ALTERA_DIR/12.0/modelsim_ase

XILINXD_LICENSE_SERVER=129.78.98.100
XILINXD_LICENSE_PORT=2100

echo "==============================================================================="
echo "Make sure that you sourced this file, using 'source $0'."
echo "==============================================================================="
echo ""

# Check that AUTOESL_DIR is set correctly
if [ ! -x $AUTOESL_DIR/bin/autoesl ]; then
    echo "autoesl executable not found in '$AUTOESL_DIR'" >&2
    exit 1
fi

# Check that MODELSIM_DIR is set correctly
if [ ! -x $MODELSIM_DIR/bin/vsim ]; then
    echo "vsim executable not found in '$MODELSIM_DIR'" >&2
    exit 1
fi

# Add AutoESL to the current path
pathadd $AUTOESL_DIR/bin
pathadd $AUTOESL_COMMON_DIR/bin/lin64
pathadd $EDK_DIR/bin/lin64
pathadd $EDK_COMMON_DIR/bin/lin64

# Add Modelsim to the current path
pathadd $MODELSIM_DIR/bin

echo "PATH=$PATH"
echo ""

# Point to the university licensing server (tunneled to localhost)
echo_and_exec export XILINXD_LICENSE_FILE=$XILINXD_LICENSE_PORT@$XILINXD_LICENSE_SERVER
echo_and_exec export LM_LICENSE_FILE=$XILINXD_LICENSE_PORT@$XILINXD_LICENSE_SERVER
echo ""

echo "Done!"
