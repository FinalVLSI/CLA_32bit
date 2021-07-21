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
################################################################################


################################################################################
# 
#
# Arguments:
#
# Return:
#
################################################################################
proc ref90_getPropValue { prop cellDMData  } {
  return [oa::getValue [oa::PropFind $cellDMData $prop]]
}

################################################################################
# Converts a value from microns to meters
#
# Arguments:
# val - value to be converted
#
# Return:
# The value in meters
#
################################################################################
proc ref90_symU2M { val } {
    return [expr $val*1e-6]
}

################################################################################
# Returns the library name of the instance object ID returned by 
# iPDK_getCurrentInst.
#
# Arguments:
# inst - instance ID of the instance returned by iPDK_getCurrentInst
# 
# Return:
# The library name
#
################################################################################
proc ref90_getInstLibName {inst} {
    set instMaster [oa::getMaster   $inst]
    return [oa::getLibName  $instMaster]
}

################################################################################
# Returns the cell name of the instance object ID returned by iPDK_getCurrentInst.
#
# Arguments:
# inst - instance ID of the instance returned by iPDK_getCurrentInst
#
# Return:
# The cell name
#
################################################################################
proc ref90_getInstCellName {inst} {
    set instMaster [oa::getMaster   $inst]
    return [oa::getCellName $instMaster]
}

################################################################################
# 
#
# Arguments:
#
# Return:
#
################################################################################
proc ref90_symCheckInteger { pName pVal spice_model inst} {

    set pName [iPDK_getParamAttr prompt $inst $pName]
    # Return without checking in case of variable inputs
    if { [ref90_symIsVariable $pVal] } {
        return $pVal
    } elseif {[regexp {([a-zA-Z]+$)} $pVal]} {
        puts "\n************** $spice_model ***************************"  
        set PVal 1
        puts "WARNING 0002> Parameter \"$pName\" $pVal not an integer. Resetting to integer value $PVal\n"
	set pVal $PVal
    } elseif { $pVal < 1 } {
        puts "\n************** $spice_model ***************************"  
        set PVal 1
        puts "WARNING 0002> Parameter \"$pName\" $pVal not an integer. Resetting to integer value $PVal\n"
	set pVal $PVal
        return $pVal
    } elseif { $pVal != [expr int($pVal)]} {
        puts "\n************** $spice_model ***************************"
        set PVal [expr int($pVal)]
        puts "WARNING 0002> Parameter \"$pName\" $pVal not an integer. Resetting to integer value $PVal\n"
	set pVal $PVal
        return $pVal
    } else {
        return $pVal
    }
}

