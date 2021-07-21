#########################################################################
#
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
#	20 Feb 07 : Adding First version
#	14 Mar 10 : Corrected the abutment for abutment scenarios.
#               Abuttment will be the same irrespective of which instance is moved.
##########################################################################


proc ref90_findinst { inst } {
return [oa::InstFind [oa::getTopBlock [db::getAttr editDesign -of [de::getActiveContext]]] [oa::SimpleName [oa::CdbaNS] $inst]]
}
proc ref90_cp { para value inst} {
 #db::setParamValue $para -value $value -of [ref90_findinst $inst] -evalCallbacks 0
 db::setParamValue $para -value $value -of $inst -evalCallbacks 0
}
proc ref90_gp { para inst} {
 return [db::getParamValue $para -of [ref90_findinst $inst]]
}

proc ref90_getpara { para inst} {
 return [db::getParamValue $para -of $inst]
}

proc ref90_getTheMod { model mod1 } {
    upvar $mod1 mod
    for { set bc 1 } { $bc <= 5 } {incr bc} {
        foreach base $mod(mos_base_mod$bc) {
            if {$model == $base} {
                set baseType $bc
            }
        }
    }
    for { set sc 1 } { $sc <= 2 } {incr sc} {
        foreach sub $mod(mos_sub_mod$sc) {
            if {$model == $sub} {
                set subType $sc
            }
        }
    }
    
    set backboneType 0
    for { set bac 1 } { $bac <= 3 } {incr bac} {
        foreach backbone $mod(mos_backbone_mod$bac) {
            if {$model == $backbone} {
                set backboneType $bac
            }
        }
    }
    return [list $baseType $subType $backboneType]
}

proc ref90_loadAbutMsgs {} {

    global msglist
    set msglist(abt1) "Cannot abut these two type of devices"
    set msglist(abt2) "Cannot abut with both taps on"
    set msglist(abt3) "Cannot abut with this structure of taps"
    set msglist(abt4) "Cannot abut from this direction"
    set msglist(abt5) ""

}

proc ref90_symCheckGrid { grid dbu value } {
    return [expr double(floor($value*double($dbu)/$grid)*$grid/double($dbu))]
}


# Procedure to set the parameters from the instance
proc ref90_symSetParam { param value inst} {
    
   db::setParamValue $param -value $value -of $inst -evalCallbacks 0
    
}

# Procedure to get the parameters from the instance
proc ref90_symGetParam { param inst} {
    set value [db::getParamValue $param -of $inst]
    return $value
}

proc ref90_testMyParam { para inst } {

    set x [ref90_symGetParam $para $inst]
    set x1 [lindex [split $x "u"] 0]
    if { $x1 == $x } {
        set x1 [expr {double([lindex [split $x "n"] 0])}]
        set x1 [expr $x1/1000.0]
    } else {
        set x1 [expr {double([lindex [split $x "u"] 0])}]
    }
    return $x1
}


