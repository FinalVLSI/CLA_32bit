###############################################################################
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
# Returns the object ID of the instance whose parameters are changed. 
# This is required to set all the params calculated from the callback.
# This function has to return valid object ID will ensure that the Tcl callback 
# works correctly in the instance creation, query or modification phase. 
# The returned object ID should not be passed to any standard OpenAccess  API. 
# It should be used by iPDK Tcl API only. 
# The object ID is not necessary an oa::Inst object. 
# Each tool vendor can choose their own implementation to meet the above criteria. 
# 
# Arguments: 
# none
#
# Return:
# instId - instance ID 
#
################################################################################
proc iPDK_getCurrentInst { } {
	return [db::getCurrentRef]
}

################################################################################
#
# Arguments:
#
# Return:
#
################################################################################
proc iPDK_engToSci { value } {
   return [db::engToSci $value]
}

################################################################################
#
# Arguments:
#
# Return:
#
################################################################################
proc iPDK_sciToEng { value } {
   return [db::sciToEng $value -precision 10]
}

################################################################################
#
# Arguments:
#
# Return:
#
################################################################################
proc iPDK_getParameterValue { param inst } {
   return [db::getParamValue $param -of $inst]
}
################################################################################
#
# Arguments:
#
# Return:
#
################################################################################
proc iPDK_setParamValue { param value inst eval} {
   return [db::setParamValue $param -value $value -of $inst -evalCallbacks $eval]
}

proc iPDK_setParameterValue { param value inst} {
   return [db::setParamValue $param -value $value -of $inst -evalCallbacks 0]
}

################################################################################
# Returns the value of a parameter attribute from CDF.
#
# Arguments:
# attr - attribute of the instance parameter
# inst - current instance ID
# param - parameter name
#
# Return:
# Value of the parameter attribute
#
################################################################################
proc iPDK_getParamAttr { attr inst param } {
    set attrVal [db::getAttr $attr -of [db::getParamDefs $param -of $inst]]
    return $attrVal
}


# Procedure to get Orientation of instances
proc iPDK_getOrient { inst } {
    set attrVal [db::getAttr orient -of $inst]
    return $attrVal
}

