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
######################################################################## 
#
#	Change Log:
#   10 Aug 06 : Adding First version
#   05 Sep 06 : Replaced de:: commands with  oa:: commands  
#	08 Sep 06 : Removed as ad ps pd nrs nrd from check param list	
#	24 Mar 10 : Updated the way techfile information is fetched. 
#
##########################################################################

##########################################################################
# Procedure used for setting the mosfet properties depending on various 
# Entry modes.
# DEVICE TYPE    Mosfet
# SUPPORTFILE    ref90_common.tcl and iPDK_snps.tcl
# DESCRIPTION    "3/4-Terminal Mosfets"
##########################################################################
# Added for testing

proc ref90_mos_cbk {param} {
    # get current instance and parameter	
    set inst [iPDK_getCurrentInst]

    set spice_model [iPDK_getParameterValue model $inst]
        
    # Check for invalid inputs, variables.
    set checkparamlist {l w m wtot tapIncrSpacing nf}
    foreach i $checkparamlist {
        ref90_symCheckParam [iPDK_getParameterValue $i $inst] $spice_model $inst $i
    }
    
    set oaTech [oa::TechFind [ref90_getInstLibName $inst]]
    set group [oa::getNext [oa::getGroupsByName $oaTech techParams]]
    set cadGrid [oa::PropFind $group cadGrid]

    # Get data base unit, grid precision
    set grid [ref90_getCadGridVal $cadGrid]
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
    set cellDMData [oa::DMDataOpen  [oa::CellFind [oa::LibFind $libName] \
                                     $cellName] r]

    # Fetch common Parameters from CDF data / keys
    set Mode            [iPDK_getParameterValue entryMode $inst]
    set mult            [iPDK_getParameterValue m $inst]
    set nf              [iPDK_getParameterValue nf $inst]
    set minLength       [ref90_symU2M [ref90_getPropValue minLength $cellDMData]]
    set maxLength       [ref90_symU2M [ref90_getPropValue maxLength $cellDMData]]
    set minWidth        [ref90_symU2M [ref90_getPropValue minWidth $cellDMData]]
    set maxWidth        [ref90_symU2M [ref90_getPropValue maxWidth $cellDMData]]
    set maxM1StrapWidth [ref90_symU2M [ref90_getPropValue maxM1StrapWidth $cellDMData]]
    set minM1StrapWidth [ref90_symU2M [ref90_getPropValue minM1StrapWidth $cellDMData]]
    set keys(minTapConts) [ref90_getPropValue minTapConts $cellDMData]
    set keys(maxTapConts) [ref90_getPropValue maxTapConts $cellDMData]
    set keys(controlBentPoly) [ref90_getPropValue controlBentPoly $cellDMData]
    set keys(parasiticsWPF) [ref90_getPropValue parasiticsWPF $cellDMData]
    set keys(polyContSpacing) [ref90_getPropValue polyContSpacing $cellDMData]
    set keys(gateMinSpacing) [ref90_getPropValue gateMinSpacing $cellDMData]
    set keys(polyDiffEndcap) [ref90_getPropValue polyDiffEndcap $cellDMData]
    set keys(polyDiffEndcap_std_rec) [ref90_getPropValue polyDiffEndcap_std_rec $cellDMData]
    set keys(polyDiffEndcap_rec_max) [ref90_getPropValue polyDiffEndcap_rec_max $cellDMData]
    set keys(polyDiffSpacing) [ref90_getPropValue polyDiffSpacing $cellDMData]
    set keys(polyDiffSpacing_rec) [ref90_getPropValue polyDiffSpacing_rec $cellDMData]
    set keys(polyDiffSpacing_rec_max) [ref90_getPropValue polyDiffSpacing_rec_max $cellDMData]
    set keys(diffPolyEnclose_rec) [ref90_getPropValue diffPolyEnclose_rec $cellDMData]
    set keys(diffPolyEnclose_rec_max) [ref90_getPropValue diffPolyEnclose_rec_max $cellDMData]
    set keys(diffContEnclose_rec) [ref90_getPropValue diffContEnclose_rec $cellDMData]
    set keys(diffContEnclose_rec_max) [ref90_getPropValue diffContEnclose_rec_max $cellDMData]
    set keys(metal1ContEndCapEnclose_rec) [ref90_getPropValue metal1ContEndCapEnclose_rec $cellDMData]
    set keys(metal1ContEndCapEnclose_rec_max) [ref90_getPropValue metal1ContEndCapEnclose_rec_max $cellDMData]
    set keys(polyContEndCapEnclose_rec) [ref90_getPropValue polyContEndCapEnclose_rec $cellDMData]
    set keys(polyContEndCapEnclose_rec_max) [ref90_getPropValue polyContEndCapEnclose_rec_max $cellDMData]

    set tech(contMinWidth) [ref90_getPropValue contMinWidth $cellDMData]
    set tech(polyContEnclose) [ref90_getPropValue polyContEnclose $cellDMData]
    set tech(diffPolyEnclose) [ref90_getPropValue diffPolyEnclose $cellDMData]
    set tech(diffContEnclose) [ref90_getPropValue diffContEnclose $cellDMData]
    set tech(contMinSpacing) [ref90_getPropValue contMinSpacing $cellDMData]
    set tech(polyMinSpacing) [ref90_getPropValue polyMinSpacing $cellDMData]
    set tech(metal1ContEndCapEnclose) [ref90_getPropValue metal1ContEndCapEnclose $cellDMData]
    set tech(polyContEndCapEnclose) [ref90_getPropValue polyContEndCapEnclose $cellDMData]

    set mod(mos_base_mod1)              	{"N" "N18" "P" "P18"}
    set mod(mos_base_mod2)              	{"NA" "NA18"}
    set mod(mos_base_mod3)              	{"NM" "PM"}
    set mod(mos_base_mod4)              	{"NL" "PL"}
    set mod(mos_base_mod5)              	{"NH" "PH"}

    # decoding baseType for different models
    for { set bc 1 } { $bc <= 5 } {incr bc} {
        foreach base $mod(mos_base_mod$bc) {
            if {$spice_model == $base} {
                set baseType $bc
            }
        }
    }
    # initialize variable to differentiate variable entry 
    set varMode 0
    
    # Check if parameter value is an non zero and +ve integer. 
    set mult [ref90_symCheckInteger m $mult $spice_model $inst]
    iPDK_setParameterValue m $mult $inst
    
    # added below to support stretch when entryMode = TotalWidth 
    if {[ref90_symIsLayout] && $Mode == "TotalWidth"} {
        if {$param == "w"} {
	     set width [iPDK_engToSci [iPDK_getParameterValue w $inst]]
	     iPDK_setParameterValue wtot [iPDK_sciToEng [expr $nf*$width]] $inst
	}

    }	
    # Check for the min/mas of M1 Strap Width for S/D
    if {$param == "m1StrapWidth"} {
       set m1StrapWidth [iPDK_engToSci [iPDK_getParameterValue m1StrapWidth $inst]]
       set strapWidth [ref90_symCheckParamValue m1StrapWidth $m1StrapWidth $minM1StrapWidth $maxM1StrapWidth $m1StrapWidth 1 $spice_model $inst $param]
       iPDK_setParameterValue m1StrapWidth [iPDK_sciToEng [expr $strapWidth]] $inst
    }
    
    # Check for maximum number of fingers. 
    if { ![ref90_symIsVariable [iPDK_getParameterValue nf $inst]] } {
	set nf [ref90_symCheckParamValue nf [iPDK_getParameterValue nf $inst] 1 100 0 1 $spice_model $inst $param]
	iPDK_setParameterValue nf $nf $inst
    }
    # Check to set strapSource and StrapDrain OFF when nf is reset to 1 from higher value
    if {$param=="nf"} {
        set NF  [iPDK_getParameterValue nf $inst]
	if {$NF==1} {
	    iPDK_setParameterValue strapSource 0 $inst
	    iPDK_setParameterValue strapDrain 0 $inst
	}
    }

    if { [ref90_symIsLayout] } {
        set tapShape        [iPDK_getParameterValue tapStructure $inst]
        set topTap          [iPDK_getParameterValue tapTop $inst]
        set botTap          [iPDK_getParameterValue tapBottom $inst]
        set rtTap           [iPDK_getParameterValue tapRight $inst]
        set lftTap          [iPDK_getParameterValue tapLeft $inst]
        set lbtTap          [iPDK_getParameterValue leftButtedTap $inst]
        set rbtTap          [iPDK_getParameterValue rightButtedTap $inst]
        set tapCont         [iPDK_getParameterValue tapContacts $inst]
        set DFM_rule        [iPDK_getParameterValue DFMRules $inst]

        # check for min/max tap contacts
        set tapCont [ref90_symCheckParamValue tapContacts $tapCont $keys(minTapConts) $keys(maxTapConts) 0 1 $spice_model $inst $param]
        iPDK_setParameterValue tapContacts $tapCont $inst

        # Check for Recommended Layout Rules / DFM Rules
        set rule [expr {
                     [string match "Minimum" $DFM_rule] ? 0
                     : [string match "Recommended" $DFM_rule] ? 1
                     : [string match "Custom" $DFM_rule] ? 2
                     : 0
                     }]
        # Condition put for medium Vt rule
        if {($lbtTap || $rbtTap) && $baseType > 1 && $keys(controlBentPoly) } {
            puts "\n************************* $spice_model ******************************"
            puts "WARNING 0107> Parameter \"Butted Tap\" is not allowed for this model, turning it off."
            iPDK_setParameterValue leftButtedTap 0 $inst
            iPDK_setParameterValue rightButtedTap 0 $inst
        }    
    
        # Check for Recommended Layout Rules / DFM Rules
        set rulNam {polyDiffEndcap diffPolyEndcap m1ContactEndcap diffPolySpacing diffContactEnclose polyContactEndcap}
        set minVal [list $keys(polyDiffEndcap) $tech(diffPolyEnclose) $tech(metal1ContEndCapEnclose) \
                     $keys(polyDiffSpacing) $tech(diffContEnclose) $tech(polyContEndCapEnclose)]
        set recVal [list $keys(polyDiffEndcap_std_rec) $keys(diffPolyEnclose_rec) $keys(metal1ContEndCapEnclose_rec) \
                     $keys(polyDiffSpacing_rec) $keys(diffContEnclose_rec) $keys(polyContEndCapEnclose_rec)]
        set maxVal [list $keys(polyDiffEndcap_rec_max) $keys(diffPolyEnclose_rec_max) $keys(metal1ContEndCapEnclose_rec_max) \
                     $keys(polyDiffSpacing_rec_max) $keys(diffContEnclose_rec_max) $keys(polyContEndCapEnclose_rec_max)]

        ref90_symCalcDFMRules $DFM_rule $rule $rulNam $minVal $maxVal $recVal $grid $dbu $spice_model $inst tech keys   
   
        # Check for Tap architecturetapSpacing
        set tapSpacing [iPDK_engToSci [iPDK_getParameterValue tapIncrSpacing $inst]]
        if { ($tapSpacing > 0) && ($tapSpacing < [expr ($grid/double($dbu))*1e-6]) } {
	    set gridSpacing [iPDK_sciToEng  [expr ($grid/double($dbu))*1e-6]]
            puts "\n************************* $spice_model ******************************"
            puts "WARNING 0106> Parameter \"Tap Spacing (M)\" is less than minimum grid resolution $gridSpacing"
            puts "              Resetting Parameter \"Tap Spacing (M)\" to $gridSpacing\n"
	    set tapSpacing [expr ($grid/double($dbu))*1e-6]
            iPDK_setParameterValue tapIncrSpacing $gridSpacing $inst
	}
        if { $tapSpacing != 0 } {
            set tapSpac_grid [ref90_symGridCheck $tapSpacing $grid $dbu]
            set tapSpacing [ref90_symCheckParamValue tapIncrSpacing $tapSpacing 0 0 $tapSpac_grid 1 $spice_model $inst $param]
            iPDK_setParameterValue tapIncrSpacing [iPDK_sciToEng $tapSpacing] $inst
        }
    
        if { $tapShape == "standard" } {
            if {$tapCont > 1 } {
                puts "\n************************* $spice_model ******************************"
                puts "WARNING 0104> When Tap Structure is standard, Parameter \"Tap Contacts\" can't be more than 1 ."
                puts "              Resetting Parameter \"Tap Contacts\" to 1\n"
                iPDK_setParameterValue tapContacts 1 $inst
            }
            set optList [list tapTop tapBottom tapRight tapLeft]
            foreach i $optList {
                set post [iPDK_getParameterValue $i $inst]
                set opt [iPDK_getParamAttr prompt $inst $i]
                if {$post == "diffusion"} {
                    puts "\n************************* $spice_model ******************************************"  
                    puts "WARNING 0103> When Tap Structure is standard, Parameter \"$opt\" can't be $post."
                    puts "              Resetting Parameter \"$opt\" to all\n" 
                    iPDK_setParameterValue $i "all" $inst
                } 
            }
        }  
        
        set m1StrapWidthVal [iPDK_getParameterValue m1StrapWidth $inst]
        set leftButtedTap [iPDK_getParameterValue leftButtedTap $inst]
        set rightButtedTap [iPDK_getParameterValue rightButtedTap $inst]
        if {$m1StrapWidthVal != "0.1u" && ($leftButtedTap || $rightButtedTap)} {
            iPDK_setParamValue m1StrapWidth "0.1u" $inst 1
        }
    }
    # Length Parameter Calulations 
    if { ![ref90_symIsVariable [iPDK_getParameterValue l $inst]] } {
        set len [iPDK_engToSci [iPDK_getParameterValue l $inst]] 
        set lgrid [ref90_symGridCheck $len $grid $dbu]
        set len [ref90_symCheckParamValue l $len $minLength $maxLength $lgrid 1 $spice_model $inst $param]
        iPDK_setParameterValue l [iPDK_sciToEng [expr $len]] $inst
    }
    if {[ref90_symIsVariable [iPDK_getParameterValue l $inst]] } {
        set varMode 1 
    }
    # min/max checks for depending on the entry modes
    switch $Mode {

        "TotalWidth" {
            if { ![ref90_symIsVariable [iPDK_getParameterValue wtot $inst]] && ![ref90_symIsVariable [iPDK_getParameterValue nf $inst]] } {
                set WTOT [iPDK_engToSci [iPDK_getParameterValue wtot $inst]]
                set NF [iPDK_getParameterValue nf $inst]
                set NF [ref90_symCheckInteger nf $NF $spice_model $inst]
                iPDK_setParameterValue nf $NF $inst
                set WTOT_grid [ref90_symGridCheck $WTOT $grid $dbu]
                set WTOT [ref90_symCheckParamValue wtot $WTOT $minWidth $maxWidth $WTOT_grid 1 $spice_model $inst $param]
                iPDK_setParameterValue wtot [iPDK_sciToEng $WTOT] $inst
                set wid   [expr $WTOT/double($NF)]
                if { $wid < $minWidth } {
		    if { $param == "nf" } {
                        set new_NF [expr int($WTOT/double($minWidth))]
                        puts "\n*********************************** $spice_model ***********************"
                        puts "WARNING 0101> Calculated Width Per Finger (M) value [iPDK_sciToEng [expr $wid]] < minimum value \
			    [iPDK_sciToEng [expr $minWidth]]"
                        puts "              Resetting Number of Fingers $NF to $new_NF .\n"
                        set NF $new_NF
                        iPDK_setParameterValue nf $NF $inst
		    } elseif { $param == "wtot" } {
		        set new_WTOT [ expr $minWidth*double($NF)]
                        puts "\n*********************************** $spice_model ***********************"
                        puts "WARNING 0105> Calculated Width Per Finger value (M) [iPDK_sciToEng [expr $wid]] < minimum value \
			    [iPDK_sciToEng [expr $minWidth]]"
                        puts "              Resetting Total Width (M) [iPDK_sciToEng [expr $WTOT]] to \
			    [iPDK_sciToEng [expr $new_WTOT]] .\n"
			set WTOT $new_WTOT
			iPDK_setParameterValue wtot [iPDK_sciToEng [expr $new_WTOT]] $inst
		    }
		    
		    set wid [expr $WTOT/double($NF)]
                }
		set W_grid [ref90_symGridCheck $wid $grid $dbu]
                if { [expr $wid] != [expr $W_grid] } {
                    puts "\n*********************************** $spice_model ***********************"
                    puts "WARNING 0102> Calculated Width Per Finger Value [iPDK_sciToEng [expr $wid] ] is Off grid,"
		    puts "              Resetting Total width [iPDK_sciToEng [expr $WTOT]] to [iPDK_sciToEng [expr $W_grid*$NF]] to make Width Per Finger on grid\n"
                    set wid $W_grid 
                    set WTOT  [expr $wid*$NF] 
                    iPDK_setParameterValue wtot [iPDK_sciToEng [expr $WTOT]] $inst
                }
                iPDK_setParameterValue w [iPDK_sciToEng [expr $wid]] $inst
            } elseif {![ref90_symIsVariable [iPDK_getParameterValue wtot $inst]] && [ref90_symIsVariable [iPDK_getParameterValue nf $inst]]} {
                set WTOT [iPDK_engToSci [iPDK_getParameterValue wtot $inst]]
                set WTOT_grid [ref90_symGridCheck $WTOT $grid $dbu]
                set WTOT [ref90_symCheckParamValue wtot $WTOT $minWidth $maxWidth $WTOT_grid 1 $spice_model $inst $param]
                iPDK_setParameterValue wtot [iPDK_sciToEng [expr $WTOT]] $inst
                set wid  "(iPar(\"wtot\")/iPar(\"nf\"))"
                iPDK_setParameterValue w $wid $inst
                set varMode 1 
            } elseif {![ref90_symIsVariable [iPDK_getParameterValue nf $inst]] && [ref90_symIsVariable [iPDK_getParameterValue wtot $inst]]} {
                set NF [iPDK_getParameterValue nf $inst]
                set NF [ref90_symCheckInteger nf $NF $spice_model $inst]
                iPDK_setParameterValue nf $NF $inst 
                set wid  "(iPar(\"wtot\")/iPar(\"nf\"))"
                iPDK_setParameterValue w $wid $inst
                set varMode 1 
            } else {
                set wid  "(iPar(\"wtot\")/iPar(\"nf\"))"
                iPDK_setParameterValue w $wid $inst 
                set varMode 1 
            }
        } 
        "WidthPerFinger" {

            if { ![ref90_symIsVariable [iPDK_getParameterValue w $inst]] && ![ref90_symIsVariable [iPDK_getParameterValue nf $inst]] } {
                set wid [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set NF  [iPDK_getParameterValue nf $inst]
                set NF [ref90_symCheckInteger nf $NF $spice_model $inst]
                iPDK_setParameterValue nf $NF $inst
                set W_grid [ref90_symGridCheck $wid $grid $dbu]
                set wid [ref90_symCheckParamValue w $wid $minWidth $maxWidth $W_grid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng [expr $wid]] $inst
                set WTOT [expr $wid * $NF]
                iPDK_setParameterValue wtot [iPDK_sciToEng [expr $WTOT]] $inst
            } elseif { ![ref90_symIsVariable [iPDK_getParameterValue w $inst]] && [ref90_symIsVariable [iPDK_getParameterValue nf $inst]]} {
                set wid [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set W_grid [ref90_symGridCheck $wid $grid $dbu]
                set wid [ref90_symCheckParamValue w $wid $minWidth $maxWidth $W_grid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng [expr $wid]] $inst
                set WTOT "(iPar(\"w\") * iPar(\"nf\"))"
                iPDK_setParameterValue wtot $WTOT $inst   
                set varMode 1
            } elseif { ![ref90_symIsVariable [iPDK_getParameterValue nf $inst]] && [ref90_symIsVariable [iPDK_getParameterValue w $inst]]} {
                set NF  [iPDK_getParameterValue nf $inst]
                set NF  [ref90_symCheckInteger nf $NF $spice_model $inst]
                iPDK_setParameterValue nf $NF $inst
                set WTOT "(iPar(\"w\") * iPar(\"nf\"))"
                iPDK_setParameterValue wtot $WTOT $inst  
                set varMode 1
            } else {
                set WTOT "(iPar(\"w\") * iPar(\"nf\"))"
                iPDK_setParameterValue wtot $WTOT $inst 
                set varMode 1
            }
        }
    
    }
    
    # Scale parasitics to width per finger (level<54; BSIM3 and lower)
    if {$keys(parasiticsWPF)} {
        if {[ref90_symIsVariable [iPDK_getParameterValue fingers $inst]] } {
	    set scaleWPF "iPar(\"nf\")"
	} else {
	    set scaleWPF $NF
	}
    } else {
        set scaleWPF 1
    }
    
    # Check for Different Parasitics modes
    # Setting as/ad/ps/pd/nrs/nrd/sa/sb/sd parameters
    if { !$varMode } {
    
        set parasiticsList [ref90_symMosParasitics $len $wid $NF $spice_model $grid $dbu $inst tech keys]
        
	# Scale parasitics to width per finger (level<54; BSIM3 and lower)
        if {$keys(parasiticsWPF)} {set scaleWPF $NF} else {set scaleWPF 1}
	
        set parasiticsEntry  [iPDK_getParameterValue parasiticsMode $inst]
        if {$parasiticsEntry == "value"} {
	    set p2cs_val [iPDK_sciToEng [lindex $parasiticsList 0]]
	    set p2cd_val [iPDK_sciToEng [lindex $parasiticsList 1]]
	    set nrs_val  [iPDK_sciToEng [expr [lindex $parasiticsList 2]/$scaleWPF]]
	    set nrd_val  [iPDK_sciToEng [expr [lindex $parasiticsList 3]/$scaleWPF]]
	    set as_val   [iPDK_sciToEng [expr [lindex $parasiticsList 4]/$scaleWPF]]
	    set ad_val   [iPDK_sciToEng [expr [lindex $parasiticsList 5]/$scaleWPF]]
	    set ps_val   [iPDK_sciToEng [expr [lindex $parasiticsList 6]/$scaleWPF]]
	    set pd_val   [iPDK_sciToEng [expr [lindex $parasiticsList 7]/$scaleWPF]]	    
	    set sa_val   [iPDK_sciToEng [lindex $parasiticsList 8]]
	    set sb_val   [iPDK_sciToEng [lindex $parasiticsList 9]]
	    set sd_val   [iPDK_sciToEng [lindex $parasiticsList 10]]
            iPDK_setParameterValue p2cs $p2cs_val $inst
            iPDK_setParameterValue p2cd $p2cd_val $inst
            iPDK_setParameterValue nrs $nrs_val $inst
            iPDK_setParameterValue nrd $nrd_val $inst
            iPDK_setParameterValue as $as_val $inst
            iPDK_setParameterValue ad $ad_val $inst
            iPDK_setParameterValue ps $ps_val $inst
            iPDK_setParameterValue pd $pd_val $inst
            iPDK_setParameterValue sa $sa_val $inst
            iPDK_setParameterValue sb $sb_val $inst
            iPDK_setParameterValue sd $sd_val $inst
        } else {
	        
            set paraList {as ad ps pd nrs nrd sa sb sd}
            foreach i $paraList {
                ref90_symCheckParam [iPDK_getParameterValue $i $inst] $spice_model $inst $i
            }
	    set p2cs_val [iPDK_sciToEng [lindex $parasiticsList 0]]
	    set p2cd_val [iPDK_sciToEng [lindex $parasiticsList 1]]
            iPDK_setParameterValue p2cs $p2cs_val $inst
            iPDK_setParameterValue p2cd $p2cd_val $inst
        }
   } else {
       # Variable entry equation support for as,ad,ps,pd
       set sWidth [iPDK_sciToEng [ref90_symU2M [expr $tech(contMinWidth)+$tech(diffContEnclose)+$keys(polyContSpacing)]]]
       set dWidth $sWidth
       set fingers [iPDK_getParameterValue nf $inst]
       set nrd1 [expr [iPDK_engToSci [iPDK_getParameterValue p2cs $inst]] + $tech(contMinWidth)*1e-6/2]
       set nrs1 [expr [iPDK_engToSci [iPDK_getParameterValue p2cd $inst]] + $tech(contMinWidth)*1e-6/2]
       set nrd1 "$nrd1/iPar(\"w\")"
       set nrs1 "$nrs1/iPar(\"w\")"
       
       if { ![ref90_symIsVariable $fingers] } {
           set as1 "(iPar(\"wtot\")*$sWidth*[expr int($fingers/2)+1]/$fingers)/$scaleWPF"
           set ad1 "((iPar(\"wtot\")*$dWidth*[expr ceil($fingers/2.0)])/$fingers)/$scaleWPF"
           set ps1 "(($sWidth*[expr int($fingers/2)+1]+iPar(\"wtot\")*[expr int($fingers/2)+1])*2/$fingers)/$scaleWPF"
           set pd1 "((($dWidth*[expr ceil($fingers/2.0)]+iPar(\"wtot\")*[expr ceil($fingers/2.0)])*2/$fingers))/$scaleWPF"
       } else {
           set as1 "( iPar(\"wtot\")*$sWidth*((iPar(\"nf\")/2)+1)/(iPar(\"nf\")) ) / $scaleWPF"
           set ad1 "( (iPar(\"wtot\")*$dWidth*(iPar(\"nf\"))/2.0)/(iPar(\"nf\")) ) / $scaleWPF"
           set ps1 "( (($sWidth*(iPar(\"nf\")/2+1)+iPar(\"wtot\")*((iPar(\"nf\")/2)+1))*2/(iPar(\"nf\"))) ) / $scaleWPF"
           set pd1 "( (($dWidth*(iPar(\"nf\"))/2.0+iPar(\"wtot\")*(iPar(\"nf\"))/2.0)*2/(iPar(\"nf\"))) ) / $scaleWPF"
       }
       
       iPDK_setParameterValue as $as1 $inst
       iPDK_setParameterValue ad $ad1 $inst
       iPDK_setParameterValue ps $ps1 $inst
       iPDK_setParameterValue pd $pd1 $inst
       iPDK_setParameterValue nrd $nrd1 $inst
       iPDK_setParameterValue nrs $nrs1 $inst
       
   }

}