proc ref90_initiatePreAbut { instA instB termA termB abutDir exConn event} {
    global msglist realmsg
    ref90_loadAbutMsgs

    set viewName [oa::getViewName $instA]
    set cellName [oa::getCellName $instA]
    set libName [oa::getLibName $instA]
    set oaDesign [oa::DesignFind $libName $cellName $viewName]	
    set libId   [oa::getLib [oa::getDesign $instA]]
    
    # Get all required oaParams of two instances and check for feasiblity.
    set instA_width    [ref90_testMyParam w $instA]
    set instB_width    [ref90_testMyParam w $instB]
    set instA_length    [ref90_testMyParam l $instA]
    set instB_length    [ref90_testMyParam l $instB]

    set instA_p2cs     [ref90_testMyParam p2cs $instA]
    set instA_p2cd     [ref90_testMyParam p2cd $instA]
    set instB_p2cs     [ref90_testMyParam p2cs $instB]
    set instB_p2cd     [ref90_testMyParam p2cd $instB]
    set instA_polyStrapBot     [expr {
                               ![string match [ref90_getpara gateStrapBottom $instA] "metal1"] ? 0 : 1
                               }]
    set instA_polyStrapTop     [expr {
                               ![string match [ref90_getpara gateStrapTop $instA] "metal1"] ? 0 : 1
                               }]
    set instB_polyStrapBot     [expr {
                               ![string match [ref90_getpara gateStrapBottom $instB] "metal1"] ? 0 : 1
                               }]
    set instB_polyStrapTop     [expr {
                               ![string match [ref90_getpara gateStrapTop $instB] "metal1"] ? 0 : 1
                               }]

    # Using db command below since fymGetParam not working in build 36290 for fetcing param model.
    # Strange cannot explain behaviour.
    if { $instA_width > $instB_width } {
        set abuttorIsBig 1
    } elseif { $instA_width < $instB_width } {
        set abuttorIsBig 2
    } else {
        set abuttorIsBig 0
    }
    
    set instA_propList [list $instA_width $instA_length $instA_p2cs $instA_p2cd $instA_polyStrapTop $instA_polyStrapBot]

    set instB_propList [list $instB_width $instB_length $instB_p2cs $instB_p2cd $instA_polyStrapTop $instA_polyStrapBot]
    return [list $abuttorIsBig $instA_propList $instB_propList]
    
    
}
# 18 props in list $instA_width $instA_length $instA_p2cs $instA_p2cd $instA_model $instA_modtype $instA_but_setting $instA_tap_setting $instA_tapLeft $instA_tapRight $instA_tapTop $instA_tapBottom $instA_polystrapPos $instA_polystrapLay.
proc ref90_findEndcap { instA instB abutDir instA_propList instB_propList abuttorIsBig exConn} {

    set viewName [oa::getViewName $instA]
    set cellName [oa::getCellName $instA]
    set libName [oa::getLibName $instA]
    set oaDesign [oa::DesignFind $libName $cellName $viewName]	
    set libId   [oa::getLib [oa::getDesign $instA]]

    
    ########################################################
    ### these vaslues must update acoring to the prosese ###
    ########################################################
    
    set tech(polyContBox) 	     	0.19
    set tech(polyContEnclose)		0.05
    set tech(metal1ContEndCapEnclose)	0.04	
    set tech(metal1Spacing)		0.1
    set tech(metal1ContEnclose)		0.005	
    set tech(diffContEnclose)		0.05
    set tech(dataBaseUnitValue)         1
    set tech(minimumGridValue)          0.005
    set gateMinSpacing                  0.18	
    set diffPolyEndCap			0.16


    set dbu     $tech(dataBaseUnitValue)
    set grid	$tech(minimumGridValue)
    
    set instA_width  [lindex $instA_propList 0]
    set instA_length [lindex $instA_propList 1]
    set instA_p2cs   [lindex $instA_propList 2]
    set instA_p2cd   [lindex $instA_propList 3]
    set instA_polyStrapTop   [lindex $instA_propList 4]
    set instA_polyStrapBot   [lindex $instA_propList 5]
    set instA_dogbonePoly [expr {
                          $instA_length < $tech(polyContBox) ? 1 : 0
                          }]
    set instA_ex [expr {
                 $instA_dogbonePoly && ($instA_polyStrapTop || $instA_polyStrapBot) ? [ref90_symCheckGrid $grid $dbu [expr ($tech(polyContBox) - $instA_length)/2.0]] : 0
                 }]

    set instB_width  [lindex $instB_propList 0]
    set instB_length [lindex $instB_propList 1]
    set instB_p2cs   [lindex $instB_propList 2]
    set instB_p2cd   [lindex $instB_propList 3]
    set instB_polyStrapTop   [lindex $instB_propList 4]
    set instB_polyStrapBot   [lindex $instB_propList 5]
    set instB_dogbonePoly [expr {
                          $instB_length < $tech(polyContBox) ? 1 : 0
                          }]
    set instB_ex [expr { 
                 $instB_dogbonePoly && ( $instB_polyStrapTop || $instB_polyStrapBot) ? [ref90_symCheckGrid $grid $dbu [expr ($tech(polyContBox) -$instB_length)/2.0]] : 0
                 }]

    set diffPolySpacing [expr [db::engToSci [db::getParamValue diffPolySpacing  -of $instA]] *1e6]
    
    if { !$abuttorIsBig } {
        #set val1 [expr $instA_ex - $tech(polyContEnclose) + $tech(metal1ContEndCapEnclose) \
        #   + $tech(metal1Spacing) + $tech(metal1ContEnclose) - $tech(diffContEnclose)]
        #set val2 [expr $diffPolySpacing + $instA_ex]
        set val1 0.0
        set val2 0.0
        set val3 [expr $instA_p2cs - $tech(diffContEnclose)]
	if { $abutDir == 4} {
	    if { ([ref90_getpara sourceTerm $instA] == "False") && ([ref90_getpara drainTerm $instB] == "False") } {
	        set val3 [expr $gateMinSpacing - $diffPolyEndCap]
	    }
	}

	if { $abutDir == 8} {
	    if { ([ref90_getpara drainTerm $instA] == "False") && ([ref90_getpara sourceTerm $instB] == "False") } {
	        set val3 [expr $gateMinSpacing - $diffPolyEndCap]
	    }
	}
	
	# If external connection is not there maintain gate-gate spacing
	if {$exConn == 0} {
	    set val3 [expr $gateMinSpacing - $diffPolyEndCap]
	} 
	 
        set returnVal [expr {
                      $val1 > $val2 ? $val1 > $val3 ? $val1 
                                                    : $val3 
                                    : $val2 > $val3 ? $val2 
                                                    : $val3 
                      }]
    } else {
        set val1 [expr $instB_ex - $tech(polyContEnclose) + $tech(metal1ContEndCapEnclose) \
           + $tech(metal1Spacing) + $tech(metal1ContEnclose) - $tech(diffContEnclose)]
       # set val2 [expr $tech(polyDiffSpacing) + $instB_ex]
        set val2 [expr $diffPolySpacing + $instB_ex]
        set val3 [expr $instB_p2cs - $tech(diffContEnclose)]
	if { $instA_width == $instB_width } {
            set val1 0.0
            set val2 0.0
        }
        set returnVal [expr {
                      $val1 > $val2 ? $val1 > $val3 ? $val1 
                                                    : $val3 
                                    : $val2 > $val3 ? $val2 
                                                    : $val3 
                      }]
    }
     return [list $returnVal]

}

