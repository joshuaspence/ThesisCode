#!/bin/bash

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

XILIND_LICENSE_SERVER=129.78.98.100
XILIND_LICENSE_PORT=2100
LOCALHOST_LICENSE_PORT=2100
SSH_USER=joshua

echo "==============================================================================="
echo "Make sure that you sourced this file, using 'source $0'."
echo "==============================================================================="
echo ""

# Check that AUTOESL_DIR is set correctly
if [[ ! -x $AUTOESL_DIR/bin/autoesl ]]; then
    echo "autoesl executable not found in '$AUTOESL_DIR'" >&2
    exit 1
fi

# Add AutoESL to the current path
pathadd $AUTOESL_DIR/bin
pathadd $AUTOESL_COMMON_DIR/bin/lin64
pathadd $EDK_DIR/bin/lin64
pathadd $EDK_COMMON_DIR/bin/lin64
echo "PATH=$PATH"
echo ""

# Set up SSH tunnel
#echo_and_exec ssh -f -N -L $LOCALHOST_LICENSE_PORT:127.0.0.1:$XILIND_LICENSE_PORT $SSH_USER@$XILIND_LICENSE_SERVER
#echo ""

# Point to the university licensing server (tunneled to localhost)
echo_and_exec export XILINXD_LICENSE_FILE=$XILIND_LICENSE_PORT@$XILIND_LICENSE_SERVER
echo_and_exec export LM_LICENSE_FILE=$XILIND_LICENSE_PORT@$XILIND_LICENSE_SERVER
echo ""

echo "Done!"
