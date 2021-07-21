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
#       20 Mar 09 : Adding First version
#       18 Feb 10 : Updated hilite01 and unplacedHighlight display packets.
#
##########################################################################


#DisplayResourceTcl
set display_object [db::getNext [dr::getDisplays -filter "%name == {display}"]]
if {$display_object == ""} {
        set display_object [dr::createDisplay display -maxColors 256 -maxStipples 256 -maxLineStyles 256 ]
}
# Colors definition
dr::createColor white -display $display_object -red 255 -green 255 -blue 255
dr::createColor yellow -display $display_object -red 255 -green 255 -blue 0
dr::createColor silver -display $display_object -red 217 -green 230 -blue 255
dr::createColor cream -display $display_object -red 255 -green 255 -blue 204
dr::createColor pink -display $display_object -red 255 -green 191 -blue 242
dr::createColor magenta -display $display_object -red 255 -green 0 -blue 255
dr::createColor lime -display $display_object -red 0 -green 255 -blue 0
dr::createColor tan -display $display_object -red 255 -green 230 -blue 191
dr::createColor cyan -display $display_object -red 0 -green 255 -blue 255
dr::createColor cadetBlue -display $display_object -red 57 -green 191 -blue 255
dr::createColor orange -display $display_object -red 255 -green 128 -blue 0
dr::createColor red -display $display_object -red 255 -green 0 -blue 0
dr::createColor purple -display $display_object -red 153 -green 0 -blue 230
dr::createColor green -display $display_object -red 0 -green 204 -blue 102
dr::createColor brown -display $display_object -red 191 -green 64 -blue 38
dr::createColor blue -display $display_object -red 0 -green 0 -blue 255
dr::createColor slate -display $display_object -red 140 -green 140 -blue 166
dr::createColor gold -display $display_object -red 217 -green 204 -blue 0
dr::createColor maroon -display $display_object -red 230 -green 31 -blue 13
dr::createColor violet -display $display_object -red 94 -green 0 -blue 230
dr::createColor forest -display $display_object -red 38 -green 140 -blue 107
dr::createColor chocolate -display $display_object -red 128 -green 38 -blue 38
dr::createColor navy -display $display_object -red 51 -green 51 -blue 153
dr::createColor black -display $display_object -red 0 -green 0 -blue 0
dr::createColor gray -display $display_object -red 204 -green 204 -blue 217
dr::createColor lightWhite -display $display_object -red 127 -green 127 -blue 127
dr::createColor lightYellow -display $display_object -red 127 -green 127 -blue 0
dr::createColor lightRed -display $display_object -red 127 -green 0 -blue 0
dr::createColor lightPurple -display $display_object -red 76 -green 0 -blue 115
dr::createColor lightGreen -display $display_object -red 0 -green 102 -blue 51
dr::createColor lightGray -display $display_object -red 102 -green 102 -blue 108
dr::createColor lightGold -display $display_object -red 108 -green 102 -blue 0
dr::createColor lightMaroon -display $display_object -red 115 -green 15 -blue 6
dr::createColor lightCyan -display $display_object -red 0 -green 127 -blue 127
dr::createColor lightBlue -display $display_object -red 0 -green 0 -blue 127
dr::createColor winColor1 -display $display_object -red 166 -green 166 -blue 166
dr::createColor winColor2 -display $display_object -red 115 -green 115 -blue 115
dr::createColor winColor3 -display $display_object -red 189 -green 204 -blue 204
dr::createColor winColor4 -display $display_object -red 204 -green 204 -blue 204
dr::createColor winColor5 -display $display_object -red 199 -green 199 -blue 199
dr::createColor blinkRed -display $display_object -red 255 -green 0 -blue 0 -blink true
dr::createColor blinkYellow -display $display_object -red 255 -green 255 -blue 0 -blink true
dr::createColor blinkWhite -display $display_object -red 255 -green 255 -blue 255 -blink true
dr::createColor TrueColorBright -display $display_object -red 166 -green 176 -blue 186
dr::createColor TrueColorGhost -display $display_object -red 160 -green 200 -blue 240
dr::createColor violet -display $display_object -red 94 -green 0 -blue 230
dr::createColor winBack -display $display_object -red 224 -green 224 -blue 224
dr::createColor winFore -display $display_object -red 128 -green 0 -blue 0
dr::createColor winText -display $display_object -red 51 -green 51 -blue 51
dr::createColor paula -display $display_object -red 32 -green 232 -blue 239
dr::createColor whiteB -display $display_object -red 255 -green 255 -blue 255 -blink true
dr::createColor grayB -display $display_object -red 204 -green 204 -blue 217 -blink true
dr::createColor yellowB -display $display_object -red 255 -green 255 -blue 0 -blink true
dr::createColor whiteBlink -display $display_object -red 255 -green 255 -blue 255 -blink true
dr::createColor gray8 -display $display_object -red 225 -green 225 -blue 225
dr::createColor clay -display $display_object -red 128 -green 0 -blue 0
dr::createColor charcoal -display $display_object -red 41 -green 41 -blue 41
dr::createColor gray4 -display $display_object -red 166 -green 166 -blue 166
dr::createColor gray3 -display $display_object -red 115 -green 115 -blue 115
dr::createColor gray5 -display $display_object -red 189 -green 204 -blue 204
dr::createColor gray7 -display $display_object -red 204 -green 204 -blue 204
dr::createColor gray6 -display $display_object -red 199 -green 199 -blue 199
dr::createColor grayBlink -display $display_object -red 199 -green 199 -blue 199 -blink true
dr::createColor limeB -display $display_object -red 0 -green 255 -blue 0 -blink true
dr::createColor cyanB -display $display_object -red 0 -green 255 -blue 255 -blink true
dr::createColor joy1 -display $display_object -red 0 -green 204 -blue 242
# Stipples definition
dr::createStipple blank -display $display_object -pattern {
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple solid -display $display_object -pattern {
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1} }
dr::createStipple dots -display $display_object -pattern {
                                {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple dots1 -display $display_object -pattern {
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0} }
dr::createStipple hLine -display $display_object -pattern {
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1} }
dr::createStipple vLine -display $display_object -pattern {
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0} }
dr::createStipple cross -display $display_object -pattern [ list \
                                                               { 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0  }\
                                                               { 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1  }\
                                                               { 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  }\
                                                               { 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1  }\
                                                               { 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0  }\
                                                               { 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1  }\
                                                               { 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  }\
                                                               { 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1  }\
                                                               { 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0  }\
                                                               { 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1  }\
                                                               { 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  }\
                                                               { 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1  }\
                                                               { 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0  }\
                                                               { 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1  }\
                                                               { 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  }\
                                                               { 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1  } ]				 
