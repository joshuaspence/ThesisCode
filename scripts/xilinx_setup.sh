#!/bin/bash

################################################################################
#
# Script to setup various environment variables necessary for using AutoESL with
# the university's "tuna" FLEXlm licensing server.
#
# Usage:
#     source xilinx_setup.sh
#
################################################################################

#===============================================================================
# CONFIGURATION
#===============================================================================
ALTERA_MODELSIM=/opt/altera/12.0/modelsim_ase
XILINX_DIR=/opt/Xilinx/14.2/ISE_DS
XILINX_AUTOESL=/opt/Xilinx/2012.1/AutoESL

XILINXD_LICENSE_SERVER=129.78.98.100
XILINXD_LICENSE_PORT=2100
#-------------------------------------------------------------------------------

function echo_and_exec {
	echo $@
	$@
}

function path_add {
    while [[ $# -gt 0 ]]; do
        if [[ -d "$1" && ":${PATH}:" != *":$1:"* ]]; then
            export PATH="$1:${PATH}"
        fi
        shift
    done
    echo "PATH=${PATH}"
}

function librarypath_add {
    while [[ $# -gt 0 ]]; do
        if [[ -d "$1" && ":{LD_LIBRARY_PATH}:" != *":$1:"* ]]; then
            export LD_LIBRARY_PATH="$1:${LD_LIBRARY_PATH}"
        fi
        shift
    done
    echo "LD_LIBRARY_PATH=${LD_LIBRARY_PATH}"
}

# Point to the university licensing server (tunneled to localhost)
echo "##################################################"
echo "# FlexLM licensing                                "
echo "##################################################"
echo_and_exec export XILINXD_LICENSE_FILE=$XILINXD_LICENSE_PORT@$XILINXD_LICENSE_SERVER
echo_and_exec export LM_LICENSE_FILE=$XILINXD_LICENSE_PORT@$XILINXD_LICENSE_SERVER
echo "--------------------------------------------------"
echo
echo "##################################################"
echo "# AutoESL                                         "
echo "##################################################"
echo_and_exec export XILINX_AUTOESL
path_add "${AUTOESL_DIR}/bin" "${AUTOESL_DIR}/bin/lin64"
echo "--------------------------------------------------"
echo

echo "##################################################"
echo "# Xilinx EDK                                      "
echo "##################################################"
source ${XILINX_DIR}/settings64.sh
echo "--------------------------------------------------"
echo

echo "##################################################"
echo "# ModelSim                                        "
echo "##################################################"
echo_and_exec export ALTERA_MODELSIM
path_add ${ALTERA_MODELSIM}/bin
echo "--------------------------------------------------"
echo

echo "Done!"
