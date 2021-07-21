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
#	Change Log:
#
#	10 Aug 06 : Adding First version
#	31 Aug 06 : Changed the variable names to match key array
#   21 Jan 10 : Updated the way techfile information is fetched. 
##########################################################################

##########################################################################
# Procedure used for setting the MIM Capacitor properties depending on various 
# Entry modes.
# DEVICE TYPE    Capacitor
# SUPPORTFILE    ref90_common.tcl and iPDK_snps.tcl
# DESCRIPTION    "2-Terminal MIM Capacitor"
##########################################################################

#callback procedure starts here

proc ref90_cap_cbk {param} {
	
    # get current instance and parameter	
    set inst [iPDK_getCurrentInst]
   
    # Fetch tech properties
    set spice_model [iPDK_getParameterValue model $inst]

    # Check for invalid inputs, variables.
    set checkparamlist {c l w m}
    foreach i $checkparamlist {
        ref90_symCheckParam [iPDK_getParameterValue $i $inst] $spice_model $inst $i
    }   

    set oaTech [oa::TechFind [ref90_getInstLibName $inst]]
    set group [oa::getNext [oa::getGroupsByName $oaTech techParams]]
    set cadGrid [oa::PropFind $group cadGrid]

    # Get data base unit, grid precision
    set grid [ref90_getCadGridVal $cadGrid]
    set dbu 1

    #Get access to property bag from instance master
    set libName    [oa::getLibName $inst]
    set cellName   [oa::getCellName $inst]
    oa::getAccess  [oa::LibFind     $libName] read 1
    set cellDMData [oa::DMDataOpen  [oa::CellFind [oa::LibFind $libName] \
                                     $cellName] r]

    # Fetch common Parameters from CDF data
    set mult        [iPDK_getParameterValue m $inst]
    set row         [iPDK_getParameterValue rows $inst]
    set column      [iPDK_getParameterValue columns $inst]
    set minLength   [ref90_symU2M [ref90_getPropValue minLength $cellDMData]]
    set maxLength   [ref90_symU2M [ref90_getPropValue maxLength $cellDMData]]
    set minWidth    [ref90_symU2M [ref90_getPropValue minWidth $cellDMData]]
    set maxWidth    [ref90_symU2M [ref90_getPropValue maxWidth $cellDMData]]
    set Ca          [expr [ref90_getPropValue areaCap $cellDMData]*1e12]
    set Cf          [expr [ref90_getPropValue fringeCap $cellDMData]*1e6]
    set dw          [ref90_symU2M [ref90_getPropValue dW $cellDMData]] 	    
    set dl          [ref90_symU2M [ref90_getPropValue dL $cellDMData]]
    set constant    [ref90_getPropValue const $cellDMData]
    set Mode        [iPDK_getParameterValue entryMode $inst]

    # Check if parameter value is an non zero and +ve integer.
    set mult [ref90_symCheckInteger m $mult $spice_model $inst]
    iPDK_setParameterValue m $mult $inst
    set row [ref90_symCheckInteger rows $row $spice_model $inst]
    iPDK_setParameterValue rows $row $inst
    set column [ref90_symCheckInteger columns $column $spice_model $inst]
    iPDK_setParameterValue columns $column $inst

    # Calculations for each mode
    switch $Mode {

        "c" {

            # Regular Input mode
            if { ![ref90_symIsVariable [iPDK_getParameterValue c $inst]] } {
                set cval  [iPDK_engToSci [iPDK_getParameterValue c $inst]]
		set lw [ref90_symCapCalcVal "NA" "NA" $cval $Cf $Ca $dw $dl $constant $grid $dbu]
                set w_grid $lw
                set length [ref90_symCheckParamValue l $lw $minLength $maxLength 0 0 $spice_model $inst $param]
                iPDK_setParameterValue l [iPDK_sciToEng $length] $inst
                set width  [ref90_symCheckParamValue w $w_grid $minWidth $maxWidth 0 0 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng $width] $inst
		#calculate new value of c with on grid l and w put back
		set C_t [ref90_symCapCalcVal $length $width "NA" $Cf $Ca $dw $dl $constant $grid $dbu]
                iPDK_setParameterValue c [iPDK_sciToEng $C_t] $inst
            # c is a variable
            } else {
                set len "( sqrt(16*$Cf*$Cf + 4*$Ca*iPar(\"c\")) - 4*$Cf ) / (2*$Ca)"
                iPDK_setParameterValue l $len $inst
                iPDK_setParameterValue w $len $inst
            }
        }
        "c & w" {

            # Regular Input mode
            if { ![ref90_symIsVariable [iPDK_getParameterValue c $inst]] && ![ref90_symIsVariable [iPDK_getParameterValue w $inst]] } {
                set cval    [iPDK_engToSci [iPDK_getParameterValue c $inst]]
                set wid     [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set w_grid  [ref90_symGridCheck $wid $grid $dbu]
                set width  [ref90_symCheckParamValue w $wid $minWidth $maxWidth $w_grid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng $width] $inst
		set l_temp   [ref90_symCapCalcVal "NA" $width $cval $Cf $Ca $dw $dl $constant $grid $dbu]
                set length   [ref90_symCheckParamValue l $l_temp $minLength $maxLength 0 0 $spice_model $inst $param]
                iPDK_setParameterValue l [iPDK_sciToEng $length] $inst
		set flag 0
		if {$length != $l_temp} {
		    set flag 1
		}
                # re-calculate c and w and put back
		if { $param == "c" } {
		    set C_t [ref90_symCapCalcVal $length $width "NA" $Cf $Ca $dw $dl $constant $grid $dbu]
                    iPDK_setParameterValue c [iPDK_sciToEng $C_t] $inst
                } elseif {$param == "w" } {
		    if {$flag} {
		        set width [ref90_symCapCalcVal $length "NA" $cval $Cf $Ca $dw $dl $constant $grid $dbu]
		        if { $width < $minWidth } {
		            set width $minWidth
		        } elseif { $width > $maxWidth } {
		            set width $maxWidth
		        } 
		        iPDK_setParameterValue w [iPDK_sciToEng $width] $inst
		    }
		    # Recalculate C 
		    set C_t [ref90_symCapCalcVal $length $width "NA" $Cf $Ca $dw $dl $constant $grid $dbu]
                    iPDK_setParameterValue c [iPDK_sciToEng $C_t] $inst
		    
                }
            # w not a variable
            } elseif {![ref90_symIsVariable [iPDK_getParameterValue w $inst]]} {
                set wid     [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set w_grid  [ref90_symGridCheck $wid $grid $dbu]
                set width   [ref90_symCheckParamValue w $wid $minWidth $maxWidth $w_grid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng $width] $inst
                set len "( iPar(\"c\") - $Ca*2*iPar(\"w\") ) / ( $Ca*iPar(\"w\") + 2*$Cf )"
                iPDK_setParameterValue l $len $inst

            # c & w are variables
            } else {
                set len "( iPar(\"c\") - $Ca*2*iPar(\"w\") ) / ( $Ca*iPar(\"w\") + 2*$Cf )"
                iPDK_setParameterValue l $len $inst
            }
        }
        "l & w" {

            # Regular Input mode
            if { ![ref90_symIsVariable [iPDK_getParameterValue l $inst]] && ![ref90_symIsVariable [iPDK_getParameterValue w $inst]] } {
                set len    [iPDK_engToSci [iPDK_getParameterValue l $inst]]
                set wid    [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set w_grid [ref90_symGridCheck $wid $grid $dbu]
                set l_grid [ref90_symGridCheck $len $grid $dbu]
		set length [ref90_symCheckParamValue l $len $minLength $maxLength $l_grid 1 $spice_model $inst $param]
                iPDK_setParameterValue l [iPDK_sciToEng $length] $inst
                set width  [ref90_symCheckParamValue w $wid $minWidth $maxWidth $w_grid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng $width] $inst
		set C_t    [ref90_symCapCalcVal $length $width "NA" $Cf $Ca $dw $dl $constant $grid $dbu]
                set cval  [iPDK_sciToEng ${C_t}]
                 
            # l is not variable & w is variable
            } elseif { ![ref90_symIsVariable [iPDK_getParameterValue l $inst]] && [ref90_symIsVariable [iPDK_getParameterValue w $inst]]} {
                set len    [iPDK_engToSci [iPDK_getParameterValue l $inst]]
                set l_grid [ref90_symGridCheck $len $grid $dbu]
                set length [ref90_symCheckParamValue l $len $minLength $maxLength $l_grid 1 $spice_model $inst $param]
                iPDK_setParameterValue l [iPDK_sciToEng $length] $inst
                set cval "$Ca*iPar(\"l\")*iPar(\"w\") + $Cf*2*(iPar(\"l\")+iPar(\"w\"))"

            # w is not variable & l is variable
            } elseif { ![ref90_symIsVariable [iPDK_getParameterValue w $inst]] && [ref90_symIsVariable [iPDK_getParameterValue l $inst]]} {
                set wid    [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set w_grid [ref90_symGridCheck $wid $grid $dbu]
                set width  [ref90_symCheckParamValue w $wid $minWidth $maxWidth $w_grid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng $width] $inst
                set cval "$Ca*iPar(\"l\")*iPar(\"w\") + $Cf*2*(iPar(\"l\")+iPar(\"w\"))"
 
            # l & w are variables
            } else {
                set cval "$Ca*iPar(\"l\")*iPar(\"w\") + $Cf*2*(iPar(\"l\")+iPar(\"w\"))"
            }
	    
            iPDK_setParameterValue c $cval $inst
	    
        }
    }
    
    # Update Effective capacitance value on form
    if { [ref90_symIsVariable [iPDK_getParameterValue c $inst]]} {
        iPDK_setParameterValue ceff "[expr $row*$column]*iPar(\"c\")" $inst
    } else {
        set cval_now    [iPDK_engToSci [iPDK_getParameterValue c $inst]]
	    set ceff_now    [expr $row*$column*$cval_now]
        iPDK_setParameterValue ceff [iPDK_sciToEng $ceff_now] $inst
    }

    # Update mtot for simulation
    if { [ref90_symIsVariable [iPDK_getParameterValue m $inst]]} {
        iPDK_setParameterValue mtot "[expr $row*$column]*iPar(\"m\")" $inst
    } else {
        iPDK_setParameterValue mtot [expr $row*$column*$mult] $inst
    }

}