dr::createStipple cross2 -display $display_object -pattern {
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple grid -display $display_object -pattern {
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1} }
dr::createStipple slash -display $display_object -pattern {
                                 {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                 {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                 {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                 {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                 {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                 {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                 {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                 {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                 {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                 {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0} }

dr::createStipple backSlash -display $display_object -pattern [ list \
                                                                   { 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0  }\
                                                                   { 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0  }\
                                                                   { 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  }\
                                                                   { 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1  }\
                                                                   { 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0  }\
                                                                   { 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0  }\
                                                                   { 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  }\
                                                                   { 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1  }\
                                                                   { 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0  }\
                                                                   { 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0  }\
                                                                   { 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  }\
                                                                   { 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1  }\
                                                                   { 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0  }\
                                                                   { 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0  }\
                                                                   { 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0  }\
                                                                   { 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1  } ]
				     
dr::createStipple hZigZag -display $display_object -pattern {
                                   {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                   {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                   {0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0}
                                   {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                   {0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1}
                                   {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                   {0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0}
                                   {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                   {0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0}
                                   {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                   {1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1}
                                   {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                   {0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0}
                                   {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                   {0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0}
                                   {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1} }
dr::createStipple vZigZag -display $display_object -pattern {
                                   {1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0}
                                   {1 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0}
                                   {0 1 0 0 0 0 1 0 0 0 0 0 1 0 0 0}
                                   {0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0}
                                   {0 0 1 0 0 0 0 0 1 0 0 0 0 1 0 0}
                                   {0 0 0 1 0 0 0 0 1 0 0 0 0 0 1 0}
                                   {0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0}
                                   {0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 1}
                                   {1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0}
                                   {1 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0}
                                   {0 1 0 0 0 0 1 0 0 0 0 0 1 0 0 0}
                                   {0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0}
                                   {0 0 1 0 0 0 0 0 1 0 0 0 0 1 0 0}
                                   {0 0 0 1 0 0 0 0 1 0 0 0 0 0 1 0}
                                   {0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0}
                                   {0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 1} }
dr::createStipple hCurb -display $display_object -pattern {
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 1 1 1 1 1 0 0 0 1 1 1 1 1}
                                 {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                 {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                 {1 1 1 1 0 0 0 1 1 1 1 1 0 0 0 1}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 1 1 1 1 1 0 0 0 1 1 1 1 1}
                                 {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                 {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                 {1 1 1 1 0 0 0 1 1 1 1 1 0 0 0 1}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple vCurb -display $display_object -pattern {
                                 {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                 {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                 {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                 {0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0}
                                 {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                 {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                 {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                 {0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 1 1 1 0 0 0 0 1 1 1 1 0 0} }
dr::createStipple brick -display $display_object -pattern {
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                 {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                 {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1}
                                 {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                 {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                 {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0} }
dr::createStipple dagger -display $display_object -pattern {
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                  {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                  {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                  {1 1 1 1 1 0 0 0 1 1 1 1 1 0 0 0}
                                  {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                  {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                  {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                  {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                  {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                  {0 0 0 1 1 1 1 1 0 0 0 1 1 1 1 1}
                                  {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                  {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                  {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0} }
dr::createStipple triangle -display $display_object -pattern {
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple X -display $display_object -pattern {
                             {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1} }
dr::createStipple x -display $display_object -pattern {
                             {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                             {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                             {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1} }
dr::createStipple medslash -display $display_object -pattern {
                                    {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                    {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                    {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                    {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1}
                                    {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                    {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                    {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                    {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                    {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                    {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                    {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1}
                                    {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                    {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                    {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0} }
dr::createStipple dotsa -display $display_object -pattern {
                                 {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple medbackSlash -display $display_object -pattern {
                                        {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                        {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                        {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                        {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1}
                                        {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                        {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                        {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                        {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                        {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                        {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                        {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                        {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1}
                                        {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                        {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                        {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                        {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0} }
dr::createStipple dots2 -display $display_object -pattern {
                                 {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple stipple1 -display $display_object -pattern {
                                      {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 1 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 1 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 1 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 1} }
dr::createStipple stipple2 -display $display_object -pattern {
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 1}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 1 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 1 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 1 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 1 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 1 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 1 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 1 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 1 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple stipple3 -display $display_object -pattern {
                                      {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 1 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 1 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 1 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 1 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 1 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 1 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 1 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 1 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 1} }
dr::createStipple stipple4 -display $display_object -pattern {
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0} }
dr::createStipple stipple5 -display $display_object -pattern {
                                    {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                    {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                    {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                    {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                    {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                    {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                    {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                    {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1}
                                    {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                    {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                    {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                    {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                    {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                    {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                    {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                    {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1} }
dr::createStipple stipple6 -display $display_object -pattern {
                                    {0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
                                    {0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple stipple7 -display $display_object -pattern {
                                    {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                    {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                    {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                    {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                    {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                    {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                    {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                    {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                    {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                    {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                    {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                    {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                    {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                    {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                    {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                    {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0} }
dr::createStipple stipple8 -display $display_object -pattern {
                                    {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                    {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                    {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                    {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                    {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                    {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                    {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                    {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                    {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                    {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                    {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                    {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                    {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                    {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                    {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                    {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1} }
dr::createStipple stipple9 -display $display_object -pattern {
                                    {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                    {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }

dr::createStipple sldiff -display $display_object -pattern {
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0}
                                 {0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                 {0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0}
                                 {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                 {0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple zigZag1 -display $display_object -pattern {
                                   {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                   {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                   {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                   {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                   {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                   {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                   {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                   {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                   {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                   {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                   {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                   {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                   {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                   {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                   {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                   {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0} }
dr::createStipple bt_solid -display $display_object -pattern {
                                                    {1 1 1 1 1 1 1 1}
                                                    {1 1 1 1 1 1 1 1}
                                                    {1 1 1 1 1 1 1 1}
                                                    {1 1 1 1 1 1 1 1}
                                                    {1 1 1 1 1 1 1 1}
                                                    {1 1 1 1 1 1 1 1}
                                                    {1 1 1 1 1 1 1 1}
                                                    {1 1 1 1 1 1 1 1} }
dr::createStipple empty -display $display_object -pattern {
                                                 {0 0 0 0 0 0 0 0}
                                                 {0 0 0 0 0 0 0 0}
                                                 {0 0 0 0 0 0 0 0}
                                                 {0 0 0 0 0 0 0 0}
                                                 {0 0 0 0 0 0 0 0}
                                                 {0 0 0 0 0 0 0 0}
                                                 {0 0 0 0 0 0 0 0}
                                                 {0 0 0 0 0 0 0 0} }
dr::createStipple met1 -display $display_object -pattern {
                                                {1 0 0 0 0 0 0 1}
                                                {0 0 0 0 0 0 0 0}
                                                {0 0 0 0 0 0 0 0}
                                                {0 0 0 1 0 0 0 0}
                                                {0 0 0 0 1 0 0 0}
                                                {0 0 0 0 0 0 0 0}
                                                {0 0 0 0 0 0 0 0}
                                                {1 0 0 0 0 0 0 1} }
dr::createStipple os -display $display_object -pattern {
                              {1 0 0 0 1 0 0 0 1 0 1 0 1 0 0 0}
                              {0 1 0 1 0 1 0 0 0 1 0 0 0 1 0 1}
                              {0 0 1 0 0 0 1 0 1 0 1 0 0 0 1 0}
                              {0 1 0 1 0 0 0 1 0 0 0 1 0 1 0 1}
                              {1 0 0 0 1 0 1 0 1 0 0 0 1 0 0 0}
                              {0 1 0 0 0 1 0 0 0 1 0 1 0 1 0 0}
                              {0 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0}
                              {0 0 0 1 0 0 0 1 0 1 0 1 0 0 0 1}
                              {1 0 1 0 1 0 0 0 1 0 0 0 1 0 1 0}
                              {0 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0}
                              {1 0 1 0 0 0 1 0 0 0 1 0 1 0 1 0}
                              {0 0 0 1 0 1 0 1 0 0 0 1 0 0 0 1}
                              {1 0 0 0 1 0 0 0 1 0 1 0 1 0 0 0}
                              {0 1 0 1 0 1 0 0 0 1 0 0 0 1 0 1}
                              {0 0 1 0 0 0 1 0 1 0 1 0 0 0 1 0}
                              {0 1 0 1 0 0 0 1 0 0 0 1 0 1 0 1} }
dr::createStipple dots3 -display $display_object -pattern {
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple P2 -display $display_object -pattern {
                              {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                              {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                              {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                              {0 0 1 1 1 0 0 0 0 0 1 1 0 0 0 0}
                              {0 0 1 0 0 1 0 0 0 1 0 0 1 0 0 0}
                              {0 0 1 0 0 1 0 0 0 0 0 0 1 0 0 0}
                              {0 0 1 1 1 0 0 0 0 0 0 1 0 0 0 0}
                              {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                              {0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0}
                              {0 0 1 0 0 0 0 0 0 1 1 1 1 0 0 0}
                              {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                              {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                              {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                              {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                              {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                              {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple slash1 -display $display_object -pattern {
                                  {0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple thickBackSlash -display $display_object -pattern {
                                          {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                          {1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                          {0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                          {0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0}
                                          {0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0}
                                          {0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0}
                                          {0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0}
                                          {0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0}
                                          {0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0}
                                          {0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                          {0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0}
                                          {0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0}
                                          {0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0}
                                          {0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0}
                                          {0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0}
                                          {0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1} }
dr::createStipple backslash1 -display $display_object -pattern {
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0} }
dr::createStipple backslash2 -display $display_object -pattern {
                                      {0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple dots_rare -display $display_object -pattern {
                                     {0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple thickdots -display $display_object -pattern {
                                     {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                     {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0}
                                     {0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                     {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0}
                                     {0 0 0 0 1 1 0 0 0 0 0 0 0 1 1 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple cross1 -display $display_object -pattern {
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple fineCross -display $display_object -pattern {
                                     {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                     {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                     {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                     {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                     {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                     {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                     {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                     {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                     {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                     {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                     {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                     {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                     {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                     {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                     {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                     {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1} }
dr::createStipple checker -display $display_object -pattern {
                                   {1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0}
                                   {1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0}
                                   {1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0}
                                   {1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0}
                                   {1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0}
                                   {1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0}
                                   {1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0}
                                   {1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1}
                                   {0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1}
                                   {0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1}
                                   {0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1}
                                   {0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1}
                                   {0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1}
                                   {0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1}
                                   {0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1} }
dr::createStipple zigZag -display $display_object -pattern {
                                  {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                  {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                  {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                  {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                  {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                  {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                  {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                  {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                  {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                  {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                  {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                  {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                  {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                  {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                  {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                  {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0} }
dr::createStipple zigZag2 -display $display_object -pattern {
                                   {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                   {0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0}
                                   {0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0}
                                   {0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0}
                                   {0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0}
                                   {0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0}
                                   {0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0}
                                   {0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0}
                                   {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                   {0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0}
                                   {0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0}
                                   {0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0}
                                   {0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0}
                                   {0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0}
                                   {0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0}
                                   {0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0} }
dr::createStipple vs -display $display_object -pattern {
                              {1 0 0 0 0 1 1 0 0 0 0 0 1 1 0 0}
                              {0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0}
                              {0 0 1 1 0 0 0 0 1 1 1 0 0 0 0 1}
                              {0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0}
                              {1 0 0 0 0 1 1 0 0 0 0 0 1 1 0 0}
                              {0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0}
                              {0 0 1 1 0 0 0 0 1 1 1 0 0 0 0 1}
                              {0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0}
                              {1 0 0 0 0 1 1 0 0 0 0 0 1 1 0 0}
                              {0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0}
                              {0 0 1 1 0 0 0 0 1 1 1 0 0 0 0 1}
                              {0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0}
                              {1 0 0 0 0 1 1 0 0 0 0 0 1 1 0 0}
                              {0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0}
                              {0 0 1 1 0 0 0 0 1 1 1 0 0 0 0 1}
                              {0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0} }
dr::createStipple slash2 -display $display_object -pattern {
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple dashCross -display $display_object -pattern {
                                     {0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0}
                                     {0 1 0 1 0 0 0 1 0 1 0 0 0 0 0 1}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 0}
                                     {0 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                     {0 0 0 1 0 1 0 0 0 0 0 1 0 1 0 0}
                                     {0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0}
                                     {0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1}
                                     {1 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                     {0 1 0 0 0 0 0 1 0 1 0 0 0 0 0 1}
                                     {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                     {0 0 0 1 0 1 0 0 0 0 0 1 0 1 0 0}
                                     {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                     {0 0 0 1 0 1 0 0 0 0 0 1 0 1 0 1}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 1 0 0 0 0 0 1 0 1 0 0 0 1 0 1} }
dr::createStipple slash3 -display $display_object -pattern {
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple dot1 -display $display_object -pattern {
                                {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple dot2 -display $display_object -pattern {
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 1 1 1 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple dot3 -display $display_object -pattern {
                                {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple viap -display $display_object -pattern {
                                {0 0 1 0 0 0 1 0 0 0 1 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1} }
dr::createStipple metal1S -display $display_object -pattern {
                                   {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1} }
dr::createStipple metal2S -display $display_object -pattern {
                                   {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0}
                                   {0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                   {0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
                                   {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1} }
dr::createStipple gnd2S -display $display_object -pattern {
                                 {1 0 0 0 0 0 1 1 1 0 0 0 0 0 1 1}
                                 {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                 {1 1 1 0 0 0 0 0 1 1 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 1 1 0 0 0 0 0 1 1 1 0 0 0}
                                 {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                 {0 0 0 0 1 1 1 0 0 0 0 0 1 1 1 0}
                                 {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                 {1 0 0 0 0 0 1 1 1 0 0 0 0 0 1 1}
                                 {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                 {1 1 1 0 0 0 0 0 1 1 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 1 1 1 0 0 0 0 0 1 1 1 0 0 0}
                                 {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                 {0 0 0 0 1 1 1 0 0 0 0 0 1 1 1 0}
                                 {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0} }
dr::createStipple vcc2S -display $display_object -pattern {
                                 {0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0}
                                 {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                 {0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0}
                                 {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                 {1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1}
                                 {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                 {0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                 {0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0}
                                 {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                 {0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0}
                                 {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                 {1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1}
                                 {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                 {0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0}
                                 {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0} }
dr::createStipple vcc1S -display $display_object -pattern {
                                 {1 0 0 1 1 0 0 0 1 0 0 1 1 0 0 0}
                                 {0 1 0 0 1 0 0 0 0 1 0 0 1 0 0 0}
                                 {0 0 1 0 0 1 1 0 0 0 1 0 0 1 1 0}
                                 {0 0 0 1 0 0 1 0 0 0 0 1 0 0 1 0}
                                 {1 0 0 0 1 0 0 1 1 0 0 0 1 0 0 1}
                                 {1 0 0 0 0 1 0 0 1 0 0 0 0 1 0 0}
                                 {0 1 1 0 0 0 1 0 0 1 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 0 1 0 0 1 0 0 0 0 1}
                                 {1 0 0 1 1 0 0 0 1 0 0 1 1 0 0 0}
                                 {0 1 0 0 1 0 0 0 0 1 0 0 1 0 0 0}
                                 {0 0 1 0 0 1 1 0 0 0 1 0 0 1 1 0}
                                 {0 0 0 1 0 0 1 0 0 0 0 1 0 0 1 0}
                                 {1 0 0 0 1 0 0 1 1 0 0 0 1 0 0 1}
                                 {1 0 0 0 0 1 0 0 1 0 0 0 0 1 0 0}
                                 {0 1 1 0 0 0 1 0 0 1 1 0 0 0 1 0}
                                 {0 0 1 0 0 0 0 1 0 0 1 0 0 0 0 1} }
dr::createStipple poly2p -display $display_object -pattern {
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 1 1 1 0 0 0 0 0 1 1 0 0 0 0}
                                  {0 0 1 0 0 1 0 0 0 1 0 0 1 0 0 0}
                                  {0 0 1 0 0 1 0 0 0 0 0 0 1 0 0 0}
                                  {0 0 1 1 1 0 0 0 0 0 0 1 0 0 0 0}
                                  {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                  {0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                  {0 0 1 0 0 0 0 0 0 1 1 1 1 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                  {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple contp -display $display_object -pattern {
                                 {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                 {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0}
                                 {0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                 {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0}
                                 {0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                 {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple pplusp -display $display_object -pattern {
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple wellp -display $display_object -pattern {
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
    {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple stipple10 -display $display_object -pattern {
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple stipple11 -display $display_object -pattern {
                                     {0 0 0 0 1 1 0 0 0 1 0 0 0 0 0 0}
                                     {0 0 0 0 1 0 1 0 0 1 0 0 0 0 0 0}
                                     {0 0 0 0 1 0 0 1 0 1 0 0 0 0 0 0}
                                     {0 0 0 0 1 0 0 0 1 1 0 0 0 0 0 0}
                                     {0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple stipple12 -display $display_object -pattern {
                                     {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                     {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                     {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                     {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                     {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                     {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                     {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                     {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                     {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                     {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                     {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                     {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0}
                                     {0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1}
                                     {0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0}
                                     {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                     {1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0} }
dr::createStipple stipple13 -display $display_object -pattern {
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1} }
dr::createStipple stipple14 -display $display_object -pattern {
                                     {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1}
                                     {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                     {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                     {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                     {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                     {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                     {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                     {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1}
                                     {0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0}
                                     {0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0}
                                     {0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0}
                                     {0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0}
                                     {0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0}
                                     {0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                     {1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0} }
dr::createStipple stipple15 -display $display_object -pattern {
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0}
                                     {1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0} }
dr::createStipple stipple16 -display $display_object -pattern {
                                     {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                     {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0}
                                     {0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                     {1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0}
                                     {0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                     {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple dot4 -display $display_object -pattern {
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
dr::createStipple stipple0 -display $display_object -pattern {
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 1}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 1 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 1 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 1 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 1 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 1 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 1 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
                                      {1 0 0 0 0 0 0 0 0 0 0 0 0 0 0} }
# LineStyles definition
dr::createLineStyle solid -display $display_object -width 1 -pattern [ list 1 1 1 ]
dr::createLineStyle dashed -display $display_object -width 1 -pattern [ list 1 1 1 1 0 0 ]
dr::createLineStyle dots -display $display_object -width 1 -pattern [ list 1 0 0 ]
dr::createLineStyle dashDot -display $display_object -width 1 -pattern [ list 1 1 1 0 0 1 0 0 ]
dr::createLineStyle shortDash -display $display_object -width 1 -pattern [ list 1 1 0 0 ]
dr::createLineStyle doubleDash -display $display_object -width 1 -pattern [ list 1 1 1 1 0 0 1 1 0 0 ]
dr::createLineStyle hidden -display $display_object -width 1 -pattern [ list 1 0 0 0 ]
dr::createLineStyle mediumLine -display $display_object -width 2 -pattern [list 1 1 1 ]
dr::createLineStyle thickLine -display $display_object -width 3 -pattern [ list 1 1 1 ]
dr::createLineStyle thickDash -display $display_object -width 3 -pattern [ list 1 1 1 1 0 0 ]
dr::createLineStyle lineStyle0 -display $display_object -width 1 -pattern [ list 1 ]
dr::createLineStyle lineStyle1 -display $display_object -width 1 -pattern [ list 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 ]
dr::createLineStyle lineStyle2 -display $display_object -width 1 -pattern [ list 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ]
dr::createLineStyle lineStyle3 -display $display_object -width 1 -pattern [ list 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 ]
dr::createLineStyle lineStyle4 -display $display_object -width 1 -pattern [ list 1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1 ]
dr::createLineStyle lineStyle5 -display $display_object -width 1 -pattern [ list 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 ]
dr::createLineStyle mLine -display $display_object -width 2 -pattern [ list 1 1 1 ]
dr::createLineStyle thickLine2 -display $display_object -width 2 -pattern [ list 1 1 1 ]
# Packets definition
dr::createPacket defaultPacket -display $display_object -stipple blank \
                               -lineStyle solid -fill white -outline yellow
dr::createPacket background -display $display_object -stipple blank \
                          -lineStyle solid -fill black -outline black
dr::createPacket grid -display $display_object -stipple blank \
                    -lineStyle solid -fill slate -outline slate
dr::createPacket grid1 -display $display_object -stipple blank \
                     -lineStyle solid -fill white -outline white
dr::createPacket axis -display $display_object -stipple blank \
                          -lineStyle solid -fill white -outline white
dr::createPacket instance -display $display_object -stipple blank \
                            -lineStyle solid -fill red -outline red
dr::createPacket instanceLbl -display $display_object -stipple blank \
                     -lineStyle solid -fill gold -outline gold
dr::createPacket prBoundary -display $display_object -stipple blank \
                        -lineStyle solid -fill purple -outline purple
dr::createPacket prBoundaryBnd -display $display_object -stipple blank \
                               -lineStyle solid -fill cyan -outline cyan
dr::createPacket prBoundaryLbl -display $display_object -stipple blank \
                           -lineStyle solid -fill purple -outline purple
dr::createPacket align -display $display_object -stipple blank \
                         -lineStyle solid -fill tan -outline tan
dr::createPacket hardFence -display $display_object -stipple blank \
                             -lineStyle solid -fill red -outline red
dr::createPacket softFence -display $display_object -stipple blank \
                       -lineStyle solid -fill yellow -outline yellow
dr::createPacket text -display $display_object -stipple blank \
                    -lineStyle solid -fill white -outline white
dr::createPacket text1 -display $display_object -stipple blank \
                    -lineStyle dashed -fill white -outline white
dr::createPacket text2 -display $display_object -stipple solid \
                     -lineStyle solid -fill white -outline white
dr::createPacket border -display $display_object -stipple blank \
                          -lineStyle solid -fill tan -outline tan
dr::createPacket device -display $display_object -stipple blank \
                      -lineStyle solid -fill green -outline green
dr::createPacket device2 -display $display_object -stipple blank \
                      -lineStyle dashed -fill green -outline green
dr::createPacket device1 -display $display_object -stipple solid \
                       -lineStyle solid -fill green -outline green
dr::createPacket wire -display $display_object -stipple solid \
            -lineStyle solid -fill cadetBlue -outline cadetBlue
dr::createPacket wireLbl -display $display_object -stipple solid \
               -lineStyle solid -fill cadetBlue -outline cadetBlue
dr::createPacket wireFlt -display $display_object -stipple blank \
                          -lineStyle dashed -fill red -outline red
dr::createPacket highlightUnplaced -display $display_object -stipple X \
		       -lineStyle solid -fill magenta -outline magenta
dr::createPacket deviceAnt -display $display_object -stipple blank \
                       -lineStyle solid -fill yellow -outline yellow
dr::createPacket deviceLbl -display $display_object -stipple blank \
                         -lineStyle solid -fill green -outline green
dr::createPacket pinLbl -display $display_object -stipple blank \
                          -lineStyle solid -fill red -outline red
dr::createPacket pin -display $display_object -stipple solid \
                       -lineStyle solid -fill red -outline red
dr::createPacket pinAnt -display $display_object -stipple blank \
                          -lineStyle solid -fill red -outline red
dr::createPacket annotate -display $display_object -stipple blank \
                      -lineStyle solid -fill orange -outline orange
dr::createPacket annotate1 -display $display_object -stipple blank \
                           -lineStyle solid -fill pink -outline pink
dr::createPacket annotate2 -display $display_object -stipple blank \
                           -lineStyle solid -fill lime -outline lime
dr::createPacket annotate3 -display $display_object -stipple blank \
                           -lineStyle solid -fill cyan -outline cyan
dr::createPacket annotate4 -display $display_object -stipple blank \
                       -lineStyle solid -fill yellow -outline yellow
dr::createPacket annotate5 -display $display_object -stipple blank \
                         -lineStyle solid -fill white -outline white
dr::createPacket annotate6 -display $display_object -stipple blank \
                       -lineStyle solid -fill silver -outline silver
dr::createPacket annotate7 -display $display_object -stipple blank \
                             -lineStyle solid -fill red -outline red
dr::createPacket annotate8 -display $display_object -stipple blank \
                             -lineStyle solid -fill tan -outline tan
dr::createPacket annotate9 -display $display_object -stipple blank \
                         -lineStyle solid -fill green -outline green
dr::createPacket edgeLayer -display $display_object -stipple blank \
                 -lineStyle solid -fill winColor5 -outline winColor5
dr::createPacket edgeLayerPin -display $display_object -stipple blank \
                          -lineStyle solid -fill yellow -outline yellow
dr::createPacket snap -display $display_object -stipple blank \
                  -lineStyle solid -fill yellow -outline yellow
dr::createPacket stretch -display $display_object -stipple blank \
                     -lineStyle solid -fill yellow -outline yellow
dr::createPacket y0 -display $display_object -stipple blank \
                -lineStyle solid -fill yellow -outline yellow
dr::createPacket y1 -display $display_object -stipple blank \
                      -lineStyle solid -fill red -outline red
dr::createPacket y2 -display $display_object -stipple blank \
                  -lineStyle solid -fill green -outline green
dr::createPacket y3 -display $display_object -stipple blank \
              -lineStyle solid -fill magenta -outline magenta
dr::createPacket y4 -display $display_object -stipple blank \
                    -lineStyle solid -fill cyan -outline cyan
dr::createPacket y5 -display $display_object -stipple blank \
                -lineStyle solid -fill purple -outline purple
dr::createPacket y6 -display $display_object -stipple blank \
                -lineStyle solid -fill orange -outline orange
dr::createPacket y7 -display $display_object -stipple blank \
                    -lineStyle solid -fill gold -outline gold
dr::createPacket y8 -display $display_object -stipple blank \
                    -lineStyle solid -fill blue -outline blue
dr::createPacket y9 -display $display_object -stipple blank \
                -lineStyle solid -fill silver -outline silver
dr::createPacket y0Flt -display $display_object -stipple blank \
                   -lineStyle solid -fill yellow -outline yellow
dr::createPacket y1Flt -display $display_object -stipple blank \
                         -lineStyle solid -fill red -outline red
dr::createPacket y2Flt -display $display_object -stipple blank \
                     -lineStyle solid -fill green -outline green
dr::createPacket y3Flt -display $display_object -stipple blank \
                 -lineStyle solid -fill magenta -outline magenta
dr::createPacket y4Flt -display $display_object -stipple blank \
                       -lineStyle solid -fill cyan -outline cyan
dr::createPacket y5Flt -display $display_object -stipple blank \
                   -lineStyle solid -fill purple -outline purple
dr::createPacket y6Flt -display $display_object -stipple blank \
                   -lineStyle solid -fill orange -outline orange
dr::createPacket y7Flt -display $display_object -stipple blank \
                       -lineStyle solid -fill gold -outline gold
dr::createPacket y8Flt -display $display_object -stipple blank \
                       -lineStyle solid -fill blue -outline blue
dr::createPacket y9Flt -display $display_object -stipple blank \
                   -lineStyle solid -fill silver -outline silver
dr::createPacket hilite -display $display_object -stipple blank \
                      -lineStyle solid -fill white -outline white
dr::createPacket hilite1 -display $display_object -stipple blank \
                   -lineStyle thickDash -fill white -outline white
dr::createPacket hilite2 -display $display_object -stipple blank \
                           -lineStyle solid -fill tan -outline tan
dr::createPacket hilite3 -display $display_object -stipple blank \
                         -lineStyle solid -fill cyan -outline cyan
dr::createPacket hilite4 -display $display_object -stipple blank \
                     -lineStyle solid -fill orange -outline orange
dr::createPacket hilite5 -display $display_object -stipple blank \
                         -lineStyle solid -fill lime -outline lime
dr::createPacket hilite6 -display $display_object -stipple blank \
                     -lineStyle solid -fill orange -outline orange
dr::createPacket hilite7 -display $display_object -stipple blank \
                       -lineStyle solid -fill cream -outline cream
dr::createPacket hilite8 -display $display_object -stipple blank \
                   -lineStyle solid -fill magenta -outline magenta
dr::createPacket hilite9 -display $display_object -stipple blank \
                         -lineStyle solid -fill pink -outline pink
dr::createPacket select -display $display_object -stipple blank \
                          -lineStyle thickLine -fill tan -outline tan
dr::createPacket drive -display $display_object -stipple blank \
                       -lineStyle solid -fill blue -outline blue
dr::createPacket hiz -display $display_object -stipple blank \
                 -lineStyle solid -fill orange -outline orange
dr::createPacket resist -display $display_object -stipple blank \
                        -lineStyle solid -fill cyan -outline cyan
dr::createPacket spike -display $display_object -stipple blank \
                   -lineStyle solid -fill purple -outline purple
dr::createPacket supply -display $display_object -stipple blank \
                        -lineStyle solid -fill lime -outline lime
dr::createPacket unknown -display $display_object -stipple blank \
                     -lineStyle solid -fill yellow -outline yellow
dr::createPacket unset -display $display_object -stipple blank \
                   -lineStyle solid -fill forest -outline forest
dr::createPacket designFlow -display $display_object -stipple dots \
                           -lineStyle solid -fill blue -outline blue
dr::createPacket designFlow1 -display $display_object -stipple dots \
                        -lineStyle solid -fill purple -outline purple
dr::createPacket designFlow2 -display $display_object -stipple dots \
                      -lineStyle solid -fill magenta -outline magenta
dr::createPacket designFlow3 -display $display_object -stipple dots \
                            -lineStyle solid -fill cyan -outline cyan
dr::createPacket designFlow4 -display $display_object -stipple dots \
                        -lineStyle solid -fill forest -outline forest
dr::createPacket designFlow5 -display $display_object -stipple dots \
                          -lineStyle solid -fill green -outline green
dr::createPacket designFlow6 -display $display_object -stipple dots \
                        -lineStyle solid -fill orange -outline orange
dr::createPacket designFlow7 -display $display_object -stipple dots \
                        -lineStyle solid -fill yellow -outline yellow
dr::createPacket designFlow8 -display $display_object -stipple dots \
                          -lineStyle solid -fill brown -outline brown
dr::createPacket designFlow9 -display $display_object -stipple dots \
                              -lineStyle solid -fill red -outline red
dr::createPacket changedLayerTl0 -display $display_object -stipple blank \
                                   -lineStyle solid -fill red -outline red
dr::createPacket changedLayerTl1 -display $display_object -stipple blank \
                             -lineStyle solid -fill yellow -outline yellow
dr::createPacket markerAno -display $display_object -stipple X \
                       -lineStyle solid -fill blue -outline blue
dr::createPacket markerInf -display $display_object -stipple X \
                     -lineStyle solid -fill green -outline green
dr::createPacket markerAck -display $display_object -stipple X \
                   -lineStyle solid -fill yellow -outline yellow
dr::createPacket markerWarn -display $display_object -stipple X \
          -lineStyle solid -fill blinkYellow -outline blinkYellow
dr::createPacket markerSer -display $display_object -stipple X \
                   -lineStyle solid -fill orange -outline orange
dr::createPacket markerErr -display $display_object -stipple X \
           -lineStyle solid -fill blinkWhite -outline blinkWhite
dr::createPacket markerScr -display $display_object -stipple X \
                         -lineStyle solid -fill red -outline red
dr::createPacket markerCrt -display $display_object -stipple X \
                         -lineStyle solid -fill red -outline red
dr::createPacket markerFat -display $display_object -stipple X \
               -lineStyle solid -fill blinkRed -outline blinkRed
dr::createPacket Row -display $display_object -stipple blank \
                     -lineStyle solid -fill cyan -outline cyan
dr::createPacket RowBnd -display $display_object -stipple blank \
                        -lineStyle solid -fill cyan -outline cyan
dr::createPacket RowLbl -display $display_object -stipple blank \
                        -lineStyle solid -fill cyan -outline cyan
dr::createPacket Group -display $display_object -stipple dots \
                    -lineStyle solid -fill green -outline green
dr::createPacket GroupLbl -display $display_object -stipple blank \
                        -lineStyle solid -fill green -outline green
dr::createPacket GroupBnd -display $display_object -stipple blank \
                        -lineStyle solid -fill green -outline green
dr::createPacket Cannotoccupy -display $display_object -stipple X \
                            -lineStyle solid -fill red -outline red
dr::createPacket CannotoccupyBnd -display $display_object -stipple blank \
                                   -lineStyle solid -fill red -outline red
dr::createPacket Canplace -display $display_object -stipple blank \
                          -lineStyle solid -fill cyan -outline cyan
dr::createPacket Unrouted -display $display_object -stipple blank \
               -lineStyle dashed -fill winColor5 -outline winColor5
dr::createPacket UnroutedTrk -display $display_object -stipple blank \
                        -lineStyle dashed -fill yellow -outline yellow
dr::createPacket Unrouted1 -display $display_object -stipple blank \
                        -lineStyle dashed -fill brown -outline brown
dr::createPacket Unrouted2 -display $display_object -stipple blank \
                            -lineStyle dashed -fill red -outline red
dr::createPacket Unrouted3 -display $display_object -stipple blank \
                          -lineStyle dashed -fill pink -outline pink
dr::createPacket Unrouted4 -display $display_object -stipple blank \
                      -lineStyle dashed -fill orange -outline orange
dr::createPacket Unrouted5 -display $display_object -stipple blank \
                        -lineStyle dashed -fill green -outline green
dr::createPacket Unrouted6 -display $display_object -stipple blank \
                          -lineStyle dashed -fill blue -outline blue
dr::createPacket Unrouted7 -display $display_object -stipple blank \
                      -lineStyle dashed -fill purple -outline purple
dr::createPacket Unrouted8 -display $display_object -stipple blank \
                          -lineStyle dashed -fill gold -outline gold
dr::createPacket Unrouted9 -display $display_object -stipple blank \
                      -lineStyle dashed -fill silver -outline silver
dr::createPacket stroke_white -display $display_object -stipple blank \
                            -lineStyle solid -fill white -outline white
dr::createPacket select1_yellow -display $display_object -stipple blank \
                            -lineStyle solid -fill yellow -outline yellow
dr::createPacket select2_red -display $display_object -stipple blank \
                               -lineStyle solid -fill red -outline red
dr::createPacket select3_blue -display $display_object -stipple blank \
                              -lineStyle solid -fill blue -outline blue
dr::createPacket select4_purple -display $display_object -stipple blank \
                              -lineStyle solid -fill purple -outline purple
dr::createPacket highlight1_yellow -display $display_object -stipple blank \
                               -lineStyle solid -fill yellow -outline yellow
dr::createPacket highlight2_red -display $display_object -stipple blank \
                                  -lineStyle solid -fill red -outline red
dr::createPacket highlight3_green -display $display_object -stipple blank \
                                -lineStyle solid -fill green -outline green
dr::createPacket highlight4_blue -display $display_object -stipple blank \
                                 -lineStyle solid -fill blue -outline blue
dr::createPacket highlight5_purple -display $display_object -stipple blank \
                               -lineStyle solid -fill purple -outline purple
dr::createPacket highlight6_cyan -display $display_object -stipple blank \
                                 -lineStyle solid -fill cyan -outline cyan
dr::createPacket highlight7_white -display $display_object -stipple blank \
                                -lineStyle solid -fill white -outline white
dr::createPacket highlight8_gold -display $display_object -stipple blank \
                                 -lineStyle solid -fill gold -outline gold
dr::createPacket highlight9_maroon -display $display_object -stipple blank \
                               -lineStyle solid -fill maroon -outline maroon
dr::createPacket highlight10_gray -display $display_object -stipple blank \
                                  -lineStyle solid -fill gray -outline gray
dr::createPacket highlight1_yellow_dim -display $display_object -stipple blank \
                  -lineStyle solid -fill lightYellow -outline lightYellow
dr::createPacket highlight2_red_dim -display $display_object -stipple blank \
                  -lineStyle solid -fill lightRed -outline lightRed
dr::createPacket highlight3_green_dim -display $display_object -stipple blank \
                  -lineStyle solid -fill lightGreen -outline lightGreen
dr::createPacket highlight4_blue_dim -display $display_object -stipple blank \
                  -lineStyle solid -fill lightBlue -outline lightBlue
dr::createPacket highlight5_purple_dim -display $display_object -stipple blank \
                  -lineStyle solid -fill lightPurple -outline lightPurple
dr::createPacket highlight6_cyan_dim -display $display_object -stipple blank \
                  -lineStyle solid -fill lightCyan -outline lightCyan
dr::createPacket highlight7_white_dim -display $display_object -stipple blank \
                  -lineStyle solid -fill lightWhite -outline lightWhite
dr::createPacket highlight8_gold_dim -display $display_object -stipple blank \
                  -lineStyle solid -fill lightGold -outline lightGold
dr::createPacket highlight9_maroon_dim -display $display_object -stipple blank \
                  -lineStyle solid -fill lightMaroon -outline lightMaroon
dr::createPacket highlight10_gray_dim -display $display_object -stipple blank \
                  -lineStyle solid -fill lightGray -outline lightGray
dr::createPacket ruler_white -display $display_object -stipple blank \
                           -lineStyle solid -fill white -outline white
dr::createPacket active_TrueColorBright -display $display_object -stipple blank \
                  -lineStyle dashed -fill TrueColorBright -outline TrueColorBright
dr::createPacket runtime_TrueColorGhost -display $display_object -stipple blank \
                    -lineStyle solid -fill TrueColorGhost -outline TrueColorGhost
dr::createPacket cursor_white -display $display_object -stipple blank \
                            -lineStyle solid -fill white -outline white
dr::createPacket major_grid -display $display_object -stipple blank \
                      -lineStyle shortDash -fill white -outline white
dr::createPacket minor_grid -display $display_object -stipple blank \
                           -lineStyle dots -fill slate -outline slate
dr::createPacket yellow_white -display $display_object -stipple blank \
                           -lineStyle solid -fill yellow -outline white
dr::createPacket transparent_white -display $display_object -stipple blank \
                                -lineStyle solid -fill yellow -outline white -fillStyle outline
dr::createPacket pinUnc -display $display_object -stipple X \
                          -lineStyle solid -fill red -outline red
dr::createPacket wireUnrt -display $display_object -stipple blank \
      -lineStyle dashed -fill cadetBlue -outline cadetBlue
dr::createPacket inherited -display $display_object -stipple inherited \
                        -lineStyle inherited -fill inherited -outline inherited -fillStyle inherited
dr::createPacket nwell -display $display_object -stipple dotsa \
                   -lineStyle solid -fill magenta -outline magenta -fillStyle outline
dr::createPacket diff -display $display_object -stipple dots1 \
                  -lineStyle solid -fill yellow -outline yellow
dr::createPacket sldiff -display $display_object -stipple backSlash \
                  -lineStyle solid -fill red -outline red
dr::createPacket poly -display $display_object -stipple cross \
                        -lineStyle thickLine -fill blue -outline blue
dr::createPacket polyPin -display $display_object -stipple X \
                           -lineStyle solid -fill red -outline red -fillStyle X
dr::createPacket rpoly -display $display_object -stipple cross2 \
                       -lineStyle solid -fill lime -outline lime
dr::createPacket nplus -display $display_object -stipple dots1 \
                       -lineStyle solid -fill green -outline green -fillStyle outline
dr::createPacket pplus -display $display_object -stipple dots1 \
                        -lineStyle solid -fill red -outline red -fillStyle outline
dr::createPacket cont -display $display_object -stipple cross \
                    -lineStyle solid -fill green -outline green
dr::createPacket m1 -display $display_object -stipple dot4 \
                        -lineStyle solid -fill cyan -outline cyan
dr::createPacket m1Pin -display $display_object -stipple X \
                 -lineStyle solid -fill slate -outline slate -fillStyle X
dr::createPacket m1Blk -display $display_object -stipple X \
                 -lineStyle solid -fill slate -outline slate -fillStyle X
dr::createPacket m2 -display $display_object -stipple dot4 \
                -lineStyle solid -fill yellow -outline yellow
dr::createPacket m2Pin -display $display_object -stipple X \
                     -lineStyle solid -fill red -outline red -fillStyle X
dr::createPacket m2Blk -display $display_object -stipple X \
                     -lineStyle solid -fill red -outline red -fillStyle X
dr::createPacket m3 -display $display_object -stipple dot4 \
                  -lineStyle solid -fill blue -outline blue
dr::createPacket m3Pin -display $display_object -stipple X \
                 -lineStyle solid -fill blue -outline blue -fillStyle X
dr::createPacket m3Blk -display $display_object -stipple X \
                 -lineStyle solid -fill blue -outline blue -fillStyle X
dr::createPacket m4 -display $display_object -stipple dot4 \
                    -lineStyle solid -fill navy -outline navy
dr::createPacket m4Pin -display $display_object -stipple X \
                   -lineStyle solid -fill navy -outline navy -fillStyle X
dr::createPacket m4Blk -display $display_object -stipple X \
                   -lineStyle solid -fill navy -outline navy -fillStyle X
		   
dr::createPacket m5 -display $display_object -stipple dot4 \
                   -lineStyle solid -fill pink -outline pink
dr::createPacket m5Pin -display $display_object -stipple X \
                   -lineStyle solid -fill pink -outline pink -fillStyle X
dr::createPacket m5Blk -display $display_object -stipple X \
                   -lineStyle solid -fill pink -outline pink -fillStyle X

dr::createPacket m6 -display $display_object -stipple dot4 \
                   -lineStyle solid -fill cream -outline cream
dr::createPacket m6Pin -display $display_object -stipple X \
                   -lineStyle solid -fill cream -outline cream -fillStyle X
dr::createPacket m6Blk -display $display_object -stipple X \
                   -lineStyle solid -fill cream -outline cream -fillStyle X

dr::createPacket m7 -display $display_object -stipple dot4 \
                   -lineStyle solid -fill orange -outline orange
dr::createPacket m7Pin -display $display_object -stipple X \
                   -lineStyle solid -fill orange -outline orange -fillStyle X
dr::createPacket m7Blk -display $display_object -stipple X \
                   -lineStyle solid -fill orange -outline orange -fillStyle X

dr::createPacket m8 -display $display_object -stipple dot4 \
                   -lineStyle solid -fill purple -outline purple
dr::createPacket m8Pin -display $display_object -stipple X \
                   -lineStyle solid -fill purple -outline purple -fillStyle X
dr::createPacket m8Blk -display $display_object -stipple X \
                   -lineStyle solid -fill purple -outline purple -fillStyle X

dr::createPacket m9 -display $display_object -stipple dot4 \
                   -lineStyle solid -fill magenta -outline magenta
dr::createPacket m9Pin -display $display_object -stipple X \
                   -lineStyle solid -fill magenta -outline magenta -fillStyle X
dr::createPacket m9Blk -display $display_object -stipple X \
                   -lineStyle solid -fill magenta -outline magenta -fillStyle X

dr::createPacket v1 -display $display_object -stipple solid \
          -lineStyle solid -fill cadetBlue -outline cadetBlue -fillStyle X
dr::createPacket v2 -display $display_object -stipple solid \
                -lineStyle solid -fill orange -outline orange -fillStyle X
dr::createPacket v3 -display $display_object -stipple solid \
                -lineStyle solid -fill purple -outline purple -fillStyle X
dr::createPacket v4 -display $display_object -stipple solid \
                -lineStyle solid -fill magenta -outline magenta -fillStyle X	
dr::createPacket v5 -display $display_object -stipple solid \
                -lineStyle solid -fill orange -outline orange -fillStyle X
dr::createPacket v6 -display $display_object -stipple solid \
                -lineStyle solid -fill navy -outline navy -fillStyle X
dr::createPacket v7 -display $display_object -stipple solid \
                -lineStyle solid -fill yellow -outline yellow -fillStyle X
dr::createPacket v8 -display $display_object -stipple solid \
                -lineStyle solid -fill cream -outline cream -fillStyle X
		
dr::createPacket mtcap -display $display_object -stipple blank \
            -lineStyle thickLine2 -fill cadetBlue -outline cadetBlue -fillStyle outline
dr::createPacket dnw -display $display_object -stipple dotsa \
                  -lineStyle solid -fill green -outline green
dr::createPacket rpdmy -display $display_object -stipple dots1 \
                       -lineStyle solid -fill blue -outline blue -fillStyle outline
dr::createPacket rtdmy -display $display_object -stipple dots1 \
                       -lineStyle solid -fill silver -outline blue		       
dr::createPacket y9 -display $display_object -stipple blank \
                -lineStyle solid -fill silver -outline silver -fillStyle outline
dr::createPacket area -display $display_object -stipple blank \
                        -lineStyle solid -fill tan -outline tan -fillStyle outline
dr::createPacket magenta -display $display_object -stipple blank \
                   -lineStyle solid -fill magenta -outline magenta -fillStyle outline
dr::createPacket pink -display $display_object -stipple blank \
                      -lineStyle solid -fill pink -outline pink -fillStyle outline
dr::createPacket wireLbl -display $display_object -stipple solid \
               -lineStyle solid -fill cadetBlue -outline cadetBlue
#extra packets
dr::createPacket medvtp -display $display_object -stipple cross1 \
               -lineStyle solid -fill blue -outline blue
dr::createPacket medvtn -display $display_object -stipple cross1 \
               -lineStyle solid -fill green -outline green
dr::createPacket lowvtp -display $display_object -stipple cross1 \
               -lineStyle solid -fill blue -outline blue
dr::createPacket lowvtn -display $display_object -stipple cross1 \
               -lineStyle solid -fill green -outline green
dr::createPacket highvtp -display $display_object -stipple cross1 \
               -lineStyle solid -fill pink -outline pink
dr::createPacket highvtn -display $display_object -stipple cross1 \
               -lineStyle solid -fill white -outline white
dr::createPacket nat -display $display_object -stipple triangle \
               -lineStyle solid -fill brown -outline brown
dr::createPacket diff25 -display $display_object -stipple dots2 \
               -lineStyle solid -fill orange -outline orange
dr::createPacket diff18 -display $display_object -stipple dots2 \
               -lineStyle solid -fill green -outline green
dr::createPacket diff33 -display $display_object -stipple dots2 \
               -lineStyle solid -fill magenta -outline magenta
dr::createPacket hrimp -display $display_object -stipple solid \
                -lineStyle thickLine2 -fill navy -outline navy -fillStyle outline
dr::createPacket varmarker -display $display_object -stipple cross1 \
               -lineStyle thickLine2 -fill pink -outline pink -fillStyle outline
dr::createPacket dum_ind -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill forest -outline forest -fillStyle outline
dr::createPacket bjtdummy -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill red -outline red -fillStyle outline
dr::createPacket nwdmy -display $display_object -stipple vZigZag \
               -lineStyle thickLine2 -fill purple -outline purple -fillStyle outline
dr::createPacket rmdmy -display $display_object -stipple cross1 \
               -lineStyle solid -fill silver -outline silver
dr::createPacket inddmy -display $display_object -stipple blank \
                       -lineStyle lineStyle0 -fill winFore -outline winFore -fillStyle outline	       
dr::createPacket ctm -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket mbcap -display $display_object -stipple blank \
            -lineStyle thickLine2 -fill green -outline green -fillStyle outline
dr::createPacket ctmdmy -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill orange -outline orange -fillStyle outline
dr::createPacket rfdmy -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill yellow -outline yellow
dr::createPacket diode -display $display_object -stipple blank \
                    -lineStyle thickLine2 -fill purple -outline purple -fillStyle outline
dr::createPacket exclude -display $display_object -stipple dots \
               -lineStyle solid -fill pink -outline pink -fillStyle outline
dr::createPacket psub -display $display_object -stipple blank \
               -lineStyle solid -fill green -outline green
dr::createPacket m1b -display $display_object -stipple slash \
                        -lineStyle solid -fill green -outline green
dr::createPacket m2b -display $display_object -stipple slash \
                -lineStyle solid -fill yellow -outline yellow
dr::createPacket m3b -display $display_object -stipple slash \
                  -lineStyle solid -fill green -outline green
dr::createPacket m4b -display $display_object -stipple slash \
                    -lineStyle solid -fill pink -outline pink
dr::createPacket v1b -display $display_object -stipple solid \
          -lineStyle solid -fill cadetBlue -outline cadetBlue -fillStyle X
dr::createPacket v2b -display $display_object -stipple solid \
                -lineStyle solid -fill orange -outline orange -fillStyle X
dr::createPacket v3b -display $display_object -stipple solid \
                -lineStyle solid -fill purple -outline purple -fillStyle X
dr::createPacket v4b -display $display_object -stipple solid \
                -lineStyle solid -fill magenta -outline magenta -fillStyle X
dr::createPacket v5b -display $display_object -stipple solid \
                -lineStyle solid -fill orange -outline orange -fillStyle X
dr::createPacket v6b -display $display_object -stipple solid \
                -lineStyle solid -fill navy -outline navy -fillStyle X
dr::createPacket v7b -display $display_object -stipple solid \
                -lineStyle solid -fill yellow -outline yellow -fillStyle X
dr::createPacket v8b -display $display_object -stipple solid \
                -lineStyle solid -fill cream -outline cream -fillStyle X
		
dr::createPacket m1net -display $display_object -stipple slash \
                        -lineStyle solid -fill green -outline green
dr::createPacket m2net -display $display_object -stipple slash \
                -lineStyle solid -fill yellow -outline yellow
dr::createPacket m3net -display $display_object -stipple slash \
                  -lineStyle solid -fill green -outline green
dr::createPacket m4net -display $display_object -stipple slash \
                    -lineStyle solid -fill navy -outline navy
dr::createPacket v1net -display $display_object -stipple solid \
          -lineStyle solid -fill cadetBlue -outline cadetBlue -fillStyle X
dr::createPacket v2net -display $display_object -stipple solid \
                -lineStyle solid -fill orange -outline orange -fillStyle X
dr::createPacket v3net -display $display_object -stipple solid \
                -lineStyle solid -fill purple -outline purple -fillStyle X
dr::createPacket v4net -display $display_object -stipple solid \
                -lineStyle solid -fill magenta -outline magenta -fillStyle X
dr::createPacket v5net -display $display_object -stipple solid \
                -lineStyle solid -fill orange -outline orange -fillStyle X
dr::createPacket v6net -display $display_object -stipple solid \
                -lineStyle solid -fill navy -outline navy -fillStyle X
dr::createPacket v7net -display $display_object -stipple solid \
                -lineStyle solid -fill yellow -outline yellow -fillStyle X
dr::createPacket v8net -display $display_object -stipple solid \
                -lineStyle solid -fill cream -outline cream -fillStyle X


		
dr::createPacket m1slot -display $display_object -stipple slash \
                        -lineStyle solid -fill blue -outline blue
dr::createPacket m2slot -display $display_object -stipple slash \
                -lineStyle solid -fill yellow -outline yellow
dr::createPacket m3slot -display $display_object -stipple slash \
                  -lineStyle solid -fill green -outline green
dr::createPacket m4slot -display $display_object -stipple slash \
                    -lineStyle solid -fill navy -outline navy
dr::createPacket m5slot -display $display_object -stipple slash \
                    -lineStyle solid -fill pink -outline pink
dr::createPacket m6slot -display $display_object -stipple slash \
                   -lineStyle solid -fill cream -outline cream
dr::createPacket m7slot -display $display_object -stipple slash \
                    -lineStyle solid -fill orange -outline orange
dr::createPacket m8slot -display $display_object -stipple slash \
                    -lineStyle solid -fill purple -outline purple
dr::createPacket m9slot -display $display_object -stipple slash \
                    -lineStyle solid -fill magenta -outline magenta
		    
dr::createPacket bound -display $display_object -stipple blank \
                      -lineStyle solid -fill pink -outline pink -fillStyle outline
dr::createPacket momDmy1 -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill lime -outline lime -fillStyle outline
dr::createPacket momDmy2 -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill yellow -outline yellow -fillStyle outline
dr::createPacket momDmy3 -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill green -outline green -fillStyle outline
dr::createPacket momDmy4 -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill blue -outline blue -fillStyle outline
dr::createPacket momDmy5 -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill cream -outline cream -fillStyle outline
dr::createPacket momDmy6 -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill magenta -outline magenta -fillStyle outline
dr::createPacket momDmy7 -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill navy -outline navy -fillStyle outline
dr::createPacket momDmy8 -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill orange -outline orange -fillStyle outline
dr::createPacket momDmy9 -display $display_object -stipple blank \
               -lineStyle thickLine2 -fill purple -outline purple -fillStyle outline
	       
dr::createPacket nwellnet -display $display_object -stipple dotsa \
                   -lineStyle solid -fill magenta -outline magenta
dr::createPacket diffDmy -display $display_object -stipple dots1 \
                  -lineStyle solid -fill yellow -outline yellow
dr::createPacket polyDmy -display $display_object -stipple cross \
                        -lineStyle solid -fill maroon -outline maroon
dr::createPacket polynet -display $display_object -stipple cross \
                        -lineStyle solid -fill maroon -outline maroon
dr::createPacket pplusDmy -display $display_object -stipple dots1 \
                        -lineStyle solid -fill red -outline red
dr::createPacket contb -display $display_object -stipple solid \
                    -lineStyle solid -fill white -outline white -fillStyle X
dr::createPacket contnet -display $display_object -stipple solid \
                    -lineStyle solid -fill white -outline white -fillStyle X
dr::createPacket exDmyd -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket exDmy0 -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket exDmy1 -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket exDmy2 -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket exDmy3 -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket exDmy4 -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket exDmy5 -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket exDmy6 -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket exDmy7 -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket exDmy8 -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket exDmy9 -display $display_object -stipple hZigZag \
               -lineStyle solid -fill lime -outline lime
dr::createPacket ipLayer -display $display_object -stipple solid \
               -lineStyle solid -fill white -outline white
dr::createPacket m1txt -display $display_object -stipple solid \
                    -lineStyle solid -fill white -outline white
dr::createPacket m2txt -display $display_object -stipple solid \
                    -lineStyle solid -fill yellow -outline yellow
dr::createPacket m3txt -display $display_object -stipple solid \
                    -lineStyle solid -fill orange -outline orange
dr::createPacket m4txt -display $display_object -stipple solid \
                    -lineStyle solid -fill pink -outline pink		
dr::createPacket m5txt -display $display_object -stipple solid \
                    -lineStyle solid -fill green -outline green
dr::createPacket m6txt -display $display_object -stipple solid \
                    -lineStyle solid -fill purple -outline purple
dr::createPacket m7txt -display $display_object -stipple solid \
                    -lineStyle solid -fill yellow -outline yellow
dr::createPacket m8txt -display $display_object -stipple solid \
                    -lineStyle solid -fill cream -outline cream		
dr::createPacket m9txt -display $display_object -stipple solid \
                    -lineStyle solid -fill yellow -outline yellow				    
dr::createPacket polytxt -display $display_object -stipple solid \
                    -lineStyle solid -fill gray -outline gray		    

# PacketAliases definition
dr::createPacketAlias stroke -packet stroke_white -display $display_object
dr::createPacketAlias select1 -packet select1_yellow -display $display_object
dr::createPacketAlias select2 -packet select2_red -display $display_object
dr::createPacketAlias select3 -packet select3_blue -display $display_object
dr::createPacketAlias select4 -packet select4_purple -display $display_object
dr::createPacketAlias highlight1 -packet highlight1_yellow -display $display_object
dr::createPacketAlias highlight2 -packet highlight2_red -display $display_object
dr::createPacketAlias highlight3 -packet highlight3_green -display $display_object
dr::createPacketAlias highlight4 -packet highlight4_blue -display $display_object
dr::createPacketAlias highlight5 -packet highlight5_purple -display $display_object
dr::createPacketAlias highlight6 -packet highlight6_cyan -display $display_object
dr::createPacketAlias highlight7 -packet highlight7_white -display $display_object
dr::createPacketAlias highlight8 -packet highlight8_gold -display $display_object
dr::createPacketAlias highlight9 -packet highlight9_maroon -display $display_object
dr::createPacketAlias highlight10 -packet highlight10_gray -display $display_object
dr::createPacketAlias highlight1dim -packet highlight1_yellow_dim -display $display_object
dr::createPacketAlias highlight2dim -packet highlight2_red_dim -display $display_object
dr::createPacketAlias highlight3dim -packet highlight3_green_dim -display $display_object
dr::createPacketAlias highlight4dim -packet highlight4_blue_dim -display $display_object
dr::createPacketAlias highlight5dim -packet highlight5_purple_dim -display $display_object
dr::createPacketAlias highlight6dim -packet highlight6_cyan_dim -display $display_object
dr::createPacketAlias highlight7dim -packet highlight7_white_dim -display $display_object
dr::createPacketAlias highlight8dim -packet highlight8_gold_dim -display $display_object
dr::createPacketAlias highlight9dim -packet highlight9_maroon_dim -display $display_object
dr::createPacketAlias highlight10dim -packet highlight10_gray_dim -display $display_object
dr::createPacketAlias coordinate_mark -packet yellow_white -display $display_object
dr::createPacketAlias ghost_mark -packet transparent_white -display $display_object
dr::createPacketAlias ruler -packet ruler_white -display $display_object
dr::createPacketAlias active -packet active_TrueColorBright -display $display_object
dr::createPacketAlias runtime -packet runtime_TrueColorGhost -display $display_object
dr::createPacketAlias axis_white -packet axis -display $display_object
dr::createPacketAlias cursor -packet cursor_white -display $display_object
dr::createPacketAlias display_major_grid -packet major_grid -display $display_object
dr::createPacketAlias display_minor_grid -packet minor_grid -display $display_object
dr::createPacketAlias SE_runtime -packet inherited -display $display_object

dr::createPacketAlias net_highlight -packet highlight2_red -display $display_object
dr::createPacketAlias net_highlight2 -packet annotate -display $display_object
dr::createPacketAlias textAttach -packet annotate5 -display $display_object