# The following procedure is to decide if the current orientation of the devices is feasible for abutment.
# On a one-to-one Checking it would take 36 case.
# hence Similar orientations are clubbed together. MX is same as R0, likewise MY-R180, MXR90-R90, MYR90-R270.
# Similar orientations were handled original abutment proc. eg. R0-R0, R270-R270 etc behave the same.
# So those are not checked.

# Abutment at a Perpendicular is not allowed hence all are setting continueAbut to 0. This will return "false" in main proc.
# R90-R270, behaves the same as R0-R180. Hence former is converted to later in combinedOrient.

# Finally when device are in parallel, but opposite in orientation, the right tap needs to be turned off.
# In default R0-R0 case was handled in old code.
# but when one is rotated to say R180, what the CDF says as "Place tap on right" is actually placed in left!
# Thats what the last switch is doing : tapControl, set the switch, so main abutFunction turns of corresponding tap.
# tapControl = 0 . Do what must be done at R0-R0 abut.
# tapControl = 1 . Moving instance is rotated, so the tap needs to turned off correctly.
# E.g. Stationary with TapRight On, moving with R90 orientation tapRight On, abutment on drain side of stationary.
# tapControl = 2 . Stationary instance is rotated, so the tap needs to turned off correctly.

# Phew!


proc ref90_checkOrientation { instA instB } {

    global realmsg msglist
    set continueAbut 1
    set tapControl 0
    set instA_orient [oa::getName [db::getAttr orient -of $instA]]
    set instB_orient [oa::getName [db::getAttr orient -of $instB]]
    switch $instA_orient {
        "MX" { set instA_orient "R0"; }
        "MY" { set instA_orient "R180"; }
        "MXR90" { set instA_orient "R90"; }
        "MYR90" { set instA_orient "R270"; }
    }
    switch $instB_orient {
        "MX" { set instB_orient "R0"; }
        "MY" { set instB_orient "R180"; }
        "MXR90" { set instB_orient "R90"; }
        "MYR90" { set instB_orient "R270"; }
    }
    set combinedOrient [join [list $instA_orient $instB_orient] "."]
    switch $combinedOrient {
        "R0.R90" { 
                     set continueAbut 0;
                 }
        "R0.R270" { 
                     set continueAbut 0;
                 }
        "R90.R0" { 
                     set continueAbut 0;
                 }
        "R270.R0" { 
                     set continueAbut 0;
                 }
        "R180.R90" { 
                     set continueAbut 0;
                 }
        "R180.R270" { 
                     set continueAbut 0;
                 }
        "R90.R180" { 
                     set continueAbut 0;
                 }
        "R270.R180" { 
                     set continueAbut 0;
                 }
        "R90.R270" { 
                     set combinedOrient "R0.R180";
                 }
        "R270.R90" { 
                     set combinedOrient "R180.R0";
                 }
    }

    switch $combinedOrient {
        "R180.R0" { 
                     set tapControl 1;
                 }
        "R0.R180" { 
                     set tapControl 2;
                 }
    }
    #IF device is same but pins are trying to abut at a perpendicular.
    if { !$continueAbut } {
        set realmsg $msglist(abt4)
    }

    return [list $continueAbut $tapControl]

}


