#########################################################################
# This file and the associated documentation are confidential 
# and proprietary to Synopsys, Inc. 
#
# Copyright (c), 2010 Synopsys, Inc. All rights reserved.
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
#	08 Jun 09 : Adding First version
#	08 Feb 10 : Updated the way techfile information is fetched.
#
##########################################################################

##########################################################################
# Procedure used for setting the custom via properties
# DEVICE TYPE    customVIA
# SUPPORTFILE    ref90_common.tcl and iPDK_snps.tcl 
# DESCRIPTION    "Custom VIAs"
##########################################################################
proc ref90_cust_cbk {param} {

    # get current instance and parameter	
    set inst [iPDK_getCurrentInst]
    
    set cellName [oa::getCellName $inst]
    
    # Check for invalid inputs, variables.
    set checkparamlist {x y lyr2ExtraEncY lyr1ExtraEncY lyr2ExtraEncX lyr1ExtraEncX}
    foreach i $checkparamlist {
        ref90_symCheckParam [iPDK_getParameterValue $i $inst] $cellName $inst $i
    }

    # Get data base unit, grid precision
    set oaTech [oa::TechFind [ref90_getInstLibName $inst]]
    set group [oa::getNext [oa::getGroupsByName $oaTech techParams]]
    set cadGrid [oa::PropFind $group cadGrid]
    set grid  [ref90_getCadGridVal $cadGrid]
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

    set lowerMetEnc [ref90_getPropValue lowerMetEnc $cellDMData]
    set lowerMetEndCapEnc [ref90_getPropValue lowerMetEndCapEnc $cellDMData]
    set higherMetEnc [ref90_getPropValue higherMetEnc $cellDMData]
    set higherMetEndcapEnc [ref90_getPropValue higherMetEndcapEnc $cellDMData]
    set maxCustViaEnclose [ref90_getPropValue maxCustViaEnclose $cellDMData]
    set spacing [ref90_getPropValue cutSpace $cellDMData]
    set width [ref90_getPropValue cutWidth $cellDMData]
    set contactArrSpa  [ref90_getPropValue cutArraySpace $cellDMData] 
 
    set lyr1EncX  [iPDK_engToSci [iPDK_getParameterValue lyr1ExtraEncX $inst]]
    set lyr2EncX  [iPDK_engToSci [iPDK_getParameterValue lyr2ExtraEncX $inst]]
    set lyr1EncY  [iPDK_engToSci [iPDK_getParameterValue lyr1ExtraEncY $inst]]
    set lyr2EncY  [iPDK_engToSci [iPDK_getParameterValue lyr2ExtraEncY $inst]]
    set x  [iPDK_engToSci [iPDK_getParameterValue x $inst]]
    set y  [iPDK_engToSci [iPDK_getParameterValue y $inst]]
    
    set x_grid  [ref90_symGridCheck $x $grid $dbu]
    set y_grid  [ref90_symGridCheck $y $grid $dbu]
    set lyr1EncX_grid  [ref90_symGridCheck $lyr1EncX $grid $dbu]
    set lyr2EncX_grid  [ref90_symGridCheck $lyr2EncX $grid $dbu]
    set lyr1EncY_grid  [ref90_symGridCheck $lyr1EncY $grid $dbu]
    set lyr2EncY_grid  [ref90_symGridCheck $lyr2EncY $grid $dbu]
    
    set xdefVal [iPDK_engToSci [iPDK_getParamAttr defValue $inst x]]
    set ydefVal [iPDK_engToSci [iPDK_getParamAttr defValue $inst y]]
    set lowerMetEnc1 [iPDK_engToSci [iPDK_getParamAttr defValue $inst lyr1ExtraEncX]]
    set lowerMetEnc2 [iPDK_engToSci [iPDK_getParamAttr defValue $inst lyr1ExtraEncY]]
    set higherMetEnc1 [iPDK_engToSci [iPDK_getParamAttr defValue $inst lyr2ExtraEncX]]
    set higherMetEnc2 [iPDK_engToSci [iPDK_getParamAttr defValue $inst lyr2ExtraEncY]]
    set xVal [ref90_symCheckParamValue  x $x $xdefVal 0.0 $x_grid 1 $cellName $inst $param ]
    set yVal [ref90_symCheckParamValue  y $y $ydefVal 0.0 $y_grid 1 $cellName $inst $param ]
    set lyr1EncX [ref90_symCheckParamValue  lyr1ExtraEncX $lyr1EncX $lowerMetEnc1 [ref90_symU2M $maxCustViaEnclose] $lyr1EncX_grid 1 \
                                           $cellName $inst $param ]
    set lyr2EncX [ref90_symCheckParamValue  lyr2ExtraEncX $lyr2EncX $higherMetEnc1 [ref90_symU2M $maxCustViaEnclose] $lyr2EncX_grid 1 \
                                           $cellName $inst $param ]
    set lyr1EncY [ref90_symCheckParamValue  lyr1ExtraEncY $lyr1EncY $lowerMetEnc2 [ref90_symU2M $maxCustViaEnclose] $lyr1EncY_grid 1 \
                                           $cellName $inst $param ]
    set lyr2EncY [ref90_symCheckParamValue  lyr2ExtraEncY $lyr2EncY $higherMetEnc2 [ref90_symU2M $maxCustViaEnclose] $lyr2EncY_grid 1 \
                                           $cellName $inst $param ]
					   
    iPDK_setParameterValue x [iPDK_sciToEng $xVal] $inst
    iPDK_setParameterValue y [iPDK_sciToEng $yVal] $inst
    iPDK_setParameterValue lyr1ExtraEncX [iPDK_sciToEng $lyr1EncX] $inst
    iPDK_setParameterValue lyr2ExtraEncX [iPDK_sciToEng $lyr2EncX] $inst
    iPDK_setParameterValue lyr1ExtraEncY [iPDK_sciToEng $lyr1EncY] $inst
    iPDK_setParameterValue lyr2ExtraEncY [iPDK_sciToEng $lyr2EncY] $inst

}