################################################################################
# Procedure to check for variable inputs
#
# Arguments:
# paramValue - 
#
# Return:
#
################################################################################
proc ref90_symIsVariable { paramValue } {

    if { [regexp {([i][n][s][t])|([p][a][r][e][n][t])|([l][i][n][e][a][g][e])|([P][a][r])} $paramValue match] } {
        return 1
    } elseif { [regexp {(^\[+)}  $paramValue ] } {
        return 1
    } elseif { [regexp {(^[a-zA-Z]+$)|(^[a-zA-Z]+)} $paramValue ]} {
        if { [regexp {(^[a-zA-Z]+)((\*+)|(\/+)|(\-+)|(\++) \
          |(\%+))(([a-zA-Z]+$)|([0-9]+$))} $paramValue ] && ![regexp {(\@+)|(\^+)|(\&+)|(\(+)|(\)+)|(\|+)|(\{+)|(\}+)|(\<+) \
          |(\>+)|(\?+)|(\:+)|(\;+)|(\"+)|(\'+)|(\=+)|(\`+)|(\~+)|(\,+)} $paramValue ]} {
            return 1

         } elseif { [regexp {(^[a-zA-Z]+$)|(^[a-zA-Z]+)} $paramValue ] && ![regexp {(\@+)|(\^+)|(\&+)|(\(+)|(\)+)|(\|+)|(\{+)|(\}+)| \
             (\<+)|(\>+)|(\?+)|(\:+)|(\;+)|(\"+)|(\'+)|(\=+)|(\`+)|(\~+)|(\,+)} $paramValue ]} {
             return 1

         } else {
            
            # input error
             return 2

         }

    # if input begins with a number
    } elseif { ([regexp {(^[0-9]+$)|(^[0-9]+\.[0-9]+$)|(^\.[0-9]+$)} $paramValue ] \
       || [regexp {((^[0-9]+)|(^[0-9]+\.[0-9]+)|(^\.[0-9]+))([a-zA-Z]+$)} $paramValue ] \
       || [regexp {((^[0-9]+)|(^[0-9]+\.[0-9]+)|(^\.[0-9]+))(([a-zA-Z]+)|(\++)|(\!+)| \
        (\#+)|(\$+)|(\%+)|(\[+)|(\]+)|(\_+)|(\/+)|(\*+)|(\-+))} $paramValue ]) && ![regexp { } $paramValue] } {

        if { [regexp {(^[0-9]+)|(^[0-9]+\.[0-9]+)|(^\.[0-9]+)} $paramValue match] } {
            if { [regexp {(^[0-9]+$)|(^[0-9]+\.[0-9]+$)|(^\.[0-9]+$)} $paramValue ] } {
                return 0
            } else {
                  
                  set sample_value [string trimleft $paramValue $match]
                  if {[regexp {^([y]|[z]|[a]|[f]|[p]|[n]|[u]|[m]|[c]|[k]|[M]|(^[m][e][g])|[X]|[G]|[T]|[P]|[E]|[Z]|[Y])$} $sample_value] \
                  && ![regexp {[0-9]$} $sample_value ]} {
                      return 0
 
                  } elseif {[regexp {(^[eE][0-9]+$)|(^[eE]([\-]|[\+])[0-9]+$)} $sample_value check ] || [regexp {(^[0-9]+$)|(^[0-9]+\.[0-9]+$)} \
                    $sample_value check ]} {
                      return 0
              
                  } elseif { [regexp {((\*+)|(\/+)|(\-+)|(\++)|(\%+))(([a-zA-Z]+)|([0-9]+))} $sample_value ] \
                    || [regexp {([a-zA-Z]+)((\*+)|(\/+)|(\-+)|(\++)|(\%+))(([a-zA-Z]+$)|([0-9]+$))} $sample_value ] \
                    && ![regexp {(\@+)|(\^+)|(\&+)|(\(+)|(\)+)|(\|+)|(\{+)|(\}+)|(\<+)|(\>+)|(\?+)|(\:+)|(\;+)| \
                    (\"+)|(\'+)|(\=+)|(\`+)|(\~+)|(\,+)} $sample_value ] } {
                      return 1

                  } elseif { [regexp {(\@+)|(\^+)|(\&+)|(\(+)|(\)+)|(\|+)|(\{+)|(\}+)|(\<+)|(\>+)|(\?+)|(\:+) \
                    |(\;+)|(\"+)|(\'+)|(\=+)|(\`+)|(\~+)|(\,+)} $sample_value ]} {   
                     # input error
                      return 2

                  } else {
                      # input error
                      return 2

                  }
              }
        }
    } else {
        return 0
    }
}

################################################################################
# 
#
# Arguments:
#
# Return:
#
################################################################################
proc ref90_symCapCalcVal {len wid cval Cf Ca dw dl constant grid dbu} {
    set mode [expr {($len == "NA" && $wid == "NA") ? "modeC" : [expr {($cval != "NA" && $wid != "NA") ? "modeCW": [expr {($cval == "NA" && $wid != "NA")? "modeLW" : "modeW"}]}]}]
    switch $mode {
	   modeC {
	       set varC [expr $dw*$dl*$Ca+$constant-$cval-2*($dw+$dl)*$Cf]
           set varB [expr 4*$Cf-$Ca*($dl+$dw)]
           set temp [expr (sqrt($varB*$varB-4*$Ca*$varC)-$varB)/(2*$Ca)]
	       return [ref90_symGridCheck $temp $grid $dbu]
	
	   }
        modeLW {
           set C_temp [expr ($Ca*($len-$dl)*($wid-$dw) + 2*(($len-$dl) + ($wid-$dw))*$Cf + $constant)]
           return  $C_temp
	
	   }
	   modeCW {
	        set l_temp1 [expr $cval-2*$Cf*$wid-$constant]
            set l_temp2 [expr ($Ca*$wid)+(2*$Cf)]
            return [ref90_symGridCheck [expr ($l_temp1/$l_temp2)+$dl] $grid $dbu]
	
	   } 
	   modeW {
	      set w_temp1 [expr $cval-2*$Cf*$len-$constant]
          set w_temp2 [expr ($Ca*$len)+(2*$Cf)]
          return [ref90_symGridCheck [expr ($w_temp1/$w_temp2)+$dl] $grid $dbu]
	
	   }
    }
}


################################################################################
# Rounds input value to grid.
#
# Arguments:
# val - the input value
# grid - the grid value
# dbu - database units per user units
#
# Return:
# The rounded value.
#
################################################################################
proc ref90_symGridCheck { val grid dbu } {
    set gdu [expr $grid/double($dbu)]
    #    set val1 [expr round(($val/1e-6)/$gdu)]

    # Fix for TCL Error: Integer value too large to represent
    if { [catch {expr round($val*1e6/$gdu)}] } {
        set val [expr $val*double(1e6)]
        set val [lindex [split $val "."] 0]
        set val1 [expr double($val) / double($gdu)]
    } else {
        set val1 [expr round($val*1e6/$gdu)]
    }  
    # End of fix

    set val2 [expr $val1*$gdu*1e-6]  
    return [iPDK_engToSci $val2]
}  


################################################################################
# 
#
# Arguments:
#
# Return:
#
################################################################################
proc ref90_getCadGridVal { cadGrid } {
    if { [oa::getName [oa::getType $cadGrid]] == "AppProp"} {
        set grid [oa::getValue $cadGrid]
        if { ![catch {set byteArraySize [expr [oa::getSize $grid] - 1]}]} {
            set grid [ref90_getStringFromByteArray $grid $byteArraySize]
        }
    } else {
           set grid [oa::getValue $cadGrid]
    }
    return $grid
}

################################################################################
# 
#
# Arguments:
#
# Return:
#
################################################################################
proc ref90_getStringFromByteArray { byteArray byteArraySize } {
    set byteArrayVal ""
    for {set i 0} {$i < $byteArraySize} {incr i} {
        append byteArrayVal [format %c [oa::get $byteArray $i]]
    }
    return $byteArrayVal
}


proc ref90_symCheckParam {paramValue model inst param} {
    set defVal [iPDK_getParamAttr defValue $inst $param]
    set paramDisplay [iPDK_getParamAttr prompt $inst $param]

    if {[ref90_symIsVariable $paramValue] == 1} {
        if {[ref90_symIsLayout]} {
            puts "\n*************************** $model ************************"
            puts "WARNING 0001> Parameter \"$paramDisplay\" Value \"$paramValue\" is invalid, Resetting to Default value.\n"
	    set paramValue $defVal
	    iPDK_setParamValue $param  $defVal $inst 1
            #ref90_symSetParam $param $defVal $inst
        }
	return

    } elseif { [ref90_symIsVariable $paramValue] == 2 } {
        puts "\n*************************** $model ************************"
        puts "WARNING 0001> Parameter \"$paramDisplay\" Value \"$paramValue\" is invalid, Resetting to Default value.\n"
	set paramValue $defVal
	iPDK_setParamValue $param $defVal $inst 1
        #ref90_symSetParam $param $defVal $inst

    } elseif { ([regexp {(^[0-9]+$)|(^[0-9]+\.[0-9]+$)|(^\.[0-9]+$)} $paramValue ] \
       || [regexp {((^[0-9]+)|(^[0-9]+\.[0-9]+)|(^\.[0-9]+))([a-zA-Z]+$)} $paramValue ] \
       || [regexp {((^[0-9]+)|(^[0-9]+\.[0-9]+)|(^\.[0-9]+))(([a-zA-Z]+)|(\++)|(\!+)| \
        (\#+)|(\$+)|(\%+)|(\[+)|(\]+)|(\_+)|(\/+)|(\*+)|(\-+))} $paramValue ]) && ![regexp { } $paramValue] } {

        if { [regexp {(^[0-9]+)|(^[0-9]+\.[0-9]+)|(^\.[0-9]+)} $paramValue match] } {
            if { [regexp {(^[0-9]+$)|(^[0-9]+\.[0-9]+$)|(^\.[0-9]+$)} $paramValue ] } {

            } else {
                  
                  set sample_value [string trimleft $paramValue $match]

                  if {[regexp {^([y]|[z]|[a]|[f]|[p]|[n]|[u]|[m]|[c]|[k]|[M]|(^[m][e][g])|[X]|[G]|[T]|[P]|[E]|[Z]|[Y])$} $sample_value] \
                  && ![regexp {[0-9]$} $sample_value ]} {
 
                  } elseif {[regexp {(^[eE][0-9]+$)|(^[eE]([\-]|[\+])[0-9]+$)} $sample_value check ] || [regexp {(^[0-9]+$)|(^[0-9]+\.[0-9]+$)} \
                    $sample_value check ]} {
              
                  } elseif { [regexp {((\*+)|(\/+)|(\-+)|(\++)|(\%+))(([a-zA-Z]+)|([0-9]+$))} $sample_value ] \
                    || [regexp {([a-zA-Z]+)((\*+)|(\/+)|(\-+)|(\++)|(\%+))(([a-zA-Z]+$)|([0-9]+$))} $sample_value ] \
                    && ![regexp {(\@+)|(\^+)|(\&+)|(\(+)|(\)+)|(\|+)|(\{+)|(\}+)|(\<+)|(\>+)|(\?+)|(\:+)|(\;+)| \
                    (\"+)|(\'+)|(\=+)|(\`+)|(\~+)|(\,+)} $sample_value ] } {

                  } elseif { [regexp {(\@+)|(\^+)|(\&+)|(\(+)|(\)+)|(\|+)|(\{+)|(\}+)|(\<+)|(\>+)|(\?+)|(\:+) \
                    |(\;+)|(\"+)|(\'+)|(\=+)|(\`+)|(\~+)|(\,+)} $sample_value ]} {   
    
                        puts "\n*************************** $model ************************"
                        puts "WARNING 0001> Parameter \"$paramDisplay\" value \"$paramValue\" is invalid, Resetting to default value \n"
			set paramValue $defVal
			iPDK_setParamValue $param $defVal $inst 1
                        #ref90_symSetParam $param $defVal $inst 

                  } else {

                        puts "\n*************************** $model ************************"
                        puts "WARNING 0001> Parameter \"$paramDisplay\" Value \"$paramValue\" is invalid, Resetting to default value.\n"
			set paramValue $defVal
			iPDK_setParamValue $param $defVal $inst 1
                        #ref90_symSetParam $param $defVal $inst
                  }
              }
        }
        
    } else {

        puts "\n*************************** $model ************************"
        puts "WARNING 0001> Parameter \"$paramDisplay\" value \"$paramValue\" is invalid, Resetting to default value.\n"
	set paramValue $defVal
	iPDK_setParamValue $param $defVal $inst 1
        #ref90_symSetParam $param $defVal $inst
    }
}

proc ref90_symCheckParamValue { pNam pVal minVal maxVal p_grid reset spice_model inst param } {

    set rval   [iPDK_sciToEng [expr $pVal]] 
    set mxval  [iPDK_sciToEng [expr $maxVal]]
    set mnval  [iPDK_sciToEng [expr $minVal]]
    set gval   [iPDK_sciToEng [expr $p_grid]]
    set inp    [iPDK_getParamAttr prompt $inst $param]
    set inpVal [iPDK_getParameterValue  $param $inst]
    set pNam   [iPDK_getParamAttr prompt $inst $pNam]

    if { ([expr $pVal] < [expr $minVal]) && $minVal >= 0} {
        puts "\n************************ $spice_model **************************"
        if {$reset} {
            puts "WARNING 0006> \"$pNam\" $rval < Min value $mnval"
            puts "              Resetting \"$pNam\" to Min value\n"
            set pVal [expr $minVal]
            return $pVal
        } else {
            puts "WARNING 0004> For given \"$inp\" $inpVal, Calculated \"$pNam\" $rval < Min value $mnval"
            puts "              Resetting \"$inp\" to limit \"$pNam\" to Min Value $mnval\n"
            set pVal [expr $minVal]
            return $pVal
        }
        
    } elseif { ([expr $pVal] > [expr $maxVal]) && $maxVal != 0} {
        puts "\n************************ $spice_model **************************"
        if {$reset} { 
            puts "WARNING 0007> \"$pNam\" $rval > Max value $mxval"
            puts "              Resetting \"$pNam\" to Max value\n"
            set pVal [expr $maxVal]
            return $pVal
        } else {
            puts "WARNING 0005> For given \"$inp\" $inpVal, Calculated \"$pNam\" $rval > Max value $mxval"
            puts "              Resetting \"$inp\" to limit \"$pNam\" to Max Value $mxval\n"
            set pVal [expr $maxVal]
            return $pVal
        }
        
    } elseif { [expr $p_grid] != 0 && ([expr $p_grid] != [expr $pVal]) } {
        puts "\n************************ $spice_model **************************"
        puts "WARNING 0003> Resetting parameter \"$pNam\" $rval to $gval to be on grid.\n"
        set pVal [expr $p_grid]
        return $pVal

    } else {
        return [expr $pVal]
    }
}


proc ref90_symResCalcVal {res wid stripeLength dW dL Rsh Rend stripes s_p grid dbu} {

    if {$res == "NA"} {
        set calc "r"
    } elseif {$wid == "NA" } {
       set calc "w"
    } elseif {$stripeLength == "NA"} {
        set calc "l"
    }

    switch $calc {

        "r" {
            set resBody [expr ($stripeLength-$dL)*$Rsh/($wid-$dW)]
            set resTerm [expr $Rend * 1e-6 / ($wid - $dW)]
            set resStripe [expr $resBody + 2*$resTerm]

            if {$s_p == "1"} {
                set reff [expr $resStripe * double($stripes)]
            } else {
                set reff [expr $resStripe / double($stripes)]
            }

            ##Fix added for avoiding Tcl round error:Integer value too large ######
            if { [catch {expr round($reff*double(1000)) / double(1000)}] } {
                set reff [expr $reff*double(1000)]
                set reff [lindex [split $reff "."] 0]
                set reff [expr double($reff) / double(1000)]
            } else {
                set reff [expr round($reff*double(1000)) / double(1000)]
            }
            return $reff
        }

        "w" {
            if {$s_p == 1} {
                set width [expr $stripes * (($stripeLength - $dL) * $Rsh + 2 * $Rend* 1e-6) / $res + $dW]
            } else {
                set width [expr (($stripeLength - $dL) * $Rsh + 2 * $Rend* 1e-6) / ($stripes * $res) + $dW]
            }

            set wid [ref90_symGridCheck $width $grid $dbu]
            return $wid
        }

        "l" {
            if {$s_p == 1} {
                set resStripe [expr $res / double($stripes)]
            } else {
                set resStripe [expr $res *  double($stripes)]
            }
            # Normalizing with terminal resistance value
            set resBody [expr $resStripe-2*$Rend* 1e-6/($wid-$dW)]

            # Calculating the resistor body length per stripe
            set calcStripeLength [expr double($resBody*($wid-$dW)/$Rsh)]
            set stripeLength [expr $calcStripeLength+$dL]
            set stripeLength [ref90_symGridCheck $stripeLength $grid $dbu]
            return $stripeLength
        }
    }
}

proc ref90_symMosParasitics { len wid NF spice_model grid dbu inst tech1 keys1} {
    #global tech keys
    upvar $tech1 tech
    upvar $keys1 keys

    # Take inputs from the PE form
    set tech(polyContBox) [expr $tech(contMinWidth)+2*$tech(polyContEnclose)]
    set diffContactEnclose [iPDK_engToSci [iPDK_getParameterValue  diffContactEnclose $inst]]
    set polyDiffSpacing [iPDK_engToSci [iPDK_getParameterValue  diffPolySpacing $inst]]

    set dgb_box [expr ($tech(contMinWidth)*1e-6+(2* $diffContactEnclose))]
    
    if { $wid < $dgb_box} {
        set minG2cs [expr $polyDiffSpacing+$diffContactEnclose]
	set p2cs $minG2cs
	set p2cd $minG2cs
    } else {
        set minG2cs [expr $keys(polyContSpacing)*1e-6]
	set p2cs $minG2cs
	set p2cd $minG2cs
    }
    

    set intStrap [iPDK_getParameterValue  internalStrapping $inst]
    set drnTerm  [iPDK_getParameterValue  drainTerm $inst]
    set srcTerm  [iPDK_getParameterValue  sourceTerm $inst]
    if {$intStrap} {set intStrap 1} else {set intStrap 0}
    if {$drnTerm == "True"} {set drnTerm 1} else {set drnTerm 0}
    if {$srcTerm == "True"} {set srcTerm 1} else {set srcTerm 0}
    
    # get values of lod parameters
    set sasbsd   [ref90_symMosCalcSASBSD $len $wid $NF $p2cs $p2cd $intStrap $drnTerm $srcTerm $grid $dbu $inst $spice_model tech keys]
    set sa [lindex $sasbsd 0]
    set sb [lindex $sasbsd 1]
    set sd [lindex $sasbsd 2]
    set PolyPitchS [lindex $sasbsd 3]
    set PolyPitchD [lindex $sasbsd 4]
    set sa [iPDK_engToSci $sa]
    set sb [iPDK_engToSci $sb]
    set sd [iPDK_engToSci $sd]    

    # Calculate as/ad/ps/pd/nrs/nrd for non-dogbone mosfet
    if {$wid >= $dgb_box } {
        if {$NF==1} {
            set as [ expr ($sa*$wid)]
            set ad [ expr $sb*$wid]
            set ps [ expr (2*$sa)+$wid]
            set pd [ expr (2*$sb)+$wid]
        } elseif {[expr $NF%2]} {
            set as [expr (($sa*$wid)+(($NF-1)/2*$wid)*($PolyPitchS - $len ))]
            set ad [expr (($sb*$wid)+((($NF-1)/2)*(($PolyPitchD - $len) * $wid)))]
	    set ps [expr ((2*$sa)+($wid)+((($NF-1)/2)*2*($PolyPitchS - $len )))]
            set pd [expr ((2*$sb)+($wid)+((($NF-1)/2)*2*($PolyPitchD - $len)))]
        } elseif {![expr $NF%2]} {
            set as [expr ($sa+$sb)*$wid +(($NF-2)/2)*($PolyPitchS-$len)*$wid ]
            set ad [expr ($NF/2)*($PolyPitchD-$len)*$wid]
            set ps [expr ((2*$sa)+(2*$sb)+(2*$wid)+((($NF-2)/2)*2*($PolyPitchS-$len)))]
            set pd [expr (($NF/2)*2*($PolyPitchD-$len))]
        }
    } 

    # Calculate as/ad/ps/pd/nrs/nrd for dogbone mosfet
    if {$wid < $dgb_box } {
        set extSrcArea  [expr $srcTerm*$dgb_box*($dgb_box-$wid)]
        set extDrnArea  [expr $drnTerm*$dgb_box*($dgb_box-$wid)]
        set extSrcPerim [expr $srcTerm*2*($dgb_box-$wid)]
        set extDrnPerim [expr $drnTerm*2*($dgb_box-$wid)]
        if {$NF==1} {
            set as [expr $sa*$wid+$extSrcArea]
            set ad [expr $sb*$wid+$extDrnArea]
            set ps [expr (2*$sa)+$wid+$extSrcPerim]
            set pd [ expr (2*$sb)+$wid+$extDrnPerim]
        } elseif {[expr $NF%2]} {
            set extBoxArea [expr $intStrap*$dgb_box*($dgb_box-$wid)]
	    set extBoxPerim [expr $intStrap*2*($dgb_box-$wid)]
            set as [expr (($sa*$wid)+(($NF-1)/2*$wid)*($PolyPitchS-$len ))+$extSrcArea+(($NF-1)/2)*$extBoxArea]
            set ad [expr (($sb*$wid)+((($NF-1)/2)*(($PolyPitchD-$len)*$wid)))+$extDrnArea+(($NF-1)/2)*$extBoxArea]
	    set ps [expr ((2*$sa)+($wid)+((($NF-1)/2)*2*($PolyPitchS-$len )))+$extSrcPerim+(($NF-1)/2)*$extBoxPerim]
            set pd [expr ((2*$sb)+($wid)+((($NF-1)/2)*2*($PolyPitchD-$len)))+$extDrnPerim+(($NF-1)/2)*$extBoxPerim]
        } elseif {![expr $NF%2]} {
            set extBoxArea [expr $intStrap*$dgb_box*($dgb_box-$wid)]
	    set extBoxPerim [expr $intStrap*2*($dgb_box-$wid)]
            set as [expr ($sa+$sb)*$wid +(($NF-2)/2)*($PolyPitchS-$len)*$wid+$extSrcArea+$extDrnArea+(($NF-2)/2)*$extBoxArea]
	    set ad [expr ($NF/2)*($PolyPitchD-$len)*$wid+($NF/2)*$extBoxArea]
	    set ps [expr ((2*$sa)+(2*$sb)+(2*$wid)+((($NF-2)/2)*2*($PolyPitchS-$len)))+$extSrcPerim+$extDrnPerim+(($NF-2)/2)*$extBoxPerim]
            set pd [expr (($NF/2)*2*($PolyPitchD-$len))+($NF/2)*$extBoxPerim]
        }	
   } 

   set nrs [expr $as/($wid*$wid)]
   set nrd [expr $ad/($wid*$wid)]

   # return the calculated values of parasitics to the callback
   return [list $p2cs $p2cd $nrs $nrd $as $ad $ps $pd $sa $sb $sd]

}


proc ref90_symMosCalcSASBSD { Length Width nf p2cs p2cd internalStrapping drainTerm sourceTerm grid dbu inst model tech1 keys1} {

    #global tech keys
    upvar $tech1 tech
    upvar $keys1 keys
    
    set tech(diffPolyEnclose) [expr [iPDK_engToSci [iPDK_getParameterValue  diffPolyEndcap $inst]] *1e6]
    set tech(diffContEnclose) [expr [iPDK_engToSci [iPDK_getParameterValue  diffContactEnclose $inst]] *1e6]
    
    set p2cd   [expr $p2cd *1e6] 
    set p2cs   [expr $p2cs *1e6]
    set Length [expr $Length *1e6]
    set Width  [expr $Width *1e6] 
    
    set tech(gateMinSpacing) [expr $keys(gateMinSpacing)]
    set params [ref90_symMosPitch $grid $dbu $Width $Length $p2cs $p2cd $internalStrapping $inst $model tech keys]
    set PolyPitchS [lindex $params 1]
    set PolyPitchD [lindex $params 2]
    set Dogbone    [lindex $params 3]

    # Calculating SA 
    if { $sourceTerm } { 
        set sa [expr $p2cs + $tech(contMinWidth) + $tech(diffContEnclose)]
    } else {
        set sa $tech(diffPolyEnclose)
    }

    # Calculating SB
    if [expr fmod ($nf,2) != 0] {
        if { $drainTerm } { 
            set sb [expr $p2cd + $tech(contMinWidth) + $tech(diffContEnclose)]
        } else {
            set sb $tech(diffPolyEnclose)
        }
    } else {
        if { $drainTerm } { 
            set sb [expr $p2cs + $tech(contMinWidth) + $tech(diffContEnclose)]
        } else {
            set sb $tech(diffPolyEnclose)
        }
    }
    # Calculating SD
    set sd 0

    # Calculating SD when nf = 2 
    if {$nf == 2 } { 
        set sd [expr $PolyPitchD - $Length]
    }

    # Calculating SD when nf = odd 
    if { $nf > 2 } { 
        if { [expr fmod($nf,2)] != 0 } {
            set sd [expr ($PolyPitchD + $PolyPitchS - $Length - $Length )/2]
        } else { 
            set sd_1 [expr ($nf/2) * $PolyPitchD]
            set sd_2 [expr (($nf/2)-1) * $PolyPitchS]
            set sd_3 [expr ($nf-1) * $Length]
            set sd [expr ($sd_1 + $sd_2 - $sd_3)/($nf - 1)]
        }
    }
    set sa [iPDK_sciToEng [expr $sa * 1e-6]]
    set sb [iPDK_sciToEng [expr $sb * 1e-6]]
    set sd [iPDK_sciToEng [expr $sd * 1e-6]]
    set polyS [expr $PolyPitchS*1e-6]
    set polyD [expr $PolyPitchD*1e-6]
    return [list $sa $sb $sd $polyS $polyD]
}

proc ref90_symMosPitch { grid dbu Width Length p2cs p2cd internalStrapping inst model tech1 keys1} {

    #global tech keys
    upvar $tech1 tech
    upvar $keys1 keys
    set tech(polyDiffSpacing) [expr [iPDK_engToSci [iPDK_getParameterValue  diffPolySpacing $inst]] *1e6]
    set tech(diffContEnclose) [expr [iPDK_engToSci [iPDK_getParameterValue  diffContactEnclose $inst]] *1e6]
    set tech(polyContBox)     [expr $tech(contMinWidth)+2*$tech(polyContEnclose)]
    set strapOffset [expr {
	    $Length < $tech(polyContBox) ? 
	    [expr ($tech(contMinWidth)/2.0) + $tech(polyContEnclose) - ($Length/2.0)]
	    : 0
	    }]
    set strapOffset [ref90_symCheckGridUpper $grid $dbu $strapOffset]
    if { $Width < (2 * $tech(diffContEnclose)) + $tech(contMinWidth) } {
	set NumConts 1
	set Dogbone 1
	if { $internalStrapping} {
	    set PolyPitch [expr $Length + (2 * $tech(diffContEnclose)) + \
			    $tech(contMinWidth) + (2 * $tech(polyDiffSpacing))]
	} else {
	    set PolyPitch [expr $Length +$tech(gateMinSpacing)]
	}

    } else {
    	set Dogbone 0
	set NumConts [expr floor(($Width + (-2 * $tech(diffContEnclose)) + \
		            $tech(contMinSpacing)) / ($tech(contMinWidth) + \
			    $tech(contMinSpacing)))]
	if { $internalStrapping} {
	    set PolyPitch [expr $Length + (2 * $keys(polyContSpacing)) + \
			    $tech(contMinWidth)]
 	} else {
	    set PolyPitch [expr $Length +$tech(gateMinSpacing)]
	}
    }
    if { !$internalStrapping} {
        set PolyPitchD $PolyPitch
        set PolyPitchS $PolyPitch
    } else {
        set PolyPitchD [expr { $PolyPitch > $Length + 2.0*$p2cd + $tech(contMinWidth) ?
                               $PolyPitch
                               : $Length + 2.0*$p2cd + $tech(contMinWidth)
                        }]
        set PolyPitchS [expr { $PolyPitch > $Length + 2.0*$p2cs + $tech(contMinWidth) ?
                               $PolyPitch
                               : $Length + 2.0*$p2cs + $tech(contMinWidth)
                        }]


        set PolyPitchS [expr { 
	                $tech(polyMinSpacing) + 2*$strapOffset + $Length > $PolyPitchS ? 
		            $tech(polyMinSpacing) + 2*$strapOffset + $Length 
		            : $PolyPitchS
	                }]
        set PolyPitchD [expr { 
	                $tech(polyMinSpacing) + 2*$strapOffset + $Length > $PolyPitchD ? 
		            $tech(polyMinSpacing) + 2*$strapOffset + $Length 
		            : $PolyPitchD
	                }]
    }
    return [list $PolyPitch $PolyPitchS $PolyPitchD $Dogbone $NumConts]
}

###################################################################################
# Round the value to the nearest higher on Grid Value
#             
# Inputs:
# ---------
# grid    : grid size.
# dbu     : DataBase unit
# value   : value which is to be made as a grid value
# 
# Output:
# ---------
# Returns the value on grid 
#
##################################################################################

proc ref90_symCheckGridUpper { grid dbu value } {
    return [expr double(ceil($value*$dbu/$grid)*$grid/$dbu)]
}



####### From here . 
# Procedure to control the Display Based on cellViewType "schematic"
proc ref90_symIsSchematic { } {
    set inst  [iPDK_getCurrentInst]
    set viewType [oa::getName [oa::getViewType [oa::getDesign $inst]]]
    if { $viewType == "schematic" } {return 1} else {return 0}
}



# Procedure to control the Display Based on cellViewType "layout"
proc ref90_symIsLayout { } {
    set inst  [iPDK_getCurrentInst]
    set viewType [oa::getName [oa::getViewType [oa::getDesign $inst]]]
    if { $viewType == "maskLayout" } {return 1} else {return 0}
}

# Procedure to control the Display Based on instances of type "ivpcell"
proc ref90_symIsIvpcell { } {
    set inst  [iPDK_getCurrentInst]
    set viewName [oa::getViewName $inst]
    if { $viewName == "ivpcell" } {return 0} else {return 1}
}



# Procedure to make parameters Editable.
proc ref90_symMakeEditable {controlParamName MODE} {
    set inst      [iPDK_getCurrentInst]	
    set value     [iPDK_getParameterValue  $controlParamName $inst]
    set paramType [iPDK_getParamAttr type $inst $controlParamName]
    if {$paramType == "boolean"} {
        if {$value} {
            return 1
        } else {
            return 0 
        }
    } else {
        if { [regexp $MODE $value]} {
            return 1
        } else {
            return 0  
        } 
    }
}


# Procedure to control the tapSpacing based on tapOptions.
proc ref90_symMosTapSpaCntrl { top bot lt rt} {
    set inst [iPDK_getCurrentInst]
    if {[ref90_symIsSchematic]} {return 0} 
    if {[ref90_symIsLayout]} {
        set vTop [iPDK_getParameterValue  $top $inst]
        set vBot [iPDK_getParameterValue  $bot $inst]
        set vLt  [iPDK_getParameterValue  $lt $inst]
        set vRt  [iPDK_getParameterValue  $rt $inst]
        if { $vTop == "none" && $vBot == "none" && $vLt == "none" && $vRt == "none" } {return 0} else {return 1}
    }
}


# Procedure to control the tapContacts based on tapOptions.
proc ref90_symMosTapContCntrl { top bot lt rt} {
    set inst [iPDK_getCurrentInst]	
    if { [ref90_symIsSchematic]} {return 0}
    if { [ref90_symIsLayout] } {
        set vTop [iPDK_getParameterValue  $top $inst]
        set vBot [iPDK_getParameterValue  $bot $inst]
        set vLt  [iPDK_getParameterValue  $lt  $inst]
        set vRt  [iPDK_getParameterValue  $rt  $inst]
	if { ($vTop == "all" || $vBot == "all" || $vLt == "all" || $vRt == "all" ) } {return 1} else {return 0}
    }
}


# Procedure to control the buttedTap display based on tap options
proc ref90_symMosLeftButtedCntrl { tapStruct lt} {
    set inst [iPDK_getCurrentInst]	
    if { [ref90_symIsSchematic]} {return 0}
    set leftButtedTapVal [iPDK_getParameterValue leftButtedTap $inst] 
    if { [ref90_symIsLayout] } {
        set tap [iPDK_getParameterValue  $tapStruct $inst]
        if { $tap == "ring" } {
            if {$leftButtedTapVal} {
                iPDK_setParamValue leftButtedTap 0 $inst 0
            }    
	        return 0
	    } else {
            set l [iPDK_getParameterValue  $lt $inst] 
            if {$l != "none"} {
              return 1
            } else {
                if {$leftButtedTapVal} {
                    iPDK_setParamValue leftButtedTap 0 $inst 0
                }    
                return 0
            }
        }
    }
}

proc ref90_symMosRightButtedCntrl { tapStruct rt} {
    set inst [iPDK_getCurrentInst]	
    if { [ref90_symIsSchematic]} {return 0}
    set rightButtedTapVal [iPDK_getParameterValue rightButtedTap $inst] 
    if { [ref90_symIsLayout] } {
        set tap [iPDK_getParameterValue  $tapStruct $inst]
        if { $tap == "ring" } {
                if {$rightButtedTapVal} {
                    iPDK_setParamValue rightButtedTap 0 $inst 0
                }    
	    return 0
	} else {
            set r [iPDK_getParameterValue  $rt $inst] 
            if {$r != "none"} {
              return 1
            } else {
                if {$rightButtedTapVal} {
                    iPDK_setParamValue rightButtedTap 0 $inst 0
                }    
              return 0
            }
        }
    }
}
# Procedure to control the src/drn Strapping options based on internal strapping
proc ref90_symMosOptDFM { opt} {
    set inst [iPDK_getCurrentInst]	
    set option   [iPDK_getParameterValue  $opt $inst]
    if { $option == "Custom" } {return 1} else {return 0}
}

# Procedure to control the src/drn Strapping options based on internal strapping
proc ref90_symMosStrapCntrl { strap fing} {
    set inst [iPDK_getCurrentInst]	
    set intStrap [iPDK_getParameterValue  $strap $inst]
    set NF [iPDK_getParameterValue  $fing $inst]
    if { [ref90_symIsSchematic]} {return 0}
    if { [ref90_symIsLayout] } {
        if {$NF == 1 } { return 0 }
        if {$NF > 1} {
            if {$intStrap} {return 1} else { return 0}
        }    
    }
} 

# Procedure to control the Metal1 Strap Width  when Source or Drain Strapping is allowed
proc ref90_Metal1StrapWidth { internalStrapping finger} {
    set inst [iPDK_getCurrentInst]	
    set internalStrapping [iPDK_getParameterValue  $internalStrapping $inst]
    set fingers [iPDK_getParameterValue  $finger $inst]
    if { [ref90_symIsLayout] && $internalStrapping && ($fingers > 1)} {return 1} else { return 0}
}

proc ref90_Metal1StrapWidthEdit {leftButtedTap rightButtedTap} {
    set inst [iPDK_getCurrentInst]	
    set leftButtedTap [iPDK_getParameterValue  $leftButtedTap $inst]
    set rightButtedTap [iPDK_getParameterValue  $rightButtedTap $inst]
    if { [ref90_symIsLayout] && ($leftButtedTap || $rightButtedTap) } {
        return 0
    } else {
        return 1
    }
}    
    
# Procedure to control the Source/Drain terminal options based on keep out
proc ref90_symMostermCntrl { KEEPOUT} {
    set inst [iPDK_getCurrentInst]	
    set KO [iPDK_getParameterValue  $KEEPOUT $inst]
    if {$KO} {
        iPDK_setParamValue sourceTerm "True" $inst 1
        iPDK_setParamValue drainTerm "True" $inst 1
	return 0
    } else { return 1}	
}


# Procedure to control the buttedTapMetal display based on tap options
proc ref90_symMosButtedMetalCntrl { buttedL buttedR} {
    set inst [iPDK_getCurrentInst]
    if { [ref90_symIsSchematic]} {return 0}
    if { [ref90_symIsLayout] } {
        set bl [iPDK_getParameterValue  $buttedL $inst]
        set br [iPDK_getParameterValue  $buttedR $inst]
        if { $bl == 0 && $br == 0} {return 0} else {return 1}
    }
}


# Procedure to return the max value inputs
proc ref90_symGetMax {inList} {
   set length [llength $inList]
   set maxValue [lindex $inList 0]
  for {set i 0} {$i < [expr $length-1]} {incr i} {
    if {$maxValue < [lindex $inList [expr $i+1]]} {
	set maxValue [lindex $inList [expr $i+1]]
    } 
  }
  return $maxValue
}

# Procedure to control visibility of Ties based on Guard Ring
proc ref90_symGuardRingCtrl {controlParamName} {
    set inst [iPDK_getCurrentInst]	
    set value [iPDK_getParameterValue  $controlParamName $inst]
    if {$value == "none" } {
        iPDK_setParamValue tapTop "none" $inst 1
        iPDK_setParamValue tapBottom "none" $inst 1
        iPDK_setParamValue tapLeft "none" $inst 1
        iPDK_setParamValue tapRight "none" $inst 1
	return 0
    } else {
    	return 1
    }
}


#Procedure to deal with DFM/Recommended Rules
proc ref90_symCalcDFMRules { DFM_rule rule rulNam minVal maxVal recVal grid dbu spice_model inst tech1 keys1} {
    
#    global keys tech
    upvar $tech1 tech
    upvar $keys1 keys
    if { $rule == 0} {
        foreach i $rulNam j $minVal {
            set val [iPDK_sciToEng [expr $j*1e-6]] 
            iPDK_setParamValue $i $val $inst 1
        }
    } elseif { $rule == 1} {
        foreach i $rulNam j $recVal {
            set val [iPDK_sciToEng [expr $j*1e-6]] 
            iPDK_setParamValue $i $val $inst 1
        }
    } elseif { $rule == 2} {
        foreach i $rulNam j $minVal k $maxVal {
            ref90_symCheckParam [ref90_symGetParam $i $inst] $spice_model $inst $i
            set inp      [iPDK_engToSci [ref90_symGetParam $i $inst]]
            set min      [expr $j*1e-6]
            set max      [expr $k*1e-6]
            set inp_grid [ref90_symGridCheck $inp $grid $dbu]
            set vale [ref90_symCheckParamValue $i $inp $min $max $inp_grid 1 $spice_model $inst $i]
            set valu [iPDK_sciToEng $vale]
            iPDK_setParamValue $i $valu $inst 1
        }
     
    }
}



proc ref90_symResGetNumConts { width enclose tech1} {
    #global tech
    upvar $tech1 tech
    
    if { $width <= [expr 2.0*$enclose + $tech(contMinSpacing)] } {
	return 1
    } else {
        return [expr floor(($width - 2.0*$enclose + $tech(contMinSpacing)) \
		    / ($tech(contMinWidth) + $tech(contMinSpacing)))]
    }
}

proc ref90_symResRtMetalExtent { width overhangX metalContEndcap tech1} {
    #global tech
    upvar $tech1 tech
    # Convert back to microns
    set overhangX	[expr $overhangX*1e6]
    set width           [expr $width*1e6]
    set metalContEndcap [expr $metalContEndcap*1e6]

    set numConts	[ref90_symResGetNumConts $width $overhangX tech]
    set xContOffset	[expr $numConts*($tech(contMinWidth)+$tech(contMinSpacing))-$tech(contMinSpacing)]
    set backboneExcess	[expr ($width - $xContOffset)/2.0]
    set backboneExcess  [expr double(floor($backboneExcess*double(1000)/5)*5/double(1000))]
    set xContOffset	[expr $width - $backboneExcess*2.0]
    set rtExtent        [expr $width-$xContOffset-$overhangX]
    
    set diff1           [expr $metalContEndcap-$rtExtent]
    set diff2           [expr $metalContEndcap-$overhangX]
    set correction      [expr $diff1+$diff2+$tech(metal1Spacing)]
    
    # Change back to Metres
    return [expr $correction*1e-6]
}


# StripeSpacing Procedure
proc ref90_symResSpacingCheck { resType width inst tech1 keys1} {
#    global tech keys
    upvar $tech1 tech
    upvar $keys1 keys
    set tech(polyContBox) [expr $tech(contMinWidth)+2*$tech(polyContEnclose)]
    set polyMinSpacing   [ref90_symU2M $tech(polyMinSpacing)]
    set diffMinSpacing   [ref90_symU2M $tech(diffMinSpacing)]
    set nwellSpacing     [ref90_symU2M $tech(nwellSpacing)]
    set diffNwellEnclose [ref90_symU2M $keys(diffNwellEnclose)]
    set sabDiffEnclose   [ref90_symU2M $tech(sabDiffEnclose)]
    set sabMinSpacing    [ref90_symU2M $tech(sabMinSpacing)]
    set polyContBox      [ref90_symU2M $tech(polyContBox)]
    #set metal1Spacing    [ref90_symU2M $tech(metal1Spacing)]
    set polyContEnclose  [ref90_symU2M $tech(polyContEnclose)]
    set resMetSpacing    $tech(resMetSpacing)
    
    # Get DFM Rules
    if { ![regexp {metal} $resType] } {
        set metalContEndcap  [iPDK_engToSci [ref90_symGetParam m1ContactEndcap $inst]]
        set diffContEnclose  [iPDK_engToSci [ref90_symGetParam diffContactEnclose $inst]]
        set diffContBox      [expr ($tech(contMinWidth)*1e-6+(2* $diffContEnclose))]
    }
    
    if { [regexp {poly} $resType] } {
        if { $polyContBox > $width } {
            set resSpacing [expr $polyMinSpacing+$polyContBox-$width]
        } else {
            set resSpacing $polyMinSpacing
        }
        set m1Spacingfix [ref90_symResRtMetalExtent $width $polyContEnclose $metalContEndcap tech]
        set resSpacing   [ref90_symGetMax [list $resSpacing $m1Spacingfix]]
       
    } elseif { [regexp {diff} $resType] } {

        if { $diffContBox > $width } {
            set resSpacing [expr $diffMinSpacing+$diffContBox-$width]
        } else {
            set resSpacing $diffMinSpacing
        }
        set m1Spacingfix [ref90_symResRtMetalExtent $width $diffContEnclose $metalContEndcap tech]
        set resSpacing   [ref90_symGetMax [list $resSpacing $m1Spacingfix]]

    } elseif { [regexp {nwod} $resType] } {
        set resSpacing [expr 2*($diffNwellEnclose+$sabDiffEnclose)+$sabMinSpacing]
    } elseif { [regexp {nwell} $resType] } {
        if {$keys(resNwellTermDiff) > 0} {
	    set resSpacing [expr 2.0*$diffNwellEnclose+$diffMinSpacing]
	} else {
            set resSpacing $nwellSpacing
	}
    } elseif { [regexp {metal} $resType] } {
        set mtype [string trim $resType "metal"]
        set Spacingrule "${mtype}Spacing"
        #set resSpacing [ref90_symU2M $resMetSpacing]
        set resSpacing [ref90_symU2M $resMetSpacing]
    }

    return $resSpacing
}



# Procedure to control visibility of Finger Width based on TopPlate Connection type
proc ref90_symCapFingerWidth {row col top} {
    set inst [iPDK_getCurrentInst]	
    set Row  [iPDK_getParameterValue  $row $inst]
    set Col  [iPDK_getParameterValue  $col $inst]
    set Top  [iPDK_getParameterValue  $top $inst]
    
    if {[ref90_symIsSchematic]} {return 0}
    
    if {($Row == 1 && $Col == 1) && $Top == "array" } {
	return 0
    } else {
    	return 1
    }
}


# MIM Capacitor parameter Calculations
proc ref90_symCapCalcVal {len wid cval Cf Ca dw dl constant grid dbu} {
    set mode [expr {($len == "NA" && $wid == "NA") ? "modeC" : [expr {($cval != "NA" && $wid != "NA") ? "modeCW": [expr {($cval == "NA" && $wid != "NA")? "modeLW" : "modeW"}]}]}]
    switch $mode {
	modeC {
	       set varC [expr $dw*$dl*$Ca+$constant-$cval-2*($dw+$dl)*$Cf]
               set varB [expr 4*$Cf-$Ca*($dl+$dw)]
               set temp [expr (sqrt($varB*$varB-4*$Ca*$varC)-$varB)/(2*$Ca)]
	       return [ref90_symGridCheck $temp $grid $dbu]
	
	}
        modeLW {
              set C_temp [expr ($Ca*($len-$dl)*($wid-$dw) + 2*(($len-$dl) + ($wid-$dw))*$Cf + $constant)]
              return  $C_temp
	
	}
	modeCW {
	        set l_temp1 [expr $cval-2*$Cf*$wid-$constant]
                set l_temp2 [expr ($Ca*$wid)+(2*$Cf)]
                return [ref90_symGridCheck [expr ($l_temp1/$l_temp2)+$dl] $grid $dbu]
	
	} 
	modeW {
	      set w_temp1 [expr $cval-2*$Cf*$len-$constant]
              set w_temp2 [expr ($Ca*$len)+(2*$Cf)]
              return [ref90_symGridCheck [expr ($w_temp1/$w_temp2)+$dl] $grid $dbu]
	
	}

    }

}

# Procedure to control the internal Strapping options based on # fingers
proc ref90_symMosIntStrap { fing} {
    set inst [iPDK_getCurrentInst]	
    set NF [iPDK_getParameterValue  $fing $inst]
    if { [ref90_symIsSchematic]} {return 0}
    if { [ref90_symIsLayout] } {
        if {$NF == 1} { return 0 } else { return 1}
    }
}


