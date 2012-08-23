#!/bin/bash

AUTOESL_DIR=/opt/Xilinx/2012.1/AutoESL/bin

echo "==============================================================================="
echo "Make sure that you sourced this file, using 'source $0', "
echo "and not executed the file using '$0'."
echo "==============================================================================="
echo ""

# Check that AUTOESL_DIR is set correctly
if [[ ! -x $AUTOESL_DIR/autoesl ]]; then
    echo "autoesl executable not found in '$AUTOESL_DIR'" >&2
    exit 1
fi

# Add AutoESL to the current path
export PATH=$AUTOESL_DIR:$PATH
echo "PATH=$PATH"
echo ""

# Point to the university licensing server
echo "export XILINXD_LICENSE_FILE=2100@129.78.98.100"
export XILINXD_LICENSE_FILE=2100@129.78.98.100
echo ""

echo "Done!"
