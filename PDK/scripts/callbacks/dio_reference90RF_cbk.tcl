#########################################################################
# This file and the associated documentation are confidential 
# and proprietary to Synopsys, Inc. 
#
# Copyright (c), 2009-2010 Synopsys, Inc. All rights reserved.
#
# DISCLAIMER
# The information contained herein is provided by Synopsys, Inc. on 
# an "AS IS" basis without any warranty, and Synopsys has no obligation 
# to support or otherwise maintain the information.
#
# Synopsys, Inc. disclaims any representation that the information 
# does not infringe any intellectual property rights or proprietary
# rights of any third parties. There are no other warranties given by
# Synopsys, whether express, implied or statutory, including, without
# limitation, implied warranties of merchantability and fitness for a
# particular purpose.
#
# Synopsys, Inc. reserves the right to make changes to the information 
# at any time and without notice.
#
#########################################################################
#
#	Change Log:
#
#	08 Oct 08 : Adding First version
#	08 Feb 10 : Updated with way techfile information is fetched.
##########################################################################

##########################################################################
# Procedure used for setting the Diode properties depending on various  
# Entry modes.
# DEVICE TYPE    Diode
# SUPPORTFILE    ref90_common.tcl and iPDK_snps.tcl
# DESCRIPTION    "2-Terminal Diode"
##########################################################################

proc ref90_dio_cbk  {param} {

    # get current instance and parameter	
    set inst [iPDK_getCurrentInst]
	
    # Get data base unit, grid precision
    set oaTech [oa::TechFind [ref90_getInstLibName $inst]]
    set group [oa::getNext [oa::getGroupsByName $oaTech techParams]]
    set cadGrid [oa::PropFind $group cadGrid]
    set grid  [oa::getValue $cadGrid]
    set dbu 1
    
    #Get the param triggering callback
    #Trim tick ( ' ) character from param
    #Remove if then else loop when bug fixed
    if { [string first ' $param 0] == 0 } {
        set param [string trimleft $param ']
    } else {
        set param $param
    }

    #Get access to property bag from instance master 
    set libName    [oa::getLibName $inst]
    set cellName   [oa::getCellName $inst]
    oa::getAccess  [oa::LibFind     $libName] read 1
    set cellDMData [oa::DMDataOpen  [oa::CellFind [oa::LibFind $libName] $cellName] r]

    set spice_model [iPDK_getParameterValue model $inst]

    # Check for invalid inputs, variables.
    set checkparamlist {l w m}
    foreach i $checkparamlist {
        ref90_symCheckParam [iPDK_getParameterValue $i $inst] $spice_model $inst $i
    }   

    # Fetch common parameters from CDF data
    set mult        [iPDK_getParameterValue m $inst]
    set minWidth     [ref90_symU2M [ref90_getPropValue minW $cellDMData]]
    set maxWidth     [ref90_symU2M [ref90_getPropValue maxW $cellDMData]]
    set minLength    [ref90_symU2M [ref90_getPropValue minL $cellDMData]]
    set maxLength    [ref90_symU2M [ref90_getPropValue maxL $cellDMData]]

    # check if value is not an integer or less than 1
    set mult [ref90_symCheckInteger m $mult $spice_model $inst]
    iPDK_setParameterValue m $mult $inst
    
    # Set the lvs_model appropriately (From LVS Runset Equate Statement)
    iPDK_setParameterValue lvs_model $spice_model $inst
    
    # Regular Input mode
    if { ![ref90_symIsVariable [iPDK_getParameterValue l $inst]] && ![ref90_symIsVariable [iPDK_getParameterValue w $inst]]} {
        set len  [iPDK_engToSci [iPDK_getParameterValue l $inst]]
        set wid  [iPDK_engToSci [iPDK_getParameterValue w $inst]]
        set l_grid [ref90_symGridCheck $len $grid $dbu]
        set w_grid [ref90_symGridCheck $wid $grid $dbu]
        set wid [ref90_symCheckParamValue w $wid $minWidth $maxWidth $w_grid 1 $spice_model $inst $param]
        iPDK_setParameterValue w [iPDK_sciToEng $wid] $inst
        set len [ref90_symCheckParamValue l $len $minLength $maxLength $l_grid 1 $spice_model $inst $param]
        iPDK_setParameterValue l [iPDK_sciToEng $len] $inst
        set peri [expr 2*($len + $wid)]
        set Ar [expr $len * $wid]
        iPDK_setParameterValue area [iPDK_sciToEng $Ar] $inst
        iPDK_setParameterValue pj [iPDK_sciToEng $peri] $inst

    # l is not variable & w is variable
    } elseif { ![ref90_symIsVariable [iPDK_getParameterValue l $inst]] && [ref90_symIsVariable [iPDK_getParameterValue w $inst]]} {
        set len  [iPDK_engToSci [iPDK_getParameterValue l $inst]]
        set l_grid [ref90_symGridCheck $len $grid $dbu]
        set len [ref90_symCheckParamValue l $len $minLength $maxLength $l_grid 1 $spice_model $inst $param]
        iPDK_setParameterValue l [iPDK_sciToEng $len] $inst
        set areaVal "(iPar(\"l\")*iPar(\"w\"))"
        iPDK_setParameterValue area $areaVal $inst
        set perimVal "(2*(iPar(\"l\")+iPar(\"w\")))"
        iPDK_setParameterValue pj $perimVal $inst
 
    # w is not variable & l is variable
    } elseif { ![ref90_symIsVariable [iPDK_getParameterValue w $inst]] && [ref90_symIsVariable [iPDK_getParameterValue l $inst]]} {
        set wid  [iPDK_engToSci [iPDK_getParameterValue w $inst]]
        set w_grid [ref90_symGridCheck $wid $grid $dbu]
        set wid [ref90_symCheckParamValue w $wid $minWidth $maxWidth $w_grid 1 $spice_model $inst $param]
        iPDK_setParameterValue w [iPDK_sciToEng $wid] $inst
        set areaVal "(iPar(\"l\")*iPar(\"w\"))"
        iPDK_setParameterValue area $areaVal $inst
        set perimVal "(2*(iPar(\"l\")+iPar(\"w\")))"
        iPDK_setParameterValue pj $perimVal $inst

    # l & w are variables
    } else {
        set areaVal "(iPar(\"l\")*iPar(\"w\"))"
        iPDK_setParameterValue area $areaVal $inst
        set perimVal "(2*(iPar(\"l\")+iPar(\"w\")))"
        iPDK_setParameterValue pj $perimVal $inst
    }
         		
      
}
