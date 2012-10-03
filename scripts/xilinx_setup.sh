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
XILINX_DIR=/opt/Xilinx
XILINX_AUTOESL=${XILINX_DIR}/2012.1/AutoESL
XILINX_COMMON=${XILINX_DIR}/14.1/ISE_DS/common
XILINX_EDK=${XILINX_DIR}/14.1/ISE_DS/EDK
XILINX_ISE=${XILINX_DIR}/14.1/ISE_DS/ISE
XILINX_PLANAHEAD=${XILINX_DIR}/14.1/ISE_DS/PlanAhead

AUTOESL_COMMON_DIR=$XILINX_DIR/2012.1/common
EDK_COMMON_DIR=$XILINX_DIR/14.1/ISE_DS/common

ALTERA=/opt/altera/12.0
ALTERA_MODELSIM=${ALTERA}/modelsim_ase

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

echo "==============================================================================="
echo "Make sure that you sourced this file, using 'source $0'."
echo "==============================================================================="
echo ""

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
path_add "$AUTOESL_DIR/bin" "$AUTOESL_COMMON_DIR/bin/lin64"
echo "--------------------------------------------------"
echo

echo "##################################################"
echo "# EDK                                             "
echo "##################################################"
echo_and_exec export XILINX_EDK=
path_add "${XILINX_EDK}/bin/lin64" "${XILINX_EDK}/gnu/microblaze/lin64/bin" "${XILINX_EDK}/gnu/powerpc-eabi/lin64/bin"
librarypath_add "${XILINX_EDK}/lib/lin64"
echo "--------------------------------------------------"
echo

echo "##################################################"
echo "# ISE                                             "
echo "##################################################"
echo_and_exec export XILINX=$XILINX_ISE
echo_and_exec export XILINX_DSP=$XILINX
path_add "${XILINX}/bin/lin64" "${XILINX}/sysgen/util"
librarypath_add "${XILINX}/lib/lin64" "${LMC_HOME}/lib"
echo "--------------------------------------------------"
echo

echo "##################################################"
echo "# PlanAhead                                       "
echo "##################################################"
echo_and_exec export XILINX_PLANAHEAD
path_add "${XILINX_PLANAHEAD}/bin"
echo "--------------------------------------------------"
echo

echo "##################################################"
echo "# SysGen                                          "
echo "##################################################"
path_add "${XILINX_DSP}/sysgen/bin"
librarypath_add "${XILINX_DSP}/sysgen/lib"
echo "--------------------------------------------------"
echo

echo "##################################################"
echo "# Common                                          "
echo "##################################################"
echo_and_exec export XILINX_COMMON
path_add "${XILINX_COMMON}/bin/lin64"
librarypath_add "${XILINX_COMMON}/lib/lin64"
echo "--------------------------------------------------"
echo

echo "##################################################"
echo "# ModelSim                                        "
echo "##################################################"
echo_and_exec export ALTERA
echo_and_exec export ALTERA_MODELSIM
path_add ${ALTERA_MODELSIM}/bin
echo "--------------------------------------------------"
echo

echo "Done!"
