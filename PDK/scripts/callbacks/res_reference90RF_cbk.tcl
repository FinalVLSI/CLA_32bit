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
#	19 Oct 06 : Adding First version
#	10 Feb 10 : Updated the way techfile information is fetched.
#               Corrected the precision of calculation of resistance value.
##########################################################################

##########################################################################
# Procedure used for setting the resistor properties depending on various 
# Entry modes.
# DEVICE TYPE    Resistor
# SUPPORTFILE    ref90_common.tcl and iPDK_snps.tcl
# DESCRIPTION    "2/3-Terminal Resistor"
##########################################################################
proc ref90_res_cbk {param} {

    # get current instance and parameter	
    set inst [iPDK_getCurrentInst]
	
    # get standard key values
    #ref90_getResDRValues [db::getAttr design -of $inst] tech layer keys mod

    set spice_model [iPDK_getParameterValue model $inst]

    # Check for invalid inputs, variables.
    set checkparamlist {r l w series parallel spacing m}
    foreach i $checkparamlist {
        ref90_symCheckParam [iPDK_getParameterValue $i $inst] $spice_model $inst $i
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

    # Fetch common Parameters from CDF data / keys
    set srs       [iPDK_getParameterValue series $inst]
    set prl       [iPDK_getParameterValue parallel $inst]
    set mult      [iPDK_getParameterValue m $inst]
    set mode      [iPDK_getParameterValue entryMode $inst]
    set dLegs     [iPDK_getParameterValue dummyLegs $inst]
    set resType   [iPDK_getParameterValue deviceType $inst]
    set inputSpacing  [iPDK_engToSci [iPDK_getParameterValue spacing $inst]]

    
    set minWidth     [ref90_symU2M [ref90_getPropValue minWidth $cellDMData]]
    set maxWidth     [ref90_symU2M [ref90_getPropValue maxWidth $cellDMData]]
    set minLength    [ref90_symU2M [ref90_getPropValue minLength $cellDMData]]
    set maxLength    [ref90_symU2M [ref90_getPropValue maxLength $cellDMData]]
    set dW           [ref90_symU2M [ref90_getPropValue dW $cellDMData]]
    set dL           [ref90_symU2M [ref90_getPropValue dL $cellDMData]]
    set rend         [ref90_getPropValue rend $cellDMData]
    set Rs           [ref90_getPropValue sheetResistance $cellDMData]
    set keys(resMaxSpacing) 100
    set resMaxSpacing 100u

    set tech(contMinWidth) [ref90_getPropValue contMinWidth $cellDMData]	
    set tech(diffMinSpacing) [ref90_getPropValue diffMinSpacing $cellDMData]
    set tech(nwellSpacing)  [ref90_getPropValue nwellSpacing $cellDMData]
    set keys(diffNwellEnclose) [ref90_getPropValue diffNwellEnclose $cellDMData]
    set tech(sabDiffEnclose) [ref90_getPropValue sabDiffEnclose $cellDMData]
    set tech(sabMinSpacing) [ref90_getPropValue sabMinSpacing $cellDMData]
    set tech(metal1Spacing) [ref90_getPropValue metal1Spacing $cellDMData]
    set tech(polyContEnclose) [ref90_getPropValue polyContEnclose $cellDMData]
    set tech(polyMinSpacing) [ref90_getPropValue polyMinSpacing $cellDMData]
    set tech(contMinSpacing) [ref90_getPropValue contMinSpacing $cellDMData]
    set tech(metal1ContEndCapEnclose) [ref90_getPropValue metal1ContEndCapEnclose $cellDMData]
    set tech(resMetSpacing) [ref90_getPropValue resMetSpacing $cellDMData]
    set keys(resNwellTermDiff) [ref90_getPropValue resNwellTermDiff $cellDMData]
    
    set tech(nplusMinSpacing) [ref90_getPropValue nplusMinSpacing $cellDMData]
    
    # check if value is not an integer or less than 1
    set mult [ref90_symCheckInteger m $mult $spice_model $inst]
    iPDK_setParameterValue m $mult $inst
    set srs [ref90_symCheckInteger series $srs $spice_model $inst]
    iPDK_setParameterValue series $srs $inst
    set prl [ref90_symCheckInteger parallel $prl $spice_model $inst]
    iPDK_setParameterValue parallel $prl $inst

     # Reset the other stripe based on where the callback is called from
    if { $param == "series" } {
        iPDK_setParameterValue parallel 1 $inst
        set prl 1
        set s_p 1
        set stripes $srs
    } elseif { $param == "parallel" } {
        iPDK_setParameterValue series 1 $inst
        set srs 1
        set s_p 0
        set stripes $prl
    }
    

    if { ![ref90_symIsVariable $srs] && ![ref90_symIsVariable $prl] } {
        if {$prl > 1} {
            set s_p 0
            set stripes $prl
        } elseif {$srs > 1} {
            set s_p 1
            set stripes $srs
        } else {
            set s_p 1
            set stripes 1
        }
    }
 
    # Set the lvs_model appropriately (From LVS Runset Equate Statement)
    iPDK_setParameterValue lvs_model $spice_model $inst


    switch $mode {

        "l & w" {
            
            # l & w are variables
            if { [ref90_symIsVariable [iPDK_getParameterValue l $inst] ] && [ref90_symIsVariable [iPDK_getParameterValue w $inst] ] } {
                set reff "((iPar(\"l\")/(iPar(\"series\")*iPar(\"parallel\"))+(-1*$dL))*$Rs/(iPar(\"w\")+(-1*$dW)) + \
                          2*$rend*1e-6/(iPar(\"w\")+(-1*$dW))) * iPar(\"series\")/iPar(\"parallel\")"
                iPDK_setParameterValue r $reff $inst

            # l is not variable & w is variable
            } elseif { ![ref90_symIsVariable [iPDK_getParameterValue l $inst] ] && [ref90_symIsVariable [iPDK_getParameterValue w $inst] ] } {
                set len   [iPDK_engToSci [iPDK_getParameterValue l $inst]]
                set lgrid [ref90_symGridCheck $len $grid $dbu]
                set len   [ref90_symCheckParamValue l $len $minLength $maxLength $lgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue l [iPDK_sciToEng $len] $inst
                set reff "((iPar(\"l\")/(iPar(\"series\")*iPar(\"parallel\"))+(-1*$dL))*$Rs/(iPar(\"w\")+(-1*$dW)) + \
                          2*$rend*1e-6/(iPar(\"w\")+(-1*$dW))) * iPar(\"series\")/iPar(\"parallel\")"
                iPDK_setParameterValue r $reff $inst

            # w is not variable & l is variable
            } elseif { [ref90_symIsVariable [iPDK_getParameterValue l $inst] ] && ![ref90_symIsVariable [iPDK_getParameterValue w $inst] ] } {
                set wid   [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set wgrid [ref90_symGridCheck $wid $grid $dbu]
                set wid   [ref90_symCheckParamValue w $wid $minWidth $maxWidth $wgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng $wid] $inst
                set reff "((iPar(\"l\")/(iPar(\"series\")*iPar(\"parallel\"))+(-1*$dL))*$Rs/(iPar(\"w\")+(-1*$dW)) + \
                          2*$rend*1e-6/(iPar(\"w\")+(-1*$dW))) * iPar(\"series\")/iPar(\"parallel\")"
                iPDK_setParameterValue r $reff $inst

            # series/parallel are variables BUT l,w not variables
            } elseif { [ref90_symIsVariable $srs] || [ref90_symIsVariable $prl] } {
                set len   [iPDK_engToSci [iPDK_getParameterValue l $inst]]
                set lgrid [ref90_symGridCheck $len $grid $dbu]
                set len   [ref90_symCheckParamValue l $len $minLength $maxLength $lgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue l [iPDK_sciToEng $len] $inst
                set wid   [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set wgrid [ref90_symGridCheck $wid $grid $dbu]
                set wid   [ref90_symCheckParamValue w $wid $minWidth $maxWidth $wgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng $wid] $inst
                set reff "((iPar(\"l\")/(iPar(\"series\")*iPar(\"parallel\"))+(-1*$dL))*$Rs/(iPar(\"w\")+(-1*$dW)) + \
                          2*$rend*1e-6/(iPar(\"w\")+(-1*$dW))) * iPar(\"series\")/iPar(\"parallel\")"
                iPDK_setParameterValue r $reff $inst

            # Regular Input mode
            } elseif { ![ref90_symIsVariable [iPDK_getParameterValue l $inst] ] && ![ref90_symIsVariable [iPDK_getParameterValue w $inst] ] && \
                       ![ref90_symIsVariable $srs] && ![ref90_symIsVariable $prl]} {

                set wid   [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set wgrid [ref90_symGridCheck $wid $grid $dbu]
                set wid   [ref90_symCheckParamValue w $wid $minWidth $maxWidth $wgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng $wid] $inst

                set len   [iPDK_engToSci [iPDK_getParameterValue l $inst]]
                set lgrid [ref90_symGridCheck $len $grid $dbu]
                set len   [ref90_symCheckParamValue l $len $minLength 0 $lgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue l [iPDK_sciToEng $len] $inst

                set stripeLength [expr $len]
                set stripeLengthGrid [ref90_symGridCheck $stripeLength $grid $dbu]
                
		set totLength [expr $len*$stripes]
		
                if { $stripeLengthGrid < $minLength } {
                    set newStripes [expr int($totLength / $minLength)]
                    puts "\n****************************** $spice_model **************************************"
                    if { $s_p == 1} {
                    	puts "WARNING 0201> Stripe length value [iPDK_sciToEng [expr $stripeLength]] < min Length [iPDK_sciToEng $minLength],"
                        puts "              Resetting the number of Series Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
			set len [expr $totLength/double($stripes)]			
                        iPDK_setParameterValue series $newStripes $inst
                    } elseif { $s_p == 0} {
                    	puts "WARNING 0201> Stripe length value [iPDK_sciToEng [expr $stripeLength]] < min Length [iPDK_sciToEng $minLength],"
                        puts "              Resetting the number of Parallel Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
			set len [expr $totLength/double($stripes)]			
                        iPDK_setParameterValue parallel $newStripes $inst
                    }
                } elseif { $stripeLengthGrid > $maxLength } {
                    set newStripes [expr int(ceil($len / $maxLength))]
                    puts "\n******************************* $spice_model *************************************"
                    if { $s_p == 1} {
                    	puts "WARNING 0202> Stripe length value [iPDK_sciToEng [expr $stripeLength]] > max length [iPDK_sciToEng $maxLength],"
                        puts "               Resetting the number of Series Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
			set len [expr $len/double($stripes)]
                        iPDK_setParameterValue series $newStripes $inst
                    } elseif { $s_p == 0} {
                    	puts "WARNING 0202> Stripe length value [iPDK_sciToEng [expr $stripeLength]] > max length [iPDK_sciToEng $maxLength],"
                        puts "               Resetting the number of Parallel Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
			set len [expr $len/double($stripes)]
                        iPDK_setParameterValue parallel $newStripes $inst
                    }
                } elseif {[expr $stripeLengthGrid] != [expr $stripeLength]} {
                    # makes sure that the length is a multiple of a stripe length which is on grid
                    set lgrid [expr $stripeLengthGrid]
                    puts "\n******************************* $spice_model *************************************"
                    puts "WARNING 0203> The computed resistor stripe length value [iPDK_sciToEng [expr $stripeLength]] is off grid,"
                    puts "              Resetting the length property \[l\] from [iPDK_sciToEng $len] to [iPDK_sciToEng $lgrid]\n"
                    set len $lgrid
                    iPDK_setParameterValue l [iPDK_sciToEng $lgrid] $inst
                }

                set stripeLengthGrid [expr $len]
		set stripeLengthGrid [ref90_symGridCheck $stripeLengthGrid $grid $dbu]
                set len [expr $stripeLengthGrid]
                iPDK_setParameterValue l [iPDK_sciToEng $len] $inst
                set reff [ref90_symResCalcVal "NA" $wid $stripeLengthGrid $dW $dL $Rs $rend $stripes $s_p $grid $dbu]
		
                set r $reff
                iPDK_setParameterValue r [iPDK_sciToEng $reff] $inst
             }

        }
                   
        "r & w" {
            # w is variable
            if { [ref90_symIsVariable [iPDK_getParameterValue w $inst] ] } {
                set len "( ( ( iPar(\"r\")*(iPar(\"w\")+(-1*$dW))*iPar(\"parallel\")/iPar(\"series\") ) - \
                        2*$rend*1e-6) / $Rs + $dL ) *iPar(\"parallel\")*iPar(\"series\")"
                iPDK_setParameterValue l $len $inst

            # w is not variable & r is variable
            } elseif { [ref90_symIsVariable [iPDK_getParameterValue r $inst] ] && ![ref90_symIsVariable [iPDK_getParameterValue w $inst] ] } {
                set wid   [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set wgrid [ref90_symGridCheck $wid $grid $dbu]
                set wid   [ref90_symCheckParamValue w $wid $minWidth $maxWidth $wgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng $wid] $inst
                set len "( ( ( iPar(\"r\")*(iPar(\"w\")+(-1*$dW))*iPar(\"parallel\")/iPar(\"series\") ) - \
                        2*$rend*1e-6) / $Rs + $dL ) *iPar(\"parallel\")*iPar(\"series\")"
                iPDK_setParameterValue l $len $inst

            # series/parallel are variables BUT r,w not variables
            } elseif { [ref90_symIsVariable $srs] || [ref90_symIsVariable $prl] } {
                set wid   [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set wgrid [ref90_symGridCheck $wid $grid $dbu]
                set wid   [ref90_symCheckParamValue w $wid $minWidth $maxWidth $wgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng $wid] $inst
                set len "( ( ( iPar(\"r\")*(iPar(\"w\")+(-1*$dW))*iPar(\"parallel\")/iPar(\"series\") ) - \
                        2*$rend*1e-6) / $Rs + $dL ) *iPar(\"parallel\")*iPar(\"series\")"
                iPDK_setParameterValue l $len $inst

            # Regular Input mode
            } elseif { ![ref90_symIsVariable [iPDK_getParameterValue r $inst] ] && ![ref90_symIsVariable [iPDK_getParameterValue w $inst] ]  && \
                       ![ref90_symIsVariable $srs] && ![ref90_symIsVariable $prl] } {

                set r   [iPDK_engToSci [iPDK_getParameterValue r $inst]]
                set wid   [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                set wgrid [ref90_symGridCheck $wid $grid $dbu]
                set wid   [ref90_symCheckParamValue w $wid $minWidth $maxWidth $wgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue w [iPDK_sciToEng $wid] $inst
                set stripeLength [ref90_symResCalcVal $r $wid "NA" $dW $dL $Rs $rend $stripes $s_p $grid $dbu]
                set length [expr $stripeLength]
                # needed to resolve Tcl roundoff problems from the stripeLength division operation
                set length [expr ($length * $dbu) / double($dbu)]
                set RecalcW 0
                if { $param == "r" || $param == "w"} {
 	            set length_new [ref90_symCheckParamValue l $length $minLength 0 0 0 $spice_model $inst $param]
                    if {$length != $length_new} {
                        set RecalcW 1
                    }
                    set length $length_new
                    set stripeLength [expr $length]
                }

                if { $stripeLength < $minLength } {
                    set newStripes "1"
                    puts "\n********************************* $spice_model ***********************************"
                    if { $s_p == 1} {
                    	puts "WARNING 0201> Stripe length value [iPDK_sciToEng [expr $stripeLength]] < min Length [iPDK_sciToEng $minLength],"
                        puts "              Resetting the number of Series Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
                        iPDK_setParameterValue series $newStripes $inst
                    } elseif { $s_p == 0} {
                    	puts "WARNING 0201> Stripe length value [iPDK_sciToEng [expr $stripeLength]] < min Length [iPDK_sciToEng $minLength],"
                        puts "              Resetting the number of Parallel Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
                        iPDK_setParameterValue parallel $newStripes $inst
                    }
		    # update stripeLength
                    set stripeLength [ref90_symResCalcVal $r $wid "NA" $dW $dL $Rs $rend $stripes $s_p $grid $dbu]
		    # Check for the minLength condition when the input r-value is too small and also when r = 0
		    if { $stripeLength < $minLength } { 
		    	 set stripeLength $minLength
		    }
	            set length       [expr $stripeLength]
		    
                } elseif { $stripeLength > $maxLength } {
                    set newStripes [expr int(ceil($length / $maxLength))]
                    puts "\n*************************** $spice_model *****************************************"
                    if { $s_p == 1} {
                    	puts "WARNING 0202> Stripe length value [iPDK_sciToEng [expr $stripeLength]] > max Length [iPDK_sciToEng $maxLength],"
                        puts "              Resetting the number of Series Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
                        iPDK_setParameterValue series $newStripes $inst
                    } elseif { $s_p == 0} {
                    	puts "WARNING 0202> Stripe length value [iPDK_sciToEng [expr $stripeLength]] > max Length [iPDK_sciToEng $maxLength],"
                        puts "              Resetting the number of Parallel Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
                        iPDK_setParameterValue parallel $newStripes $inst
                    }
		    # update stripeLength
                    set stripeLength [ref90_symResCalcVal $r $wid "NA" $dW $dL $Rs $rend $stripes $s_p $grid $dbu]
	            set length       [expr $stripeLength]
                }
                # Update final values onto the form
                iPDK_setParameterValue l [iPDK_sciToEng $length] $inst

                if {$param == "w"} {
                    # Recalculate w if calculated l had changed
                    if {$RecalcW} {
                        set wid [ref90_symResCalcVal $r "NA" [expr $length] $dW $dL $Rs $rend $stripes $s_p $grid $dbu]
                        # Eliminate rounding errors of calculated Width
                        if { $wid < $minWidth } {
                            set wid $minWidth
                        } elseif { $wid > $maxWidth } {
                            set wid $maxWidth
                        }
                        iPDK_setParameterValue w [iPDK_sciToEng $wid] $inst
                    }
                    # Recalculate R
                    set r [ref90_symResCalcVal "NA" $wid [expr $length] $dW $dL $Rs $rend $stripes $s_p $grid $dbu]
                    iPDK_setParameterValue r [iPDK_sciToEng $r] $inst
                }

                set r [ref90_symResCalcVal "NA" $wid [expr $length] $dW $dL $Rs $rend $stripes $s_p $grid $dbu]
                iPDK_setParameterValue r [iPDK_sciToEng $r] $inst

            }

       	}
        
        "r & l" {

            # l is variable
            if { [ref90_symIsVariable [iPDK_getParameterValue l $inst] ] } {
                set wid "( (iPar(\"l\")/(iPar(\"series\")*iPar(\"parallel\"))+(-1*$dL))*$Rs + 2*$rend*1e-6 ) * \
                        iPar(\"series\")/(iPar(\"parallel\")*iPar(\"r\")) + $dW"
                iPDK_setParameterValue w $wid $inst

            # l is not variable & r is variable
            } elseif { [ref90_symIsVariable [iPDK_getParameterValue r $inst] ] && ![ref90_symIsVariable [iPDK_getParameterValue l $inst] ] } {
                set len   [iPDK_engToSci [iPDK_getParameterValue l $inst]]
                set lgrid [ref90_symGridCheck $len $grid $dbu]
                set len   [ref90_symCheckParamValue l $len $minLength $maxLength $lgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue l [iPDK_sciToEng $len] $inst
                set wid "( (iPar(\"l\")/(iPar(\"series\")*iPar(\"parallel\"))+(-1*$dL))*$Rs + 2*$rend*1e-6 ) * \
                        iPar(\"series\")/(iPar(\"parallel\")*iPar(\"r\")) + $dW"
                iPDK_setParameterValue w $wid $inst

            # series/parallel are variables BUT r,l not variables
            } elseif { [ref90_symIsVariable $srs] || [ref90_symIsVariable $prl] } {
                set len   [iPDK_engToSci [iPDK_getParameterValue l $inst]]
                set lgrid [ref90_symGridCheck $len $grid $dbu]
                set len   [ref90_symCheckParamValue l $len $minLength $maxLength $lgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue l [iPDK_sciToEng $len] $inst
                set wid "( (iPar(\"l\")/(iPar(\"series\")*iPar(\"parallel\"))+(-1*$dL))*$Rs + 2*$rend*1e-6 ) * \
                        iPar(\"series\")/(iPar(\"parallel\")*iPar(\"r\")) + $dW"
                iPDK_setParameterValue w $wid $inst

            # Regular Input mode
            } elseif { ![ref90_symIsVariable [iPDK_getParameterValue r $inst] ] && ![ref90_symIsVariable [iPDK_getParameterValue l $inst] ] && \
                       ![ref90_symIsVariable $srs] && ![ref90_symIsVariable $prl] } {
                set r   [iPDK_engToSci [iPDK_getParameterValue r $inst]]
                set len   [iPDK_engToSci [iPDK_getParameterValue l $inst]]
                set lgrid [ref90_symGridCheck $len $grid $dbu]
                set len   [ref90_symCheckParamValue l $len $minLength 0 $lgrid 1 $spice_model $inst $param]
                iPDK_setParameterValue l [iPDK_sciToEng $len] $inst
                set stripeLength [expr $len]
                set stripeLengthGrid [ref90_symGridCheck $stripeLength $grid $dbu]
                set totLength [expr $len*$stripes]
		
		# To calculate the r value when the input r value is zero
		if {$param == "r" && !$r} {
		    set wid   [iPDK_engToSci [iPDK_getParameterValue w $inst]]
                    set r [ref90_symResCalcVal "NA" $wid $len $dW $dL $Rs $rend $stripes $s_p $grid $dbu]
		    puts "\n***************************** $spice_model ***************************************"
                    puts "WARNING 0203> The resistor value cannot be Zero, Resetting to $r"
                    iPDK_setParameterValue r [iPDK_sciToEng $r] $inst 
		}

                if { $stripeLengthGrid < $minLength } {
                    set newStripes [expr int($totLength / $minLength)]
                    puts "\n***************************** $spice_model ***************************************"
                    if { $s_p == 1} {
                    	puts "WARNING 0201> Stripe length value [iPDK_sciToEng [expr $stripeLength]] < min Length [iPDK_sciToEng $minLength],"
                        puts "              Resetting the number of Series Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
			set len [expr $totLength/double($stripes)]
                        iPDK_setParameterValue series $newStripes $inst
                    } elseif { $s_p == 0} {
                    	puts "WARNING 0201> Stripe length value [iPDK_sciToEng [expr $stripeLength]] < min Length [iPDK_sciToEng $minLength],"
                        puts "              Resetting the number of Parallel Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
			set len [expr $totLength/double($stripes)]
                        iPDK_setParameterValue parallel $newStripes $inst
                    }
                } elseif { $stripeLengthGrid > $maxLength } {
                    set newStripes [expr int(ceil($len / $maxLength))]
                    puts "\n***************************** $spice_model ***************************************"
                    if { $s_p == 1} {
                    	puts "WARNING 0202> Stripe length value [iPDK_sciToEng [expr $stripeLength]] > max Length [iPDK_sciToEng $maxLength],"
                        puts "              Resetting the number of Series Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
			set len [expr $len/double($stripes)]
                        iPDK_setParameterValue series $newStripes $inst
                    } elseif { $s_p == 0} {
                    	puts "WARNING 0202> Stripe length value [iPDK_sciToEng [expr $stripeLength]] > max Length [iPDK_sciToEng $maxLength],"
                        puts "              Resetting the number of Parallel Stripes $stripes to $newStripes.\n"
                        set stripes $newStripes
			set len [expr $len/double($stripes)]
                        iPDK_setParameterValue parallel $newStripes $inst
                    }
                } elseif {[expr $stripeLengthGrid] != [expr $stripeLength]} {
                    set lgrid [expr $stripeLengthGrid * $stripes]
                    puts "\n***************************** $spice_model ***************************************"
                    puts "WARNING 0203> The resistor stripe length value [iPDK_sciToEng [expr $stripeLength]] is off grid,"
                    puts "              Resetting the length property \[l\] from [iPDK_sciToEng $len] to [iPDK_sciToEng $lgrid]\n"
                    iPDK_setParameterValue l [iPDK_sciToEng $lgrid] $inst
                }
	        
		# Recalculate stripelength according to new stripes 
                set len              [iPDK_engToSci [iPDK_getParameterValue l $inst]]
                set stripeLength     [expr $len]
                set stripeLengthGrid [ref90_symGridCheck $stripeLength $grid $dbu]
                set wid [ref90_symResCalcVal $r "NA" $stripeLengthGrid $dW $dL $Rs $rend $stripes $s_p $grid $dbu]

                # Checking the calculated width
                set RecalcL 0
                if { $param == "r" || $param == "l"} {
                    set wid_new [ref90_symCheckParamValue w $wid $minWidth $maxWidth 0 0 $spice_model $inst $param]
                    if {$wid != $wid_new} {
                        set RecalcL 1
                    }
                    set wid $wid_new
                }
                iPDK_setParameterValue w [iPDK_sciToEng $wid] $inst

                # Update final values onto the form
                if {$param == "r"} {
                    set r [ref90_symResCalcVal "NA" $wid $stripeLengthGrid $dW $dL $Rs $rend $stripes $s_p $grid $dbu]
                    iPDK_setParameterValue r [iPDK_sciToEng $r] $inst
                } elseif {$param == "l"} {
                    # Recalculate L if calculated w had changed
                    if {$RecalcL} {
                        set len [ref90_symResCalcVal $r $wid "NA" $dW $dL $Rs $rend $stripes $s_p $grid $dbu]
                        # Eliminate rounding errors of calculated length
                        if { $len < $minLength } {
                            set len $minLength
                        } elseif { $len > $maxLength } {
                            set len $maxLength
                        }
                        iPDK_setParameterValue l [iPDK_sciToEng [expr $len]] $inst
                    }
                    # Recalculate R
                    set r [ref90_symResCalcVal "NA" $wid $len $dW $dL $Rs $rend $stripes $s_p $grid $dbu]
                    iPDK_setParameterValue r [iPDK_sciToEng $r] $inst
                }
            }
       	}
    }


    ## Update the Leff parameter for Spice Simulation
    if { [ref90_symIsVariable [iPDK_getParameterValue l $inst]] || [ref90_symIsVariable [iPDK_getParameterValue w $inst]] || \
         [ref90_symIsVariable [iPDK_getParameterValue r $inst]] || [ref90_symIsVariable $srs] || [ref90_symIsVariable $prl] } {
        iPDK_setParameterValue Leff "iPar(\"l\")*iPar(\"series\")/(iPar(\"parallel\"))" $inst

    } else {
        set lcheck   [iPDK_engToSci [iPDK_getParameterValue l $inst]]
        set prl      [iPDK_engToSci [iPDK_getParameterValue parallel $inst]]
        set srs      [iPDK_engToSci [iPDK_getParameterValue series $inst]]
        set leff_tmp [expr double($lcheck)*$srs/($prl)]
        set leff     [ref90_symGridCheck $leff_tmp $grid $dbu]
        iPDK_setParameterValue Leff [iPDK_sciToEng $leff] $inst
    }


    # For variable inputs, EXIT at this point
    if { [ref90_symIsVariable [iPDK_getParameterValue l $inst]] || [ref90_symIsVariable [iPDK_getParameterValue w $inst]] || \
         [ref90_symIsVariable [iPDK_getParameterValue r $inst]] || [ref90_symIsVariable $srs] || \
	 [ref90_symIsVariable [iPDK_getParameterValue m $inst]] || [ref90_symIsVariable [iPDK_getParameterValue parallel $inst]] } {
        
        return
	
    }
    
    # Get current width & stripeLength from form
    set cur_w  [iPDK_engToSci [iPDK_getParameterValue w $inst]]
    set cur_sl [iPDK_engToSci [iPDK_getParameterValue l $inst]]
    
    # Stripe Spacing checks
    #if {[ref90_symIsLayout]} {
    #    if { $stripes !=1  || $dLegs != "none" } {
    #        set minStripeSpacing [ref90_symU2M [ref90_getPropValue spacing $cellDMData]]
    #        set maxStripeSpacing [ref90_symU2M $keys(resMaxSpacing)]
    #        set spacinggrid [ref90_symGridCheck $inputSpacing $grid $dbu]
    #        set spacingVal  [ref90_symCheckParamValue spacing $inputSpacing $minStripeSpacing $maxStripeSpacing $spacinggrid 1 $spice_model $inst $param]
    #       iPDK_setParameterValue spacing [iPDK_sciToEng $spacingVal] $inst

    #    }
    #}

    if {[ref90_symIsLayout]} {
        if { $stripes !=1  || $dLegs != "none" } {
            set minStripeSpacing [ref90_symResSpacingCheck $resType $cur_w $inst tech keys] 
            # The following if condition is to take care of the after increasing the stripe spacing from the minimum value (nwell spacing) the implant to implant spacing is violated. So increase the sapcing to a minimum larger value such that no DRC happens.   
            if { [regexp {nwell} $resType] && ($inputSpacing > $minStripeSpacing)} {
		set minStripeSpacing [expr $minStripeSpacing + $tech(nplusMinSpacing)*1e-6]
	    }		
            set maxStripeSpacing [iPDK_engToSci $resMaxSpacing]
            set spacinggrid [ref90_symGridCheck $inputSpacing $grid $dbu]
            set spacingVal  [ref90_symCheckParamValue spacing $inputSpacing $minStripeSpacing \
		$maxStripeSpacing $spacinggrid 1 $spice_model $inst $param]
            iPDK_setParameterValue spacing [iPDK_sciToEng $spacingVal] $inst

        }
    }


    


    # Check for Recommended Hspice Rules
    set msg1 ""
    set msg2 ""
    set msg3 ""
    if { [oa::PropFind $cellDMData numSquares] != "" } {
        set squares [ref90_getPropValue numSquares $cellDMData]
        if { [expr $cur_sl/$cur_w] < $squares} {
	    set msg1 "\n               Min.Squares (l/w) >= $squares"
	}
    }
    if { [oa::PropFind $cellDMData minL_rec] != ""} {
        set minL [ref90_getPropValue minL_rec $cellDMData]
        if { $cur_sl < [ref90_symU2M $minL] } {
            set msg2 "\n               Min.Length = ${minL}u"
	}
    }
    if { [oa::PropFind $cellDMData minW_rec] != ""} {
        set minW [ref90_getPropValue minW_rec $cellDMData]
        if { $cur_w < [ref90_symU2M $minW] } {
            set msg3 "\n               Min.Width = ${minW}u"
	}
    }

    if { "$msg1$msg2$msg3" != "" } {
        puts "\n************************** $spice_model *****************************************"
        puts "WARNING 0204> Foundry Recommended rules for Spice Model accuracy :"
	puts $msg1$msg2$msg3
    }


}