proc ref90_abutor {instA instB termA termB abutDir exConn event } {
    global msglist realmsg
    
    # When event is abut reject, no calc needs to be performed.
    # Return a random offset to align in X direction.

    if { $event == 1 } {
        #ref90_cp abutInputs "abutOFF" $instA
        #ref90_cp abutInputs "abutOFF" $instB
        return [list 1.5 0.0]
    }

    set postInitiate   [ref90_initiatePreAbut $instA $instB $termA $termB $abutDir $exConn $event]
    set abuttorIsBig   [lindex $postInitiate 0]
    set instA_propList [lindex $postInitiate 1]
    set instB_propList [lindex $postInitiate 2]

    # Now check orientation.
    set orientResult [ref90_checkOrientation $instA $instB]
    set continueAbut [lindex $orientResult 0]
    set tapControl [lindex $orientResult 1]

    # continueAbut can be 0 if devices are in different orientation (returned from checkOrientation)
    # Thus use tool feature of using "abutoffset" stored on the the pin.

    if { !$continueAbut } {
        puts $realmsg
        set completeEvent "XXX"
        return false
    }

    # If all set for abutment, continue to calculate diffPolyEndcap.
    set exces          [lindex [ref90_findEndcap $instA $instB $abutDir $instA_propList $instB_propList $abuttorIsBig $exConn] 0]
    set completeEvent  [join [split [list $event $exConn $abutDir $abuttorIsBig $tapControl] " "] "."]
    set abutInputs1 [join [list $event $exces] "#"]
    
    # v0 : abut event.
    # v1 : endcap Value.
    switch -regexp $completeEvent {
        "^2.1.4.0.0" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam drainTerm "True" $instB
            ref90_symSetParam abutInputsL $abutInputs1 $instA
          }
        "^2.1.4.1.0" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam sourceTerm "True" $instA
            ref90_symSetParam drainTerm "False" $instB
            ref90_symSetParam abutInputsR $abutInputs1 $instB
          }
        "^2.1.4.2.0" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam drainTerm "True" $instB
            ref90_symSetParam abutInputsL $abutInputs1 $instA
          }
        "^2.1.4.0.1" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam sourceTerm "True" $instB
            ref90_symSetParam abutInputsL $abutInputs1 $instA
          }
        "^2.1.4.1.1" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "True" $instA
            ref90_symSetParam sourceTerm "False" $instB
            ref90_symSetParam abutInputsL $abutInputs1 $instB
          }
        "^2.1.4.2.1" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam sourceTerm "True" $instB
            ref90_symSetParam abutInputsL $abutInputs1 $instA
          }
        "^2.1.4.0.2" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam sourceTerm "True" $instB
            ref90_symSetParam abutInputsL $abutInputs1 $instA
          }
        "^2.1.4.1.2" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "True" $instA
            ref90_symSetParam sourceTerm "False" $instB
            ref90_symSetParam abutInputsL $abutInputs1 $instB
          }
        "^2.1.4.2.2" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam sourceTerm "True" $instB
            ref90_symSetParam abutInputsL $abutInputs1 $instA
          }
        "^2.1.8.0.0" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam sourceTerm "True" $instB
            ref90_symSetParam abutInputsR $abutInputs1 $instA
          }
        "^2.1.8.1.0" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam drainTerm "True" $instA
            ref90_symSetParam sourceTerm "False" $instB
            ref90_symSetParam abutInputsL $abutInputs1 $instB
          }
        "^2.1.8.2.0" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "True" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instA
          }
        "^2.1.8.0.1" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam drainTerm "True" $instB
            ref90_symSetParam abutInputsR $abutInputs1 $instA
          }
        "^2.1.8.1.1" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "True" $instA
            ref90_symSetParam drainTerm "False" $instB
            ref90_symSetParam abutInputsR $abutInputs1 $instB
          }
        "^2.1.8.2.1" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam drainTerm "True" $instB
            ref90_symSetParam abutInputsR $abutInputs1 $instA
          }
        "^2.1.8.0.2" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam drainTerm "True" $instB
            ref90_symSetParam abutInputsR $abutInputs1 $instA
          }
        "^2.1.8.1.2" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "True" $instA
            ref90_symSetParam drainTerm "False" $instB
            ref90_symSetParam abutInputsR $abutInputs1 $instB
          }
        "^2.1.8.2.2" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam drainTerm "True" $instB
            ref90_symSetParam abutInputsR $abutInputs1 $instA
          }
        "^2.0.4.0.0" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam abutInputsL $abutInputs1 $instA
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam drainTerm "False" $instB
          }
        "^2.0.4.1.0" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instB
            ref90_symSetParam abutInputsL $abutInputs1 $instA
          }
        "^2.0.4.2.0" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instB
          }
        "^2.0.4.0.1" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instA
            ref90_symSetParam sourceTerm "False" $instB
          }
        "^2.0.4.1.1" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instB
          }
        "^2.0.4.2.1" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instB
          }
        "^2.0.4.0.2" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instA
            ref90_symSetParam sourceTerm "False" $instB
          }
        "^2.0.4.1.2" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instB
          }
        "^2.0.4.2.2" {
            ref90_symSetParam tapLeft "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instB
            ref90_symSetParam sourceTerm "False" $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instB
          }
        "^2.0.8.0.0" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instB
            ref90_symSetParam sourceTerm "False" $instB
          }
        "^2.0.8.1.0" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instB
          }
        "^2.0.8.2.0" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapLeft "none" $instB
            ref90_symSetParam sourceTerm "False" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instA
            ref90_symSetParam abutInputsL $abutInputs1 $instB
          }
        "^2.0.8.0.1" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instB
            ref90_symSetParam drainTerm "False" $instB
          }
        "^2.0.8.1.1" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instB
          }
        "^2.0.8.2.1" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instB
          }
        "^2.0.8.0.2" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instB
            ref90_symSetParam drainTerm "False" $instB
          }
        "^2.0.8.1.2" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instB
            ref90_symSetParam abutInputsR $abutInputs1 $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instB
            ref90_symSetParam drainTerm "False" $instA
          }
        "^2.0.8.2.2" {
            ref90_symSetParam tapRight "none" $instA
            ref90_symSetParam tapRight "none" $instB
            ref90_symSetParam drainTerm "False" $instB
            ref90_symSetParam drainTerm "False" $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instA
            ref90_symSetParam abutInputsR $abutInputs1 $instB
          }
        "^3.*.*.*.*" {
            #return false
          }

    }
    if { $event == 2 } {
        return true
    }

}



proc ref90_enableAbut {designLibN cellname args} {

global initAbutFail
set cv [dm::findCellView layout -cellName $cellname -libName $designLibN]
db::setPrefValue leAutoAbutment -value true -scope $cv
set initAbutFail [expr { $args == 1 ? 1 : $args == 2 ? 2 : 0 }]

#db::setAttr  geometry -of [gi::getWindows <windowNumber>] -value <value>

#Value can be for example 800x600+300+100.

}


#puts "abutDir exConn event $abutDir $exConn $event \n"
#gi::setField {attributes} -value {R90} -index {3,1} -in [gi::getAssistants property_editor -from [gi::getWindows 1]]


