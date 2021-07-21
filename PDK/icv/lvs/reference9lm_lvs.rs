/***********************************************************************/
/*                    SYNOPSYS REFERENCE PDK LVS RUNSET                  */
/***********************************************************************/
/* This File and the associated documentation are confidential         */
/* and proprietary to Synopsys, Inc.                                   */ 
/*                                                                     */
/* Copyright (c), 2009-2010 Synopsys, Inc. All rights reserved.        */
/* This lvs deck and the associated documentation are confidential     */
/* and proprietary to Synopsys, Inc.                                   */
/*                                                                     */
/* DISCLAIMER                                                          */
/* The information contained herein is provided by Synopsys, Inc. on   */
/* an "AS IS" basis without any warranty, and Synopsys has no          */ 
/* obligation to support or otherwise maintain the information.        */
/*								       */
/* Synopsys, Inc. disclaims any representation that the information    */
/* does not infringe any intellectual property rights or proprietary   */
/* rights of any third parties. There are no other warranties given by */
/* Synopsys, whether express, implied or statutory, including, without */
/* limitation, implied warranties of merchantability and fitness for a */
/* particular purpose.						       */
/*								       */
/* Synopsys, Inc. reserves the right to make changes to the information*/ 
/* at any time and without notice.				       */
/*								       */
/***********************************************************************/
/*                                                                     */
/*  								       */
/* Change Log:                                                         */ 
/* 3 Mar  10        Adding first version			       */ 
/*								       */ 	
/***********************************************************************/
/*                                                                     */
/* Synopsys 90 nm Demo LVS runset                                      */
/* This is for a fictional process and just shows how things can be    */ 
/* Synopsys accepts no responsibility for any use of this runset.      */
/*                                                                     */
/***********************************************************************/

//This runset is in the development stage and there might be some updates to it.

#include "icv.rh"
/*
#ifdef VERSION_LT
#if VERSION_LT(2009,12,0,0)
# error This PXL runset is gnerated to run with ICV version 2009.12 or newer.
#endif
#endif*/

#include "math.rh"
#include "compare_public.rh"
/* data_dir : string = "/remote/us01home19/vkrishna/LVS_90/LVS_kit_2010"; */

data_dir : string = "/remote/dept-seg-cae2/FTK/agarwals/PERFORCE/IPL/reference/90nm/icv/lvs";
/* ENVIRONMENTAL VARIABLES */
RES_3TERM : integer = 0;
CAP_3TERM :	integer = 0;
DRAWCBM : integer = 1;
current_cell :string = "Ind" ;
/*current_cell :string = "vco" ;*/

library(
    cell         = current_cell,
    format       = OPENACCESS,
    library_definition_file = "lib.defs",
    library_name = "adder_4bit"
);
error_options(
    error_limit_per_check = 99999999
);

/*openaccess_options (layer_mapping_file = data_dir+"/generic90RF_layer.map"
	,generate_pin_text = TOP);
*/
openaccess_options(
    view                = "layout",
    layer_mapping_file  = (data_dir+"/../../techfiles/reference90RF_layer.map")
);
schematic_netlist = schematic (

schematic_file = {{data_dir+"/empty.subckt",CDL}},
schematic_library_file = {{data_dir+"/empty.subckt",CDL}},
 
 /*root_cell = "vco",*/



/*slash_hierarchical_delimiter = true,*/
/*	{"./empty.subckt",SPICE}}*/
/*        XREF   = TRUE		*/
cdl_settings = { convert_parameter_to_property = true ,
keep_passive_devices = true
}
);
/* OPTIONS to be included */
/* text options to be included */
text_options(
/* USE_COLON_TEXT = TRUE - Suppresses text open messages for virtual wires
	TRUNCATE_FLAG = FALSE - Truncates text string
	REMOVE_TEXT_FROM_SHORT = TRUE  - Removes text on nets with multiple names
	USE_EXPLODED_TEXT = TRUE - Uses all text from exploded cells
	CONNECT_BY_NAME = MIXED_MODE - Defines how named nets are merged in the
netlist.
	ATTACH_TEXT = ALL - Creates ports from a lower level polygon to higher
level text */
	colon_text = EQUATE_NETS,
	semicolon_text = EQUATE_NETS,
	use_exploded_text = {{cells = {"*"},text = {"*"}}}

);

/*	library_mapping_file = ./lib.defs,*/
	/*layer_mapping_file =  /remote/dept-seg-cae2/FTK/siddhart/PERFORCE/oa_generic/90nm/techfiles/generic90RF_layer.map*/

/* OPEN access optoins to be included */
NWELL      = assign( {{ 1 }} );
DIFN       = assign( {{ 2 }} );
POLS       = assign( {{ 3 }} );
POLS_TEXT = assign_text( {{ 41, 0 }} );
POLYPIN    = assign( {{ 41, 0 }} );
PPS        = assign( {{ 4 }} );
NPS        = assign( {{ 5 }} );
SAB        = assign( {{ 6 }} );
CONTS      = assign( {{ 7 }} );
M1S        = assign( {{ 8 }} );
M1S_TEXT = assign_text( {{ 9, 0 }} );
M1PIN      = assign( {{ 9, 0 }} );
M2S        = assign( {{ 10 }} );
M2S_TEXT = assign_text( {{ 11, 0 }} );
M2PIN      = assign( {{ 11, 0 }} );
M3S        = assign( {{ 12 }} );
M3S_TEXT = assign_text( {{ 13, 0 }} );
M3PIN      = assign( {{ 13, 0 }} );
M4S        = assign( {{ 14 }} );
M4S_TEXT = assign_text( {{ 15, 0 }} );
M4PIN      = assign( {{ 15, 0 }} );
V1S        = assign( {{ 16 }} );
V2S        = assign( {{ 17 }} );
V3S        = assign( {{ 18 }} );
CAP_MIMS   = assign( {{ 20 }} );
CBM        = assign( {{ 21 }} );
DNWELL     = assign( {{ 22 }} );
NWDMY      = assign( {{ 23 }} );
RMARKER    = assign( {{ 28 }} );
DIODE      = assign( {{ 25 }} );
NAT        = assign( {{ 26 }} );
DIFF25     = assign( {{ 27 }} );
HRPOLY     = assign( {{ 29 }} );
DUM_INDS   = assign( {{ 30 }} );
VARMARKER  = assign( {{ 31 }} );
RMDMY      = assign( {{ 32 }} );
BJTDMY     = assign( {{ 49 }} );
M1SLOT     = assign( {{ 8, 1 }} );
DIFF18     = assign( {{ 35 }} );
DIFF33     = assign( {{ 36 }} );
LOWVTN     = assign( {{ 37 }} );
HIGHVTN    = assign( {{ 39 }} );
MEDVTN     = assign( {{ 33 }} );
LOWVTP     = assign( {{ 38 }} );
HIGHVTP    = assign( {{ 40 }} );
MEDVTP     = assign( {{ 34 }} );
MOMDMY1    = assign( {{ 68, 1 }} );
MOMDMY2    = assign( {{ 68, 2 }} );
MOMDMY3    = assign( {{ 68, 3 }} );
MOMDMY4    = assign( {{ 68, 4 }} );
RFDMY      = assign( {{ 69 }} );
PINDMY     = assign( {{ 65 }} );
RTERMARKER = assign( {{ 66 }} );
M5S = assign(  { {== 70} } );
M5S_TEXT = assign_text(  { {== 70, == 0} } );
M5PIN = assign(  { {== 71, == 0} } );
M6S = assign(  { {== 72} } );
M6S_TEXT = assign_text(  { {== 18, == 0} } );
M6PIN = assign(  { {== 73, == 0} } );
M7S = assign(  { {== 74} } );
M7S_TEXT = assign_text(  { {== 20, == 0} } );
M7PIN = assign(  { {== 75, == 0} } );
M8S = assign(  { {== 76} } );
M8S_TEXT = assign_text(  { {== 22, == 0} } );
M8PIN = assign(  { {== 77, == 0} } );
M9S = assign(  { {== 78} } );
M9S_TEXT = assign_text(  { {== 24, == 0} } );
M9PIN = assign(  { {== 79, == 0} } );
V4S = assign(  { {== 80} } );
V5S = assign(  { {== 81} } );
V6S = assign(  { {== 82} } );
V7S = assign(  { {== 83} } );
V8S = assign(  { {== 84} } );

/*##############################################################################
# Copyright (c), 2006-2007 Synopsys, Inc. All rights reserved.
# This LVS deck and the associated documentation are confidential 
# and proprietary to Synopsys, Inc. 
# 
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
###############################################################################*/
/* Hercules line 107: ENVIRONMENT DOUBLE RES_3TERM defaults to 0; */
/* Hercules line 108: ENVIRONMENT DOUBLE CAP_3TERM defaults to 0; */
/* Hercules line 109: ENVIRONMENT DOUBLE DRAWCBM defaults to 1; */
top_met = copy( M9S );
top_via_poss = copy( V8S );
cap_top_via = and( CAP_MIMS, top_via_poss );
top_via = not( V8S, cap_top_via );
sec_top_via = copy(V7S);
third_top_via = copy(V6S);
fourth_top_via = copy(V5S);
fifth_top_via = copy(V4S);
sixth_top_via = copy(V3S);
seventh_top_via = copy(V2S);
sec_top_met = copy(M8S);
third_top_met = copy(M7S);
fourth_top_met = copy(M6S);
fifth_top_met = copy(M5S);
sixth_top_met = copy(M4S);
seventh_top_met = copy(M3S);
eighth_top_met = copy(M2S);
metal1 = copy(M1S);
metal2 = copy(M2S);
metal3 = copy(M3S);
metal4 = copy(M4S);
metal5 = copy(M5S);
metal6 = copy(M6S);
metal7 = copy(M7S);
metal8 = copy(M8S);
metal9 = copy(M9S);

__BULK = cell_extent( { "*" } );
rpolywo1 = and( POLS, RMARKER );
rpolywo2 = interacting( rpolywo1, SAB );
drdum = interacting( RMARKER, DIFN );
rp1 = not( RMARKER, drdum );
/* poly1 resistor dummy */
p1rdum = interacting( rp1, POLS );
rpolywo = interacting( rpolywo2, p1rdum );
poly1 = not( POLS, rpolywo );
rpoly1 = and( POLS, p1rdum );
TT1 = interacting( rpoly1, SAB );
rpoly = not( rpoly1, TT1 );
/* POLY interconnect */
poly = not( poly1, rpoly );
rodwo1 = and( DIFN, RMARKER );
rodwo2 = and( rodwo1, SAB );
/* diff resistor dummy */
drdum = interacting( RMARKER, DIFN );
rodwo = interacting( rodwo2, drdum );
mdiff1 = not( DIFN, rodwo );
rod1 = and( DIFN, drdum );
TT2 = interacting( rod1, SAB );
rod = not( rod1, TT2 );
mdiff = not( mdiff1, rod );
gate = and( poly, mdiff );
/* define N_well region */
nxwell = not( NWELL, NWDMY );
/* gate not inside nwell */
gatennw = not( gate, nxwell );
ngate = and( gatennw, NPS );
poly = not( poly, gate );
/* define N+ thin oxide */
nthin = and( mdiff, NPS );
/* define N+ diffusion region */
tndiff = not( nthin, gate );
/* define total p_sub region */
psub = buildsub( NWELL );
/*psub = not (__BULK,NWELL);*/
/* gate inside nwell */
gatenw = and( gate, nxwell );
pgate = and( gatenw, PPS );
/* define P+ thin oxide */
pthin = and( mdiff, PPS );
/* define P+ diffusion region */
tpdiff = not( pthin, gate );
natgate25 = ngate and DIFF25 and NAT not VARMARKER;
natgate18 = ngate and DIFF18 and NAT not VARMARKER;
natgate33 = ngate and DIFF33 and NAT not VARMARKER;
ngate25 = ngate and DIFF25 not NAT not VARMARKER not DNWELL not MEDVTN;
ngate18 = ngate and DIFF18 not NAT not VARMARKER not DNWELL;
ngate33 = ngate and DIFF33 not NAT not VARMARKER not DNWELL;
natgate = ngate and NAT not DIFF25 not DIFF18 not DIFF33 not VARMARKER;
ngate_dnwell25 = ngate and DNWELL and DIFF25;
mngate25 = ngate and DIFF25 and MEDVTN;
ngate = ngate not NAT not DIFF25 not VARMARKER;
lngate = and( ngate, LOWVTN );
hngate = and( ngate, HIGHVTN );
mngate = ngate and MEDVTN not DIFF25;
ngate_dnwell = and( ngate, DNWELL );
tndiff_dnwell = interacting( tndiff, ngate_dnwell );
tndiff_dnwell = not( tndiff_dnwell, gate );
tndiff_dnwell25 = interacting( tndiff, ngate_dnwell25 );
tndiff_dnwell25 = not( tndiff_dnwell25, gate );
tndiff = ( tndiff not tndiff_dnwell ) not tndiff_dnwell25;
tndiff18 = ( tndiff not tndiff_dnwell ) not tndiff_dnwell25 and DIFF18;
tndiff33 = ( tndiff not tndiff_dnwell ) not tndiff_dnwell25 and DIFF33;
ngate = ngate not DNWELL not DIFF18 not DIFF33 not LOWVTN not HIGHVTN
    not MEDVTN;
tpdiff_dnwell = and( tpdiff, DNWELL );
tpdiff = not( tpdiff, DNWELL );
lpgate = and( pgate, LOWVTP );
mpgate = and( pgate, MEDVTP );
hpgate = and( pgate, HIGHVTP );
pgate33 = pgate and DIFF33 not VARMARKER not DIFF18 not DIFF25;
pgate18 = pgate and DIFF18 not VARMARKER not DIFF33 not DIFF25;
pgate25 = pgate and DIFF25 not VARMARKER not DIFF33 not DIFF18;
pgate = pgate not DIFF25 not VARMARKER not DIFF33 not DIFF18 not lpgate
    not hpgate not mpgate;
rdiff_res = ( DIFN and SAB ) and NPS and RMARKER;
rdiff_res_nS = ( DIFN not SAB ) and NPS and RMARKER;
/* N-well resistor layer */
trwell = and( NWDMY, NWELL );
drpo = and( DIFN, SAB );
/* NWDMY*NWELL*RPO*diff --> nwdiff */
nwdiff_r = and( trwell, drpo );
/* NWDMY*NWELL-RPO-diff --> nwsti */
nwsti_r = not( trwell, drpo );
/* P+POLY resistor w/o silicide */
rppolywo_r_ = and( rpolywo, PPS );
/* P+POLY resistor w/o silicide */
rppolywo_r = and( rppolywo_r_, SAB );
/* N+POLY resistor w/o silicide */
rnpolywo_r_ = and( rpolywo, NPS );
/* N+POLY resistor w/o silicide */
rnpolywo_r = and( rnpolywo_r_, SAB );
pos_resdiff = interacting( DIFN, RMARKER );
resndiff = pos_resdiff not SAB and NPS;
resndiff_nS = pos_resdiff and NPS not RMARKER not SAB;
tiod1 = not( DIFN, POLS );
tiod2 = not( tiod1, SAB );
tiod3 = tiod2 not ( RMARKER or BJTDMY );
tiod4 = not( tiod3, NWDMY );
/* RPO, RMARKER, NWDMY cut ti-od */
tiod = not( tiod4, VARMARKER );
nodcon = and( tiod, NPS );
podcon = and( tiod, PPS );
subtie = and( podcon, psub );
rpdiff_nS = DIFN and RMARKER and PPS;
rpdiff = and( rpdiff_nS, SAB );
/* RTMOM */
MOM_field1 = and( M1S, MOMDMY1 );
MOM_field2 = and( M2S, MOMDMY2 );
MOM_field3 = and( M3S, MOMDMY3 );
MOM_field4 = and( M4S, MOMDMY4 );
mom1 = interacting( MOMDMY1, MOM_field1 );
mom12 = interacting( mom1, MOM_field2 );
mom_cap_123_ = interacting( mom12, MOM_field3 );
mom_cap_123_body = not_interacting( mom_cap_123_, MOM_field4, 
    include_touch = ALL
);
mom_cap_1234_body = interacting( mom_cap_123_, MOM_field4 );
mom2 = interacting( MOMDMY2, MOM_field2 );
mom23 = interacting( mom2, MOM_field3 );
mom_cap_234_ = interacting( mom23, MOM_field4 );
mom_cap_234_body = not_interacting( mom_cap_234_, MOM_field1, 
    include_touch = ALL
);
mom_cap_1234_term_ = not( M4S, mom_cap_1234_body );
mom_cap_1234_term = interacting( mom_cap_1234_term_, mom_cap_1234_body );
mom_cap_123_term_ = not( M3S, mom_cap_123_body );
mom_cap_123_term = interacting( mom_cap_123_term_, mom_cap_123_body );
mom_cap_234_term = interacting( mom_cap_1234_term_, mom_cap_234_body );
F_reg1 = external1( MOM_field1, < 0.41, 
    extension   = NONE,
    membership  = DIFFERENT_POLYGON,
    projection  = { OUT, IN },
    orientation = { PARALLEL }
);
F_reg2 = external1( MOM_field2, < 0.41, 
    extension   = NONE,
    membership  = DIFFERENT_POLYGON,
    projection  = { OUT, IN },
    orientation = { PARALLEL }
);
/*BOOLEAN rpdiff_nS NOT SAB { } TEMP = rpdiff_nS*/
rpdiff_nS = outside( rpdiff_nS, SAB );
OD_rpdiff = interacting( DIFN, rpdiff );
rpdiff_term = not( OD_rpdiff, rpdiff );
OD_rpdiff_nS = interacting( DIFN, rpdiff_nS );
rpdiff_term_nS = not( OD_rpdiff_nS, rpdiff_nS );
subtie = ( subtie not rpdiff_term ) not rpdiff_term_nS;
hrpoly_res = POLS and SAB and HRPOLY;
hrpoly_t = interacting( hrpoly_res, NPS );
hrpoly = not( hrpoly_t, NPS );
hrppoly_t = interacting( hrpoly_res, PPS );
hrppoly = not( hrppoly_t, PPS );
PO_hrpoly_res = interacting( POLS, hrpoly );
hrpoly_term_NP = not( PO_hrpoly_res, hrpoly );
PO_hrppoly_res = interacting( POLS, hrppoly );
hrpoly_term_PP = not( PO_hrppoly_res, hrppoly );
/**** Diode ********/
nwell_dnw = interacting( NWELL, DNWELL );
nwell_dnw_hole = donut_holes( nwell_dnw, holes = INNER );
pactive = and( tpdiff, NWELL );
pdiod = not_interacting( pactive, POLS, 
    include_touch = ALL
);
hvdiff = DIFF18 or DIFF25 or DIFF33;
vtLay = HIGHVTN or LOWVTN or HIGHVTP or LOWVTP;
pdiode = pdiod and DIODE not hvdiff not vtLay not NAT;
pvardio = pdiod and RFDMY not hvdiff not vtLay not NAT;
pdio_lvt = pdiod and DIODE and LOWVTP not hvdiff not NAT;
pdio_hvt = pdiod and DIODE and HIGHVTP not hvdiff not NAT;
nactive = and( tndiff, psub );
ndiod = not_interacting( nactive, POLS, 
    include_touch = ALL
);
ndiode = ndiod and DIODE not NWELL not hvdiff not vtLay not nwell_dnw_hole
    not NAT;
ndio_na_dio = ndiod and DIODE and NAT not NWELL not hvdiff not vtLay not nwell_dnw_hole;
ndio_lvt = ndiod and DIODE and LOWVTN not NWELL not hvdiff not nwell_dnw_hole
    not NAT;
ndio_hvt = ndiod and DIODE and HIGHVTN not NWELL not hvdiff not nwell_dnw_hole
    not NAT;
pn18v_dio = tpdiff and DIFF18 and DIODE not vtLay not NAT;
pn25v_dio = tpdiff and DIFF25 and DIODE not vtLay not NAT;
pn33v_dio = tpdiff and DIFF33 and DIODE not vtLay not NAT;
np18v_dio = tndiff and DIFF18 and DIODE not vtLay not NAT not NWELL;
np25v_dio = tndiff and DIFF25 and DIODE not vtLay not NAT not NWELL;
np33v_dio = tndiff and DIFF33 and DIODE not vtLay not NAT not NWELL;
ndio_na18v_dio = tndiff and DIFF18 and DIODE and NAT not vtLay not NWELL;
ndio_na25v_dio = tndiff and DIFF25 and DIODE and NAT not vtLay not NWELL;
ndio_na33v_dio = tndiff and DIFF33 and DIODE and NAT not vtLay not NWELL;
dionw = outside( DIODE, tpdiff );
nwdiode_dio = NWELL and dionw not hvdiff not nwell_dnw;
nwdiode18_dio = NWELL and dionw and DIFF18 not nwell_dnw;
nwdiode25_dio = NWELL and dionw and DIFF25 not nwell_dnw;
nwdiode33_dio = NWELL and dionw and DIFF33 not nwell_dnw;
welltie = and( nodcon, NWELL );
/************* Deep Nwell Diode Data Creation **********/
dnwdiode_pwell = and( nwell_dnw_hole, DIODE );
dnwdiode_pwell1 = enclosing( DNWELL, dnwdiode_pwell );
dnwdiode_nwell = interacting( nwell_dnw, DIODE );
/************* Deep Nwell BJT Data Creation **********/
emit_dnw_pnp = not( nwell_dnw_hole, dnwdiode_pwell );
base_dnw_pnp_poss = not( nwell_dnw, dnwdiode_nwell );
base_dnw_pnp = or( base_dnw_pnp_poss, emit_dnw_pnp );
coll_dnw_pnp = size( base_dnw_pnp, 0.1, 
    clip_acute       = NONE,
    corner_extension = NONE
);
base_dnw_pnp_cont = base_dnw_pnp and CONTS not emit_dnw_pnp;
emit_dnw_pnp_cont = emit_dnw_pnp and CONTS and PPS;
RCTM : polygon_layer;
if( DRAWCBM == 0 ) {
/**** Capacitor ********/
RCTM = and( CAP_MIMS, M8S );
} else {
	RCTM = CAP_MIMS and CBM;
}
CTM_VIA = and( RCTM, V8S );
m8cap = and( sec_top_met, RCTM );
sec_top_met = not( sec_top_met, m8cap );
mim_top2 = and( CAP_MIMS, M8S );
RCTM_2 = interacting (mim_top2,V7S);
/* Hercules line 463: SELECT mim_top2 INTERACT V3S {} TEMP=RCTM_2 */
shield_ = or( M1S, M2S );
shield = interacting( shield_, RCTM );
pinshield = or( shield, PINDMY );
RCBM = interacting( CBM, RCTM );
OCBM = not( RCBM, RCTM );
CBM_VIA = and( OCBM, V8S );
/**** Inductor ********/
inddmy_usize = size( DUM_INDS, - 44.95, 
    clip_acute       = NONE,
    corner_extension = NONE
);
ovlp_inddmy = not( DUM_INDS, inddmy_usize );
met_ovlp_inddmy = and( sec_top_met, ovlp_inddmy );
inddmy_std = interacting( DUM_INDS, met_ovlp_inddmy );
ind_std_dmy = interacting( inddmy_usize, inddmy_std );
std_ind1 = and( top_met, ind_std_dmy );
std_ind2 = size( size( std_ind1, 3 ), - 3 );
std_hole = donut_holes( std_ind2 );
std_ind4 = interacting( std_ind1, std_hole );
ind_met = not( std_ind1, std_ind4 );
ind_met1 = and( ind_met, inddmy_usize );
std_ind5 = interacting( ind_met, ind_met1 );
/* Body for standard inductor */
ind_octagon = or( std_ind4, std_ind5 );
all_stdind_dumy = interacting( inddmy_usize, ind_octagon );
/* Dummy for all symmetric inductors */
sym_all_dmy = not( inddmy_usize, all_stdind_dumy );
indpin = and( sec_top_met, DUM_INDS );
sym_all_ind1 = and( top_met, sym_all_dmy );
sym_all_ind2 = or( sym_all_ind1, indpin );
sz_sym_ind = size( size( sym_all_ind2, 5 ), - 5 );
sym_hole = donut_holes( sz_sym_ind );
sym_all_ind3 = interacting( sz_sym_ind, sym_hole );
/* body for all symmetric inductors */
sym_all_ind = interacting( sym_all_ind2, sym_all_ind3 );
met_induc = and( third_top_met, sym_all_dmy );
ind_ct_dmy = interacting( sym_all_dmy, met_induc );
ind_sym_dmy = not( sym_all_dmy, ind_ct_dmy );
/* body for symmetric inductor without center tap */
ind_oct_sym = and( sym_all_ind, ind_sym_dmy );
/* body for symmetric inductor with center tap */
ind_oct_symct = and( sym_all_ind, ind_ct_dmy );
sec_top_metindct = and( sec_top_met, ind_oct_symct );
ind_oct_symct_hole = donut_holes( ind_oct_symct );
space_ind_symct1 = external1( ind_oct_symct, < 45, 
    extension   = NONE,
    orthogonal  = BOTH,
    orientation = { PARALLEL }
);
space_ind_symct = and( space_ind_symct1, ind_oct_symct_hole );
ind_oct_symct_ou = size( size( ind_oct_symct, 3 ), - 3 );
ind_oct_symct_radhole1 = donut_holes( ind_oct_symct_ou, 
    holes = EMPTY
);
/* To calculate radius using device command for 3  term device */
ind_oct_symct_radhole = size( size( ind_oct_symct_radhole1, - 30 ), 30 );
/* all inductor body */
induct_body = or( ind_octagon, sym_all_ind );
/*********************************************************************************/
varndiff = tndiff not DIFF25 and VARMARKER;
varpdiff = tpdiff not DIFF25 and VARMARKER;
varngate = gate not DIFF25 and NPS and VARMARKER;
varpgate = gate not DIFF25 and PPS and VARMARKER;
varnpoly = poly and NPS and VARMARKER;
/* Hercules line 531: boolean poly and NPS and VARMARKER {} temp = varnpoly */
varppoly = poly and PPS and VARMARKER;
/* Hercules line 532: boolean poly and PPS and VARMARKER {} temp = varppoly */
varndiff25 = tndiff and DIFF25 and VARMARKER;
varpdiff25 = tpdiff and DIFF25 and VARMARKER;
varngate25 = gate and DIFF25 and NPS and VARMARKER;
varpgate25 = gate and DIFF25 and PPS and VARMARKER;
/*********************************************************************************/
nxwell_NWDIODE = interacting( nxwell, nwdiode_dio );
nxwell_NWDIODE18 = interacting( nxwell, nwdiode18_dio );
nxwell_NWDIODE25 = interacting( nxwell, nwdiode25_dio );
nxwell_NWDIODE33 = interacting( nxwell, nwdiode33_dio );
nxwell = not( nxwell, nxwell_NWDIODE );
/*********************************************************************************/
DNWELL_NDNW = interacting( DNWELL, ngate_dnwell );
DNWELL_NDNW_25 = interacting( DNWELL, ngate_dnwell25 );
nxwell_DNWELL = interacting( nxwell, DNWELL );
nxwell = not( nxwell, nxwell_DNWELL );
/*********************************************************************************/
resndiff = interacting( resndiff, SAB );
/************* Metal Resistors Data Creation ***********************************/
rm1_body = and( metal1, RMDMY );
rm1_term_poss = size( rm1_body, 0.01, 
    clip_acute       = NONE,
    corner_extension = NONE
);
rm1_term = rm1_term_poss and metal1 not rm1_body;
rm2_body = and( metal2, RMDMY );
rm2_term_poss = size( rm2_body, 0.01, 
    clip_acute       = NONE,
    corner_extension = NONE
);
rm2_term = rm2_term_poss and metal2 not rm2_body;
rm3_body = and( metal3, RMDMY );
rm3_term_poss = size( rm3_body, 0.01, 
    clip_acute       = NONE,
    corner_extension = NONE
);
rm3_term = rm3_term_poss and metal3 not rm3_body;
rm4_body = and( metal4, RMDMY );
rm4_term_poss = size( rm4_body, 0.01, 
    clip_acute       = NONE,
    corner_extension = NONE
);
rm4_term = rm4_term_poss and metal4 not rm4_body;
rm5_body =   metal5 and RMDMY;
rm5_term_poss = size(rm5_body, distance = 0.01 , clip_acute = NONE, corner_extension = NONE);
rm5_term =   rm5_term_poss and metal5 not rm5_body;
rm6_body =   metal6 and RMDMY;
rm6_term_poss = size(rm6_body, distance = 0.01 , clip_acute = NONE, corner_extension = NONE);
rm6_term =   rm6_term_poss and metal6 not rm6_body;
rm7_body =   metal7 and RMDMY;
rm7_term_poss = size(rm7_body, distance = 0.01 , clip_acute = NONE, corner_extension = NONE);
rm7_term =   rm7_term_poss and metal7 not rm7_body;
rm8_body =   metal8 and RMDMY;
rm8_term_poss = size(rm8_body, distance = 0.01 , clip_acute = NONE, corner_extension = NONE);
rm8_term =   rm8_term_poss and metal8 not rm8_body;
rm9_body =   metal9 and RMDMY;
rm9_term_poss = size(rm9_body, distance = 0.01 , clip_acute = NONE, corner_extension = NONE);
rm9_term =   rm9_term_poss and metal9 not rm9_body;
/************* BJT Data Creation Section****************//*Vertical PNP Derivation*/
nwell_hole = donut_holes( nxwell, holes = INNER );
dnwell_hole = donut_holes( nxwell_DNWELL, holes = INNER );
sab_hole = donut_holes( SAB, holes = INNER );
nwell_hole_sab = or( nwell_hole, sab_hole );
T_E_M_P_4444 = interacting( BJTDMY, DIFN );
T_E_M_P_4 = not_interacting( T_E_M_P_4444, sab_hole, 
    include_touch = ALL
);
DIFN_BIP = and( DIFN, T_E_M_P_4 );
ALL_BJT_COLL = and( psub, T_E_M_P_4 );
psub = not( psub, ALL_BJT_COLL );
_T_E_M_P_43 = and( NWELL, BJTDMY );
_1_0V_BJT_BASE_poss = not( _T_E_M_P_43, DIFF25 );
_T_E_M_P_44 = and( DIFN_BIP, PPS );
_1_0V_BJT_COLL_poss = not( ALL_BJT_COLL, DIFF25 );
_1_0V_BJT_COLL = not_interacting( _1_0V_BJT_COLL_poss, nwell_hole_sab, 
    include_touch = ALL
);
_1_0V_BJT_BASE = not_interacting( _1_0V_BJT_BASE_poss, nwell_hole_sab, 
    include_touch = ALL
);
_1_0V_BJT_EMIT = and( _T_E_M_P_44, _1_0V_BJT_BASE );
_T_E_M_P_45 = and( nxwell, BJTDMY );
_2_5V_BJT_BASE_poss = and( _T_E_M_P_45, DIFF25 );
_2_5V_BJT_COLL_poss = and( ALL_BJT_COLL, DIFF25 );
_2_5V_BJT_COLL = not_interacting( _2_5V_BJT_COLL_poss, nwell_hole_sab, 
    include_touch = ALL
);
_2_5V_BJT_BASE = not_interacting( _2_5V_BJT_BASE_poss, nwell_hole_sab, 
    include_touch = ALL
);
_2_5V_BJT_EMIT = and( _T_E_M_P_44, _2_5V_BJT_BASE );
/*Vertical NPN 1.8V*/
_1_0V_BJT_COLL_NPN_poss = not( T_E_M_P_4, DIFF25 );
_1_0V_BJT_COLL_NPN_poss1 = interacting( _1_0V_BJT_COLL_NPN_poss, nwell_hole );
_1_0V_BJT_COLL_NPN = not_interacting( _1_0V_BJT_COLL_NPN_poss1, sab_hole, 
    include_touch = ALL
);
_1_0V_BJT_BASE_NPN = _1_0V_BJT_COLL_NPN not DIFF25 not nxwell and nwell_hole;
_1_0V_BJT_EMIT_NPN = ( ( DIFN_BIP not DIFF25 ) and NPS ) not nxwell and nwell_hole;
/*Vertical NPN 3.3V*/
_2_5V_BJT_COLL_NPN_poss = and( T_E_M_P_4, DIFF25 );
_2_5V_BJT_COLL_NPN_poss1 = interacting( _2_5V_BJT_COLL_NPN_poss, nwell_hole );
_2_5V_BJT_COLL_NPN = not_interacting( _2_5V_BJT_COLL_NPN_poss1, sab_hole, 
    include_touch = ALL
);
_2_5V_BJT_BASE_NPN = _2_5V_BJT_COLL_NPN and DIFF25 not nxwell and nwell_hole;
_2_5V_BJT_EMIT_NPN = ( ( DIFN_BIP and DIFF25 ) and NPS ) not nxwell and nwell_hole;
CONTSB = and( CONTS, BJTDMY );
CONTS = not( CONTS, CONTSB );
/*Contacts for Vertical PNP*/
_1_0V_BJT_COLL_cont = _1_0V_BJT_COLL not nxwell and CONTSB;
_1_0V_BJT_BASE_cont = _1_0V_BJT_BASE and CONTSB and NPS;
_1_0V_BJT_EMIT_cont = and( _1_0V_BJT_EMIT, CONTSB );
_2_5V_BJT_COLL_cont = _2_5V_BJT_COLL not nxwell and CONTSB;
_2_5V_BJT_BASE_cont = _2_5V_BJT_BASE and CONTSB and NPS;
_2_5V_BJT_EMIT_cont = and( _2_5V_BJT_EMIT, CONTSB );
/*Contacts for Vertical NPN*/
_1_0V_BJT_COLL_cont_NPN = _1_0V_BJT_COLL_NPN and nxwell and CONTSB;
_1_0V_BJT_BASE_cont_NPN = _1_0V_BJT_BASE_NPN and CONTSB not NPS;
_1_0V_BJT_EMIT_cont_NPN = and( _1_0V_BJT_EMIT_NPN, CONTSB );
_2_5V_BJT_COLL_cont_NPN = _2_5V_BJT_COLL_NPN and nxwell and CONTSB;
_2_5V_BJT_BASE_cont_NPN = _2_5V_BJT_BASE_NPN and CONTSB not NPS;
_2_5V_BJT_EMIT_cont_NPN = and( _2_5V_BJT_EMIT_NPN, CONTSB );
/************************************ Lateral PNP Derivation ***************************//*Lateral PNP 1.8V*/
_T_E_M_P_4444L = interacting( BJTDMY, DIFN );
T_E_M_P_4L = interacting( _T_E_M_P_4444L, sab_hole, 
    include_touch = NONE
);
DIFN_BIPL = and( DIFN, T_E_M_P_4L );
TEMP_EC = and( DIFN_BIPL, PPS );
_T_E_M_P_43L = and( NWELL, T_E_M_P_4L );
nwell_ring = interacting( _T_E_M_P_43L, nwell_hole );
all_nwell_hole = or( nwell_ring, nwell_hole );
psub = not( psub, _T_E_M_P_43L );
_1_0V_BJT_BASE_possL = not( _T_E_M_P_43L, DIFF25 );
_T_E_M_P_44L = and( DIFN_BIPL, PPS );
_1_0V_BJT_BASEL = not_interacting( _1_0V_BJT_BASE_possL, nwell_hole, 
    include_touch = ALL
);
_1_0V_BJT_EMIT_possL = interacting( PPS, sab_hole );
_1_0V_BJT_EMITL_pos = not_interacting( _1_0V_BJT_EMIT_possL, nwell_hole, 
    include_touch = ALL
);
_1_0V_BJT_EMITL = not( _1_0V_BJT_EMITL_pos, DIFF25 );
_1_0V_BJT_COLL_possL = ( PPS not _1_0V_BJT_EMIT_possL ) and DIFN_BIPL not DIFF25 not
    nwell_ring and _T_E_M_P_43L;
_1_0V_BJT_COLLL = not_interacting( _1_0V_BJT_COLL_possL, nwell_hole, 
    include_touch = ALL
);
/*Lateral PNP 3.3V*/
_T_E_M_P_45L = and( nxwell, BJTDMY );
_2_5V_BJT_BASE_possL = and( _T_E_M_P_45L, DIFF25 );
_2_5V_BJT_COLL_possL = ( PPS not _1_0V_BJT_EMIT_possL ) and DIFN_BIPL not nwell_ring
    and DIFF25 and _T_E_M_P_43L;
_2_5V_BJT_COLLL = not_interacting( _2_5V_BJT_COLL_possL, nwell_hole, 
    include_touch = ALL
);
_2_5V_BJT_BASE_possL25 = and( _T_E_M_P_43L, DIFF25 );
_2_5V_BJT_BASEL = not_interacting( _2_5V_BJT_BASE_possL25, nwell_hole, 
    include_touch = ALL
);
_1_0V_BJT_EMIT_possL25 = and( _1_0V_BJT_EMIT_possL, DIFF25 );
_2_5V_BJT_EMITL = not_interacting( _1_0V_BJT_EMIT_possL25, nwell_hole, 
    include_touch = ALL
);
/*Lateral NPN 1.8V*/
_1_0V_BJT_EMIT_possL = interacting( NPS, sab_hole );
_1_0V_BJT_COLL_NPNL_poss1 = ( NPS not _1_0V_BJT_EMIT_possL ) and DIFN_BIPL;
_1_0V_BJT_COLL_NPNL_possL1 = not( _1_0V_BJT_COLL_NPNL_poss1, DIFF25 );
_1_0V_BJT_BASE_NPNL_possL1 = T_E_M_P_4L not DIFF25 and all_nwell_hole;
_1_0V_BJT_EMIT_NPNL_possL1 = not( _1_0V_BJT_EMIT_possL, DIFF25 );
_1_0V_BJT_EMIT_NPNL = interacting( _1_0V_BJT_EMIT_NPNL_possL1, nwell_hole, 
    include_touch = NONE
);
_1_0V_BJT_BASE_NPNL = interacting( _1_0V_BJT_BASE_NPNL_possL1, nwell_hole, 
    include_touch = NONE
);
_1_0V_BJT_COLL_NPNL = interacting( _1_0V_BJT_COLL_NPNL_possL1, nwell_hole, 
    include_touch = NONE
);
/*Lateral NPN 3.3V*/
_2_5V_BJT_COLL_NPNL_possL1 = and( _1_0V_BJT_COLL_NPNL_poss1, DIFF25 );
_2_5V_BJT_BASE_NPNL_possL1 = T_E_M_P_4L and DIFF25 and all_nwell_hole;
_2_5V_BJT_EMIT_NPNL_possL1 = and( _1_0V_BJT_EMIT_possL, DIFF25 );
_2_5V_BJT_EMIT_NPNL = interacting( _2_5V_BJT_EMIT_NPNL_possL1, nwell_hole, 
    include_touch = NONE
);
_2_5V_BJT_BASE_NPNL = interacting( _2_5V_BJT_BASE_NPNL_possL1, nwell_hole, 
    include_touch = NONE
);
_2_5V_BJT_COLL_NPNL = interacting( _2_5V_BJT_COLL_NPNL_possL1, nwell_hole, 
    include_touch = NONE
);
/*Contacts for Lateral PNP*//*BOOLEAN 1_0V_BJT_COLL NOT nxwell  AND CONTSB TEMP = 1_0V_BJT_COLL_cont
BOOLEAN 1_0V_BJT_BASE AND CONTSB AND NPS TEMP = 1_0V_BJT_BASE_cont
BOOLEAN 1_0V_BJT_EMIT AND CONTSB TEMP = 1_0V_BJT_EMIT_cont*/
_1_0V_BJT_COLL_contL = and( _1_0V_BJT_COLLL, CONTSB );
_1_0V_BJT_BASE_contL = _1_0V_BJT_BASEL and CONTSB and NPS;
_1_0V_BJT_EMIT_contL = _1_0V_BJT_EMITL and CONTSB and sab_hole;
_2_5V_BJT_COLL_contL = and( _2_5V_BJT_COLLL, CONTSB );
_2_5V_BJT_BASE_contL = _2_5V_BJT_BASEL and CONTSB and NPS;
_2_5V_BJT_EMIT_contL = _2_5V_BJT_EMITL and CONTSB and sab_hole;
/*Contacts for Lateral NPN*/
_1_0V_BJT_COLL_cont_NPNL = _1_0V_BJT_COLL_NPNL and nwell_hole and CONTSB;
_1_0V_BJT_BASE_cont_NPNL = _1_0V_BJT_BASE_NPNL and CONTSB not NPS;
_1_0V_BJT_EMIT_cont_NPNL = and( _1_0V_BJT_EMIT_NPNL, CONTSB );
_2_5V_BJT_COLL_cont_NPNL = _2_5V_BJT_COLL_NPNL and nwell_hole and CONTSB;
_2_5V_BJT_BASE_cont_NPNL = _2_5V_BJT_BASE_NPNL and CONTSB not NPS;
_2_5V_BJT_EMIT_cont_NPNL = and( _2_5V_BJT_EMIT_NPNL, CONTSB );
polyCont = and( CONTS, poly );
diffCont = not( CONTS, poly );
dnwCont = dnwell_hole and CONTS and DNWELL not emit_dnw_pnp_cont;
diffCont = not( diffCont, dnwCont );
/**************************************************************************//* Remove marker from metals */
metal1 = not( metal1, RMDMY );
/*************CONNECT SECTION FOR BJTS************************************/
GBL_cdb = connect(
       {{{ _1_0V_BJT_COLL, metal1 }, _1_0V_BJT_COLL_cont }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _2_5V_BJT_COLL, metal1 }, _2_5V_BJT_COLL_cont }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _1_0V_BJT_EMIT, metal1 }, _1_0V_BJT_EMIT_cont },
	   {{pdiode},pdiode},
	   {{pn18v_dio},pn18v_dio},
	   {{pn25v_dio},pn25v_dio},
	   {{pn33v_dio},pn33v_dio},
	   {{pdio_hvt},pdio_hvt},
	   {{pdio_lvt},pdio_lvt},
	   {{ndiode},ndiode},
	   {{np18v_dio},np18v_dio},
	   {{np25v_dio},np25v_dio},
	   {{np33v_dio},np33v_dio},
	   {{ndio_hvt},ndio_hvt},
	   {{ndio_lvt},ndio_lvt},
	   {{ndio_na_dio},ndio_na_dio},
	   {{ndio_na18v_dio},ndio_na18v_dio},
	   {{ndio_na25v_dio},ndio_na25v_dio},
	   {{ndio_na33v_dio},ndio_na33v_dio},
	   {{nwdiode_dio},nwdiode_dio},
	   {{nwdiode18_dio},nwdiode18_dio},
	   {{nwdiode25_dio},nwdiode25_dio},
	   {{nwdiode33_dio},nwdiode33_dio},
        {{ _2_5V_BJT_EMIT, metal1 }, _2_5V_BJT_EMIT_cont }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _1_0V_BJT_BASE, metal1 }, _1_0V_BJT_BASE_cont },
        {{ _2_5V_BJT_BASE, metal1 }, _2_5V_BJT_BASE_cont }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _1_0V_BJT_COLL_NPN, metal1 }, _1_0V_BJT_COLL_cont_NPN }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _1_0V_BJT_EMIT_NPN, metal1 }, _1_0V_BJT_EMIT_cont_NPN }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _1_0V_BJT_BASE_NPN, metal1 }, _1_0V_BJT_BASE_cont_NPN }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _2_5V_BJT_COLL_NPN, metal1 }, _2_5V_BJT_COLL_cont_NPN }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _2_5V_BJT_EMIT_NPN, metal1 }, _2_5V_BJT_EMIT_cont_NPN }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _2_5V_BJT_BASE_NPN, metal1 }, _2_5V_BJT_BASE_cont_NPN }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _1_0V_BJT_COLLL, metal1 }, _1_0V_BJT_COLL_contL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _1_0V_BJT_BASEL, metal1 }, _1_0V_BJT_BASE_contL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _1_0V_BJT_EMITL, metal1 }, _1_0V_BJT_EMIT_contL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _2_5V_BJT_COLLL, metal1 }, _2_5V_BJT_COLL_contL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _2_5V_BJT_BASEL, metal1 }, _2_5V_BJT_BASE_contL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _2_5V_BJT_EMITL, metal1 }, _2_5V_BJT_EMIT_contL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _1_0V_BJT_COLL_NPNL, metal1 }, _1_0V_BJT_COLL_cont_NPNL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _1_0V_BJT_EMIT_NPNL, metal1 }, _1_0V_BJT_EMIT_cont_NPNL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _1_0V_BJT_BASE_NPNL, metal1 }, _1_0V_BJT_BASE_cont_NPNL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _2_5V_BJT_COLL_NPNL, metal1 }, _2_5V_BJT_COLL_cont_NPNL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _2_5V_BJT_EMIT_NPNL, metal1 }, _2_5V_BJT_EMIT_cont_NPNL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ _2_5V_BJT_BASE_NPNL, metal1 }, _2_5V_BJT_BASE_cont_NPNL }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ base_dnw_pnp, metal1 }, base_dnw_pnp_cont }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ emit_dnw_pnp, metal1 }, emit_dnw_pnp_cont }}
);
subtie = not( subtie, NWELL );
/**************************************************************************/
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ coll_dnw_pnp }, psub },
        {{ coll_dnw_pnp }, subtie },
        {{ dnwdiode_pwell }, subtie },
        {{ dnwdiode_nwell }, welltie },
        {{ tiod, tndiff, tndiff18, tndiff33 }, nodcon },
        {{ pvardio, tiod, tpdiff }, podcon },
        {{ metal1, subtie, varndiff, varndiff25, tndiff, tndiff18, tndiff33 }, diffCont },
        {{ metal1, poly }, polyCont },
        {{ metal1, welltie, tpdiff, varpdiff, varpdiff25 }, diffCont },
        {{ tndiff_dnwell, tndiff_dnwell25, tpdiff_dnwell, metal1 }, dnwCont },
        {{ ngate, hngate, mngate, lngate, mngate25, ngate25, ngate18, ngate33, natgate, natgate25, natgate18, natgate33, varngate, varnpoly, varngate25, ngate_dnwell, ngate_dnwell25 }, poly },
        {{ pgate, hpgate, lpgate, mpgate, pgate25, pgate18, pgate33, varpgate, varppoly, varpgate25 }, poly },
        {{ rpdiff_term, resndiff, metal1 }, diffCont },
        {{ rpdiff_term_nS, resndiff_nS, metal1 }, diffCont },
        {{ hrpoly_term_NP, hrpoly_term_PP, metal1 }, polyCont },
        {{ mom_cap_123_term }, M3S },
        {{ mom_cap_1234_term }, M4S },
        {{ mom_cap_234_term }, M4S },
        {{ RTERMARKER }, polyCont }}
);
/*
C_THRU welltie INSIDE nxwell_NWDIODE { SCON_MODE=TRUE } TEMP = nxwell_NWDIODE_scon
C_THRU welltie INSIDE nxwell_NWDIODE18 { SCON_MODE=TRUE } TEMP = nxwell_NWDIODE18_scon
C_THRU welltie INSIDE nxwell_NWDIODE25 { SCON_MODE=TRUE } TEMP = nxwell_NWDIODE25_scon
C_THRU welltie INSIDE nxwell_NWDIODE33 { SCON_MODE=TRUE } TEMP = nxwell_NWDIODE33_scon

CONNECT{
      welltie nxwell_NWDIODE BY nxwell_NWDIODE_scon
	nxwell BY welltie
       }
CONNECT{
      welltie nxwell_NWDIODE18 BY nxwell_NWDIODE18_scon
	nxwell BY welltie
       }

CONNECT{
      welltie nxwell_NWDIODE25 BY nxwell_NWDIODE25_scon
	nxwell BY welltie
       }
CONNECT{
      welltie nxwell_NWDIODE33 BY nxwell_NWDIODE33_scon
	nxwell BY welltie
       }
*/
welltie_NWDIODE = interacting( welltie, nxwell_NWDIODE );
welltie_NWDIODE18 = interacting( welltie, nxwell_NWDIODE18 );
welltie_NWDIODE25 = interacting( welltie, nxwell_NWDIODE25 );
welltie_NWDIODE33 = interacting( welltie, nxwell_NWDIODE33 );
nxwell_scon = copy( welltie );
nxwell_NWDIODE_scon = copy( welltie_NWDIODE );
nxwell_NWDIODE18_scon = copy( welltie_NWDIODE18 );
nxwell_NWDIODE25_scon = copy( welltie_NWDIODE25 );
nxwell_NWDIODE33_scon = copy( welltie_NWDIODE33 );
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ welltie, nxwell }, nxwell_scon },
        {{ welltie, nxwell_NWDIODE }, nxwell_NWDIODE_scon },
        {{ welltie, nxwell_NWDIODE18 }, nxwell_NWDIODE18_scon },
        {{ welltie, nxwell_NWDIODE25 }, nxwell_NWDIODE25_scon },
        {{ welltie, nxwell_NWDIODE33 }, nxwell_NWDIODE33_scon }}
);
subtie_scon = copy( subtie );
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ subtie, psub }, subtie_scon }
	   }
);
top_metex = not( top_met, induct_body );
top_metex = not( top_metex, RMDMY );
sec_top_met = not( sec_top_met, RMDMY );
third_top_met =   third_top_met not RMDMY;
fourth_top_met =   fourth_top_met not RMDMY;
fifth_top_met =   fifth_top_met not RMDMY;
sixth_top_met =   sixth_top_met not RMDMY;
seventh_top_met =   seventh_top_met not RMDMY;
eighth_top_met =   eighth_top_met not RMDMY;

GBL_cdb = incremental_connect( GBL_cdb,
{{{ metal1, metal2}, by_layer = V1S}, {{ metal2, metal3}, by_layer = V2S}, {{ metal3, metal4}, by_layer = V3S}, {{ metal4, metal5}, by_layer = V4S}, {{ metal5, metal6}, by_layer = V5S}, {{ metal6, metal7}, by_layer = V6S}, {{ metal1, eighth_top_met}, by_layer = V1S}, {{ sec_top_met, third_top_met}, by_layer = sec_top_via}, {{ third_top_met, fourth_top_met}, by_layer = third_top_via}, {{ fourth_top_met, fifth_top_met}, by_layer = fourth_top_via}, {{ fifth_top_met, sixth_top_met}, by_layer = fifth_top_via}, {{ sixth_top_met, seventh_top_met}, by_layer = sixth_top_via}, {{ seventh_top_met, eighth_top_met}, by_layer = seventh_top_via}}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ top_metex, sec_top_met }, top_via },
        {{ top_metex, CAP_MIMS }, cap_top_via }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ top_metex, CAP_MIMS }, CTM_VIA }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ top_metex, CBM }, CBM_VIA }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ pinshield }, M1S }}
);
	   /*************New Connect Database *************/
rpolywo_nS = outside( rpolywo1, SAB );
rpolywo_nS_b = interacting( rpolywo_nS, p1rdum );
rnpolywo_nS = ( rpolywo_nS_b and NPS ) not SAB;
rppolywo_nS = ( rpolywo_nS_b and PPS ) not SAB;
/* SECTION FOR selecting psub and nwell body */
hrpoly_nxwell = interacting( hrpoly, nxwell );
hrpoly_psub = outside( hrpoly, nxwell );
hrppoly_nxwell = interacting( hrppoly, nxwell );
hrppoly_psub = outside( hrppoly, nxwell );
rppolywo_nS_nxwell = interacting( rppolywo_nS, nxwell );
rppolywo_nS_psub = outside( rppolywo_nS, nxwell );
rppolywo_r_nxwell = interacting( rppolywo_r, nxwell );
rppolywo_r_psub = outside( rppolywo_r, nxwell );
rnpolywo_r_nxwell = interacting( rnpolywo_r, nxwell );
rnpolywo_r_psub = outside( rnpolywo_r, nxwell );
rnpolywo_nS_nxwell = interacting( rnpolywo_nS, nxwell );
rnpolywo_nS_psub = outside( rnpolywo_nS, nxwell );
/*********************************************/
/********** Serpentine Data Creation **********/
/* rpoly */
rpolywo1 = and( POLS, RMARKER );
pres_2 = not( rpolywo1, HRPOLY );
pres_1 = outside( pres_2, SAB );
pres = not( pres_1, RTERMARKER );
pres_norf = not( pres, RFDMY );
/* rpolyh */
presh_1 = POLS and HRPOLY not SAB;
presh = not( presh_1, PPS );
presh_norf = not( presh, RFDMY );
preshterm = and( presh_1, PPS );
/* rpolyrf */
pres_rf_device = enclosing( RFDMY, pres );
/* rpolyhrf */
presh_norf = not( presh, RFDMY );
presh_rf_device = enclosing( RFDMY, presh );
/* rpolyc - 3 terminal rpoly Serp res */
pres_norf_subdef = and( pres_norf, PINDMY );
/* rpolyhc - 3 term rpolyh resistor */
presh_norf_subdef = and( presh_norf, PINDMY );
/*********************************************/

rnpoly3t_poly_ : polygon_layer;
rnpoly3t_poly : polygon_layer;
rppoly3t_poly_ : polygon_layer;
rppoly3t_poly : polygon_layer;
rnpoly_poly_ : polygon_layer;
rnpoly_poly : polygon_layer;
rppoly_poly_ : polygon_layer;
rppoly_poly : polygon_layer;
if( RES_3TERM == 1 ) {
rnpoly3t_poly_ = interacting( POLS, rnpolywo_r_psub );
rnpoly3t_poly = not( rnpoly3t_poly_, rnpolywo_r_psub );

rppoly3t_poly_ = interacting( POLS, rppolywo_r_psub );
rppoly3t_poly = not( rppoly3t_poly_, rppolywo_r_psub );
} else {
rnpoly_poly_ = interacting( POLS, rnpolywo_r );
rnpoly_poly = not( rnpoly_poly_, rnpolywo_r );

rppoly_poly_ = interacting( POLS, rppolywo_r );
rppoly_poly = not( rppoly_poly_, rppolywo_r );
}

GBL_cdb = incremental_connect( GBL_cdb,
       {{{ preshterm }, polyCont }}
);

if( RES_3TERM == 1 ) {
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ metal1, rnpoly3t_poly }, polyCont }}
);
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ metal1, rppoly3t_poly }, polyCont }}
);
} else {
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ metal1, rnpoly_poly }, polyCont }}
	   );
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ metal1, rppoly_poly }, polyCont }}
	   );
}
GBL_cdb = incremental_connect( GBL_cdb,
       {{{ metal1 }, M1PIN },
        {{ metal2 }, M2PIN },
        {{ metal3 }, M3PIN },
        {{ metal4 }, M4PIN },
	{{ metal5 }, M5PIN },
        {{ metal6 }, M6PIN },
        {{ metal7 }, M7PIN },
        {{ metal8 }, M8PIN },
	{{ metal9 }, M9PIN },
        {{ POLS }, POLYPIN },
        {{ poly }, POLYPIN }}
);
GBL_cdb_text_temp = text_net (
	connect_sequence = GBL_cdb,
	text_layer_items =  {{metal1,M1S_TEXT},
		{metal2,M2S_TEXT},
		{metal3,M3S_TEXT},
		{metal4,M4S_TEXT},
		{metal5,M5S_TEXT},
		{metal6,M6S_TEXT},
		{metal7,M7S_TEXT},
		{metal8,M8S_TEXT},
		{metal9,M9S_TEXT},
		{poly,POLS_TEXT},
		{POLS ,POLS_TEXT}
	},
	use_text = ALL,
	attach_text = ALL,
	opens = IGNORE
	
);
GBL_cdb_text = create_ports (GBL_cdb_text_temp, {{metal1,M1PIN},{metal2,M2PIN},{metal3,M3PIN},{metal4,M4PIN},{POLS,POLYPIN},{poly,POLYPIN}});
/***************** Remote functions ******************/
/*NMOS/PMOS*/
width_length_fn : entrypoint function (void) returning void {
	calc_mos_properties();
	Wid1 :double = mos_width_1();
	Wid2 :double = mos_width_2();
/*	w : double = (Wid1 + Wid2 ) / 2.0 ;*/ w = mos_width_avg();
	GArea : double = mos_gate_area();
	l	: double = mos_length_avg();
	dev_save_double_properties (
	{{"w",w},{"l",l}}
	);
}
/*Resistor*/
resis_fn :entrypoint function (void) returning void {
	calc_resistor_properties();
	w : double = res_width_avg();
	l : double  = res_length_avg();
	dev_save_double_properties (
	{{"w",w},{"l",l}}
	);

}
resis_fn2 : entrypoint function (void) returning void {
	calc_resistor_properties();
	Lavg : double = res_length_avg();
	w : double = res_area()/Lavg;
	L_45 :double = res_length_num_45();
	L_90 : double = res_length_num_90();
	l = Lavg - (w * L_45 * 0.168) - (w * L_90 * 0.5); 
	dev_save_double_properties (
	{{"w",w},{"l",l}}
	);
}
/*Cap*/
len_wid_cap_fn : entrypoint function (void) returning void {
	l :double = cap_length();
	w : double = cap_width();
	cval : double = cap_area() * cap_area_capval();
	dev_save_double_properties (
	{{"w",w},{"l",l},{"cval",cval}}
	);
}
cap_len_wid_fn : entrypoint function (void) returning void {
	len = cap_length();
	wid = cap_area()/len;
	dev_save_double_properties (
	{{"wid",wid},{"len",len}}
	);
}
ind_gen_fn : entrypoint function (void) returning void {
	calc_inductor_properties();
	
	tu : double = ind_turn();
	ro_tur : double= round(tu);
	tu_diff :double = tu - ro_tur ;
	space :double = ind_space();
	D : double;
	if (dbleq(tu,1) || dbllt(tu,1.0)) {
	    D = ind_bbox_width() - (2*tu*ind_width());
	    space = 0;
	}
	if ( dblgt(tu,1.0) && dbleq(tu_diff,0)) {
	    D = ind_bbox_width() - (2*tu*ind_width()) - (2*(tu-1)*ind_space());
	}
	if ( dblgt(tu,1) && dbleq(tu_diff,0.25)) {
	    D = ind_bbox_width() - (2*ro_tur*ind_width()) - (2*(ro_tur-1)*ind_space()) - ind_width() - ind_space();
	}
	if ( dblgt(tu,1) && dbleq(tu_diff, 0.5) ) {
	    D = ind_bbox_width() - (2*ro_tur*ind_width()) - (2*(ro_tur-2)*ind_space()) - ind_width() - ind_space();
	}	
	if ( dblgt(tu,1) && dbleq(tu_diff, -0.25) ) {
	    D = ind_bbox_width() - (2*ro_tur*ind_width()) - (2*(ro_tur-1)*ind_space());
	}
	S = space;
	N = tu;
	R = D/2;
	dev_save_double_properties (
	{{"R",R},{"S",S},{"N",N}}
	);
}
/*GenDev*/
gendev_INDSYMCT_fn : entrypoint function (void) returning void {
	proc_0 : polygon_set = dev_processing_layer(0);
	proc_1 : polygon_set = dev_processing_layer(1);
	proc_2 : polygon_set = dev_processing_layer(2);
	body : polygon_set = dev_body();
	pinb : polygon_set = dev_pin("MINUS");
	
	N = dev_count_polygons (proc_0);
	w = dev_touch_length (body,pinb);
	S =  2 * dev_polygon_area(proc_1) / dev_touch_length(proc_1,body);
	R = ((dev_polygon_perim(proc_2)/16)/0.4142);
	dev_save_double_properties (
	{{"R",R},{"S",S},{"N",N},{"w",w}}
	);	
}
gendev_cmom_fn : entrypoint function (void) returning void {
	mom_field1 : polygon_set = dev_processing_layer(0);
	mom_field2 : polygon_set = dev_processing_layer(1);
	f_reg1 : polygon_set = dev_processing_layer(2);
	mom_cap :polygon_set = dev_body();
	NV = dev_count_polygons (mom_field1);
	NH = dev_count_polygons (mom_field2);
	Width = dev_touch_length (mom_field2,mom_cap) / NH;
	spacing = abs(((dev_polygon_perim(f_reg1) -  (2* dev_touch_length(f_reg1,mom_field1)))/20)/(NV-1));
	STARTMETAL = 1;
	endmetal = 3 ;
	dev_save_double_properties (
	{{"spacing",spacing},{"Width",Width},{"STARTMETAL",STARTMETAL},{"endmetal",endmetal},{"NV",NV},{"NH",NH}}
	);	
}

gendev_cmom1234_fn : entrypoint function (void) returning void {
	mom_field1 : polygon_set = dev_processing_layer(0);
	mom_field2 : polygon_set = dev_processing_layer(1);
	f_reg1 : polygon_set = dev_processing_layer(2);
	mom_cap :polygon_set = dev_body();
	NV = dev_count_polygons (mom_field1);
	NH = dev_count_polygons (mom_field2);
	Width = dev_touch_length (mom_field2,mom_cap) / NH;
	spacing = abs(((dev_polygon_perim(f_reg1) -  (2* dev_touch_length(f_reg1,mom_field1)))/2)/(NV-1));
	STARTMETAL = 1;
	endmetal = 3 ;
	dev_save_double_properties (
	{{"spacing",spacing},{"Width",Width},{"STARTMETAL",STARTMETAL},{"endmetal",endmetal},{"NV",NV},{"NH",NH}}
	);	
}

gendev_cmom234_fn : entrypoint function (void) returning void {
	mom_field1 : polygon_set = dev_processing_layer(0);
	mom_field2 : polygon_set = dev_processing_layer(1);
	f_reg1 : polygon_set = dev_processing_layer(2);
	mom_cap :polygon_set = dev_body();
	NV = dev_count_polygons (mom_field1);
	NH = dev_count_polygons (mom_field2);
	Width = dev_touch_length (mom_field2,mom_cap) / NH;
	spacing = abs(((dev_polygon_perim(f_reg1) -  (2* dev_touch_length(f_reg1,mom_field1)))/2)/(NV-1));
	STARTMETAL =2;
	endmetal = 3 ;
	dev_save_double_properties (
	{{"spacing",spacing},{"Width",Width},{"STARTMETAL",STARTMETAL},{"endmetal",endmetal},{"NV",NV},{"NH",NH}}
	);	
}
gendev_count_perim_fn : entrypoint function (void) returning void {
	jvarp_rf : polygon_set = dev_processing_layer(0);
	w_fac : polygon_set = dev_processing_layer(1);
	NR : double = dev_count_polygons(jvarp_rf);
	wr : double = dev_touch_length(jvarp_rf,w_fac)/(2*NR);
	dev_save_double_properties (
	{{"NR",NR},{"wr",wr}}
	);	
	
}
gendev_count_area_fn : entrypoint function (void) returning void {
	pvardio_set : polygon_set = dev_body();
	N : double = dev_count_devices(pvardio_set);
	A : double = dev_polygon_area(pvardio_set);
	dev_save_double_properties (
	{{"N",N},{"A",A}}
	);	
}
gen_area_perim_fn : entrypoint function (void) returning void {
	proc_0 = dev_processing_layer(0);
	DPerim : double = dev_polygon_perim(proc_0);
	DArea : double = dev_polygon_area(proc_0);
	dev_save_double_properties (
	{{"DPerim",DPerim},{"DArea",DArea}}
	);	
} 
lateral_bjt : entrypoint function (void) returning void {
	area : double = bjt_emitter_area();
	dev_save_double_properties ({{"area",area}});

}
/********* Device Extraction ************/
all_devices = init_device_matrix (GBL_cdb_text);
nmos (
	matrix = all_devices ,
	device_name = "N",
	gate = ngate,
	source = tndiff,
	drain = tndiff,
	optional_pins = {{psub/*,pin_compared = false*/}}
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	,property_function = width_length_fn
	,schematic_devices ={{"N",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "N25",
	gate = ngate25,
	source = tndiff,
	drain = tndiff,
	optional_pins = {{psub/*,pin_compared = false*/}}
	/*,properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"N25",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "NM25",
	gate = mngate25,
	source = tndiff,
	drain = tndiff,
	optional_pins = {{psub/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"NM25",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "NL",
	gate = lngate,
	source = tndiff,
	drain = tndiff,
	optional_pins = {{psub/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"NL",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "NH",
	gate = hngate,
	source = tndiff,
	drain = tndiff,
	optional_pins = {{psub/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"NH",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "NM",
	gate = mngate,
	source = tndiff,
	drain = tndiff,
	optional_pins = {{psub/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"NM",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "N18",
	gate = ngate18,
	source = tndiff18,
	drain = tndiff18,
	optional_pins = {{psub/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"N18",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "N33",
	gate = ngate33,
	source = tndiff33,
	drain = tndiff33,
	optional_pins = {{psub/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"N33",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "NDN",
	gate = ngate_dnwell,
	source = tndiff_dnwell,
	drain = tndiff_dnwell,
	optional_pins = {{emit_dnw_pnp}},
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	property_function = width_length_fn,
	schematic_devices ={{"N",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "NDN25",
	gate = ngate_dnwell25,
	source = tndiff_dnwell25,
	drain = tndiff_dnwell25,
	optional_pins = {{emit_dnw_pnp}},
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	schematic_devices ={{"N25",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "NA",
	gate = natgate,
	source = tndiff,
	drain = tndiff,
	optional_pins = {{psub/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"NA",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "NA25",
	gate = natgate25,
	source = tndiff,
	drain = tndiff,
	optional_pins = {{psub/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"NA25",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "NA18",
	gate = natgate18,
	source = tndiff,
	drain = tndiff,
	optional_pins = {{psub/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"NA18",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
nmos (
	matrix = all_devices ,
	device_name = "NA33",
	gate = natgate33,
	source = tndiff,
	drain = tndiff,
	optional_pins = {{psub/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"NA33",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
/* PMOS definitions */
pmos (
	matrix = all_devices ,
	device_name = "P",
	gate = pgate,
	source = tpdiff,
	drain = tpdiff,
	optional_pins = {{nxwell/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"P",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
pmos (
	matrix = all_devices ,
	device_name = "PL",
	gate = lpgate,
	source = tpdiff,
	drain = tpdiff,
	optional_pins = {{nxwell/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"PL",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
pmos (
	matrix = all_devices ,
	device_name = "PM",
	gate = mpgate,
	source = tpdiff,
	drain = tpdiff,
	optional_pins = {{nxwell/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"PM",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
pmos (
	matrix = all_devices ,
	device_name = "PH",
	gate = hpgate,
	source = tpdiff,
	drain = tpdiff,
	optional_pins = {{nxwell/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"PH",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
pmos (
	matrix = all_devices ,
	device_name = "P25",
	gate = pgate25,
	source = tpdiff,
	drain = tpdiff,
	optional_pins = {{nxwell/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"P25",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
pmos (
	matrix = all_devices ,
	device_name = "P18",
	gate = pgate18,
	source = tpdiff,
	drain = tpdiff,
	optional_pins = {{nxwell/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"P18",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
pmos (
	matrix = all_devices ,
	device_name = "P33",
	gate = pgate33,
	source = tpdiff,
	drain = tpdiff,
	optional_pins = {{nxwell/*,pin_compared = false*/ }}
	/*properties = {{"Wid",DOUBLE},{"Len",DOUBLE}*/
	/*VVK - OPTION mos_multiterm_extract=TRUE  */
	/*property_function = width_length_fn*/
	,schematic_devices ={{"P33",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);

/********** RESISTOR EXTRACTION **********/

resistor (all_devices,"rm1",rm1_body,metal1,metal1,
	resistor_value = 0.115,
	x_card = true,
	schematic_devices = {{ device_name = "rm1",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}}

);
resistor (all_devices,"rm2",rm2_body,eighth_top_met,eighth_top_met,
	resistor_value = 0.086,
	x_card = true,
		schematic_devices = {{ device_name = "rm2",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}}
);
resistor (all_devices,"rm3",rm3_body,seventh_top_met,seventh_top_met,
	resistor_value = 0.086,
	x_card = true,
			schematic_devices = {{ device_name = "rm3",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}}

);
resistor (all_devices,"rm4",rm4_body,sixth_top_met,sixth_top_met,
	resistor_value = 0.086,
	x_card = true,
				schematic_devices = {{ device_name = "rm4",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}}

);
resistor (all_devices,"rm5",rm5_body,fifth_top_met,fifth_top_met,
	resistor_value = 0.086,
	x_card = true,
				schematic_devices = {{ device_name = "rm5",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}}

);
resistor (all_devices,"rm6",rm6_body,fourth_top_met,fourth_top_met,
	resistor_value = 0.086,
	x_card = true,
				schematic_devices = {{ device_name = "rm6",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}}

);
resistor (all_devices,"rm7",rm7_body,third_top_met,third_top_met,
	resistor_value = 0.086,
	x_card = true,
				schematic_devices = {{ device_name = "rm7",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}}

);
resistor (all_devices,"rm8",rm8_body,sec_top_met,sec_top_met,
	resistor_value = 0.086,
	x_card = true,
				schematic_devices = {{ device_name = "rm8",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}}

);
resistor (all_devices,"rmt",rm9_body,top_metex,top_metex,
	resistor_value = 0.04,
	x_card = true,
				schematic_devices = {{ device_name = "rmt",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}}

);
if( RES_3TERM == 1 ) {
resistor (all_devices,"rnpoly_3t_psub",rnpolywo_r_psub,
	rnpoly3t_poly,rnpoly3t_poly,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "rnpoly_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"rnpolyS_3t_psub",rnpolywo_nS_psub,
	poly,poly,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "rnpolyS_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",optional_pins = {"BULK"},ignore_pins = {"BULK"} }}
);
resistor (all_devices,"rppoly_3t_psub",rppolywo_r_psub,
	rppoly3t_poly,rppoly3t_poly,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "rppoly_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"rppolyS_3t_psub",rppolywo_nS_psub,
	poly,poly,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "rppolyS_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"hrnpoly_3t_psub",hrpoly_psub,
	hrpoly_term_NP,hrpoly_term_NP,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "hrnpoly_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"hrppoly_3t_psub",hrppoly_psub,
	hrpoly_term_PP,hrpoly_term_PP,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "hrppoly_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"rnpoly_3t_nw",rnpolywo_r_nxwell,
	poly,poly,
	{{nxwell}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "rnpoly_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"rnpolyS_3t_nw",rnpolywo_nS_nxwell,
	poly,poly,
	{{nxwell}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "rnpolyS_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
/**/
resistor (all_devices,"rppoly_3t_nw",rppolywo_r_nxwell,
	poly,poly,
	{{nxwell}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "rppoly_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
	);
resistor (all_devices,"rppolyS_3t_nw",rppolywo_nS_nxwell,
	poly,poly,
	{{nxwell}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "rppolyS_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
/**/
resistor (all_devices,"hrnpoly_3t_nw",hrpoly_nxwell,
	hrpoly_term_NP,hrpoly_term_NP,
	{{nxwell}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "hrnpoly_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"hrppoly_3t_nw",hrppoly_nxwell,
	hrpoly_term_PP,hrpoly_term_PP,
	{{nxwell}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "hrppoly_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"rndiff_3t",rdiff_res,
	resndiff,resndiff,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
		schematic_devices = {{ device_name = "rndiff_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}

);
resistor (all_devices,"rndiffS_3t",rdiff_res_nS,
	resndiff_nS,resndiff_nS,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
		schematic_devices = {{ device_name = "rndiffS_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"rpdiff_3t",rpdiff,
	rpdiff_term,rpdiff_term,
	optional_pins = {{nxwell}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
		schematic_devices = {{ device_name = "rpdiff_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"rpdiffS_3t",rpdiff_nS,
	rpdiff_term_nS,rpdiff_term_nS,
	{{nxwell}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
	schematic_devices = {{ device_name = "rpdiffS_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}

);
resistor (all_devices,"rnwell_3t",nwsti_r,
	nxwell,nxwell,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
		schematic_devices = {{ device_name = "rnwell_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"rnwdiff_3t",nwdiff_r,
	nxwell,nxwell,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn,
		schematic_devices = {{ device_name = "rnwdiff_3t",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
/* Serpentine 3 terminal extraction */
resistor (all_devices,"rpolyc",pres_norf_subdef,
	RTERMARKER,RTERMARKER,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn2,
		schematic_devices = {{ device_name = "rpolyc",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}
);
resistor (all_devices,"rpolyhc",presh_norf_subdef,
	preshterm,preshterm,
	{{psub}},
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn2,
		schematic_devices = {{ device_name = "rpolyhc",terminal_a = "PLUS",
					terminal_b = "MINUS",
					optional_pins = {"BULK"},
					ignore_pins = {"BULK"} }}

);

} else {
resistor (all_devices,"rnpoly",rnpolywo_r,
	rnpoly_poly,rnpoly_poly,
	resistor_value = 402.10,
	x_card = true,
		schematic_devices = {{ device_name = "rnpoly",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
);

resistor (all_devices,"rnpolyS",rnpolywo_nS,
	poly,poly,
	resistor_value = 20,
	x_card = true,
		schematic_devices = {{ device_name = "rnpolyS",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
	);
	
resistor (all_devices,"rppoly",rppolywo_r,
	rppoly_poly,rppoly_poly,
	resistor_value = 390,
	x_card = true,
			schematic_devices = {{ device_name = "rppoly",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
	);
resistor (all_devices,"rppolyS",rppolywo_nS,
	poly,poly,
	resistor_value = 15,
	x_card = true,
		schematic_devices = {{ device_name = "rppolyS",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
	);

resistor (all_devices,"hrnpoly",hrpoly,
	hrpoly_term_NP,hrpoly_term_NP,
	resistor_value = 700,
	x_card = true,
	schematic_devices = {{ device_name = "hrnpoly",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
	);
resistor (all_devices,"hrppoly",hrppoly,
	hrpoly_term_PP,hrpoly_term_PP,
	resistor_value = 800,
	x_card = true,
	schematic_devices = {{ device_name = "hrppoly",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
	);
resistor (all_devices,"rndiff",rdiff_res,
	resndiff,resndiff,
	resistor_value = 10.5,
	x_card = true,
		schematic_devices = {{ device_name = "rndiff",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
	);
resistor (all_devices,"rndiffS",rdiff_res_nS,
	resndiff_nS,resndiff_nS,
	resistor_value = 25,
	x_card = true,
			schematic_devices = {{ device_name = "rndiffS",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
	);
resistor (all_devices,"rpdiff",rpdiff,
	rpdiff_term,rpdiff_term,
	resistor_value = 40,
	x_card = true,
			schematic_devices = {{ device_name = "rpdiff",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
	);
resistor (all_devices,"rpdiffS",rpdiff_nS,
	rpdiff_term_nS,rpdiff_term_nS,
	resistor_value = 30,
	x_card = true,
			schematic_devices = {{ device_name = "rpdiffS",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
	);
resistor (all_devices,"rnwell",nwsti_r,
	nxwell,nxwell,
	resistor_value = 330,
	x_card = true,
			schematic_devices = {{ device_name = "rnwell",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
	);
resistor (all_devices,"rnwdiff",nwdiff_r,
	nxwell,nxwell,
	resistor_value = 550,
	x_card = true,
			schematic_devices = {{ device_name = "rnwdiff",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
	);
/************** Serperntine Resistors Extraction - 2term ***********/  
resistor (all_devices,"rpoly",pres_norf,
	RTERMARKER,RTERMARKER,
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn2,
			schematic_devices = {{ device_name = "rpoly",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
);

resistor (all_devices,"rpolyh",presh_norf,
	preshterm,preshterm,
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn2,
			schematic_devices = {{ device_name = "rpolyh",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
);

resistor (all_devices,"rpolyrf",pres_rf_device,
	RTERMARKER,RTERMARKER,
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn2,
			schematic_devices = {{ device_name = "rpolyrf",terminal_a = "PLUS",
					terminal_b = "MINUS" }}
);

resistor (all_devices,"rpolyhrf",presh_rf_device,
	preshterm,preshterm,
	x_card = true,
	properties = {{"w",DOUBLE},{"l",DOUBLE}},
	property_function = resis_fn2,
			schematic_devices = {{ device_name = "rpolyhrf",terminal_a = "PLUS",
					terminal_b = "MINUS" }}

);



}
if( DRAWCBM == 0 ) {
/********** MIMCAP EXTRACTION **********/
if (CAP_3TERM == 0 ) {
	capacitor (all_devices,"cmim_2t",RCTM,CAP_MIMS,sec_top_met,
		area_capval = 1.0274e-15 ,
		perim_capval = 0.1685e-15 ,
		properties = {{"l",DOUBLE},{"w",DOUBLE},{"cval",DOUBLE}},
		x_card = true,
		property_function = len_wid_cap_fn,
				schematic_devices = {{ device_name = "cmim_2t",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}}
		);
} else {
	capacitor (all_devices,"cmim_3t",RCTM,CAP_MIMS,sec_top_met,
	{{pinshield}},
		area_capval = 1.0274e-15 ,
		perim_capval = 0.1685e-15 ,
		properties = {{"l",DOUBLE},{"w",DOUBLE},{"cval",DOUBLE}},
		/* CAP_BULK_INTERACT=TRUE */ bulk_relationship = INTERACT,
		x_card = true,
		property_function = len_wid_cap_fn,
		schematic_devices = {{ device_name = "cmim_3t",
						terminal_a = "PLUS",
						terminal_b = "MINUS",
						optional_pins = {"BULK"},
						ignore_pins = {"BULK"}}}
		);

}
} else {
if (CAP_3TERM == 0 ) {
	capacitor (all_devices,"cmim_2t",RCTM,CAP_MIMS,CBM,
		area_capval = 1.0274e-15 ,
		perim_capval = 0.1685e-15 ,
		properties = {{"l",DOUBLE},{"w",DOUBLE},{"cval",DOUBLE}},
		x_card = true,
		property_function = len_wid_cap_fn,
						schematic_devices = {{ device_name = "cmim_2t",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}}
		);
} else {
	capacitor (all_devices,"cmim_3t",RCTM,CAP_MIMS,CBM,{{pinshield,pin_type = TERMINAL}},
		area_capval = 1.0274e-15 ,
		perim_capval = 0.1685e-15 ,
		properties = {{"l",DOUBLE},{"w",DOUBLE},{"cval",DOUBLE}},
		/* CAP_BULK_INTERACT=TRUE */ bulk_relationship = INTERACT,
/*		x_card = true,*/
		property_function = len_wid_cap_fn,
		schematic_devices = {{ device_name = "cmim_3t",
						terminal_a = "PLUS",
						terminal_b = "MINUS",
						optional_pins = {"BULK"},
						ignore_pins = {"BULK"}}}
		);
}
}
/********** DIODE EXTRACTION **********/
pn (all_devices,"PN",pdiode,tpdiff,nxwell);
pn (all_devices,"PN18V",pn18v_dio,tpdiff,nxwell);
pn (all_devices,"PN25V",pn25v_dio,tpdiff,nxwell);
pn (all_devices,"PN33V",pn33v_dio,tpdiff,nxwell);
pn (all_devices,"PN_HVT",pdio_hvt,tpdiff,nxwell);
pn (all_devices,"PN_LVT",pdio_lvt,tpdiff,nxwell);
/* N-type diffusion diode */
np (all_devices,"NP",ndiode,psub,tndiff);
np (all_devices,"NP18V",np18v_dio,psub,tndiff);
np (all_devices,"NP25V",np25v_dio,psub,tndiff);
np (all_devices,"NP33V",np33v_dio,psub,tndiff);
np (all_devices,"NP_HVT",ndio_hvt,psub,tndiff);
np (all_devices,"NP_LVT",ndio_lvt,psub,tndiff);

np (all_devices,"NP_NA",ndio_na_dio,psub,tndiff);
np (all_devices,"NP_NA18V",ndio_na18v_dio,psub,tndiff);
np (all_devices,"NP_NA25V",ndio_na25v_dio,psub,tndiff);
np (all_devices,"NP_NA33V",ndio_na33v_dio,psub,tndiff);

/* well diode */
np (all_devices,"NWDIO",nwdiode_dio,psub,nxwell_NWDIODE);
np (all_devices,"NWDIO18V",nwdiode18_dio,psub,nxwell_NWDIODE18);
np (all_devices,"NWDIO25V",nwdiode25_dio,psub,nxwell_NWDIODE25);
np (all_devices,"NWDIO33V",nwdiode33_dio,psub,nxwell_NWDIODE33);
/********** Deep Nwell Diode Extraction******/
/*
DEVICE DNWDIODE dnwdiode_pwell dnwdiode_nwell psub {
    DEVICE_PREFIX=X
    CREATE_DEFAULT_PROPERTIES = FALSE
    PROPERTY = {area,pj};
    PROCESSING_LAYERS = {dnwdiode_pwell1};
    area = AREA(dnwdiode_pwell1);
    pj   = PERIM(dnwdiode_pwell1);
} temp = dev_dnwdio_dev

*/
gendev (all_devices,"DNWDIODE",dnwdiode_pwell,
		 {{dnwdiode_pwell , "PW"},{dnwdiode_nwell,"DNW"},{psub,"PSUB"}}, /* VVK - option DEVICE_PREFIX=X */
		 /*VVK - option CREATE_DEFAULT_PROPERTIES = FALSE*/
		 properties = {{"DArea",DOUBLE},{"DPerim",DOUBLE}},
		 processing_layers = {dnwdiode_pwell1},
		 property_function = gen_area_perim_fn,
		 schematic_devices = {{"DNWDIODE",ignore_pins = {"PSUB"}}}
		 );

/*******Vertical BJTS*****************/
pnp (all_devices,"VPNP",_1_0V_BJT_COLL,_1_0V_BJT_BASE,_1_0V_BJT_EMIT);
pnp (all_devices,"VPNP25V",_2_5V_BJT_COLL,_2_5V_BJT_BASE,_2_5V_BJT_EMIT);

npn (all_devices,"VNPN",_1_0V_BJT_COLL_NPN,_1_0V_BJT_BASE_NPN,_1_0V_BJT_EMIT_NPN);
npn (all_devices,"VNPN25V",_2_5V_BJT_COLL_NPN,_2_5V_BJT_BASE_NPN,_2_5V_BJT_EMIT_NPN);

/*******Lateral BJTS*****************/
pnp (all_devices,"LPNP",_1_0V_BJT_COLLL,_1_0V_BJT_BASEL,_1_0V_BJT_EMITL,
	properties = {{"area",DOUBLE}},body_position = BASE,property_function = lateral_bjt);
pnp (all_devices,"LPNP25V",_2_5V_BJT_COLLL,_2_5V_BJT_BASEL,_2_5V_BJT_EMITL,
	properties = {{"area",DOUBLE}},body_position = BASE,property_function = lateral_bjt);

npn (all_devices,"LNPN",_1_0V_BJT_COLL_NPNL,_1_0V_BJT_BASE_NPNL,_1_0V_BJT_EMIT_NPNL,
	properties = {{"area",DOUBLE}},body_position = BASE,property_function = lateral_bjt);
npn (all_devices,"LNPN25V",_2_5V_BJT_COLL_NPNL,_2_5V_BJT_BASE_NPNL,_2_5V_BJT_EMIT_NPNL,
	properties = {{"area",DOUBLE}},body_position = BASE,property_function = lateral_bjt);

pnp (all_devices,"DNWPNP",coll_dnw_pnp,base_dnw_pnp,emit_dnw_pnp,
	properties = {{"area",DOUBLE}},body_position = BASE,property_function = lateral_bjt);

/********** VARACTOR EXTRACTION **********/
capacitor (all_devices, "NVAR1",varngate,varnpoly,varndiff,
			x_card = true,
			properties = {{"len",DOUBLE},{"wid",DOUBLE}},
			property_function = cap_len_wid_fn,
					schematic_devices = {{ device_name = "NVAR1",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}});

capacitor (all_devices, "PVAR1",varpgate,varppoly,varpdiff,
			x_card = true,
			properties = {{"len",DOUBLE},{"wid",DOUBLE}},
			property_function = cap_len_wid_fn,
					schematic_devices = {{ device_name = "PVAR1",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}});

capacitor (all_devices, "NVAR2",varngate25,varnpoly,varndiff25,
			x_card = true,
			properties = {{"len",DOUBLE},{"wid",DOUBLE}},
			property_function = cap_len_wid_fn,
					schematic_devices = {{ device_name = "NVAR2",
						terminal_a = "PLUS",
						terminal_b = "MINUS"}});

capacitor (all_devices, "PVAR2",varpgate25,varppoly,varpdiff25,
			x_card = true,
			properties = {{"len",DOUBLE},{"wid",DOUBLE}},
			property_function = cap_len_wid_fn,
					schematic_devices = {{ device_name = "PVAR2",
						terminal_a = "PLUS",
					terminal_b = "MINUS"}});
	/********** INDUCTOR EXTRACTION **********/
inductor (all_devices, "SYNSTD",ind_octagon,top_metex,sec_top_met,
		{{psub}},x_card = true,
		properties = {{"lval"}, {"l", DOUBLE, MICRO},
{"w", DOUBLE, MICRO}, {"turn"}, {"space", DOUBLE, MICRO},
{"bbarea", DOUBLE, PICO}, {"bbheight", DOUBLE, MICRO},
{"bbwidth", DOUBLE, MICRO},{"R",DOUBLE,MICRO},{"S",DOUBLE,MICRO},{"N",DOUBLE}},
		property_function = ind_gen_fn,
		schematic_devices = {{ device_name = "SYNSTD",
						terminal_a = "PLUS",
						terminal_b = "MINUS",
						optional_pins = {"BULK"},
						ignore_pins = {"BULK"}}
		}
		);
			
inductor (all_devices, "INDSYM",ind_oct_sym,top_metex,top_metex,
		{{psub}},x_card = true,
		properties = {{"lval"}, {"l", DOUBLE, MICRO},
{"w", DOUBLE, MICRO}, {"turn"}, {"space", DOUBLE, MICRO},
{"bbarea", DOUBLE, PICO}, {"bbheight", DOUBLE, MICRO},
{"bbwidth", DOUBLE, MICRO},{"R",DOUBLE,MICRO},{"S",DOUBLE,MICRO},{"N",DOUBLE}},
		property_function = ind_gen_fn,
				schematic_devices = {{ device_name = "INDSYM",
						terminal_a = "PLUS",
						terminal_b = "MINUS",
						optional_pins = {"BULK"},
						ignore_pins = {"BULK"}}
		}
);

gendev (all_devices,"INDSYMCT",ind_oct_symct,
	{{top_metex ,"PLUS"},{top_metex,pin_name = "MINUS"},{third_top_met,"CTAP"},{psub,"BULK",pin_type = BULK}},
	/* VVK - option  DEVICE_PREFIX=X */
	processing_layers = {sec_top_metindct,space_ind_symct,ind_oct_symct_radhole},
	/*DEV_NONPIN_BODY = TRUE*/
	properties = {{"R",DOUBLE,MICRO},{"S",DOUBLE,MICRO},{"N",DOUBLE},{"w",DOUBLE,MICRO}},
	property_function = gendev_INDSYMCT_fn,
	schematic_devices = {{ "INDSYMCT" ,ignore_pins = {"BULK"}}},
 swappable_pins = {{"PLUS", "MINUS"}}
	);

gendev (all_devices, "cmom_123",mom_cap_123_body,
	{{mom_cap_123_term,"PLUS"},{mom_cap_123_term,"MINUS"},{poly,"BULK",pin_type = BULK}},
	/* VVK - option  DEVICE_PREFIX=X */
	/*DEV_NONPIN_BODY = TRUE*/
	processing_layers = {MOM_field1,MOM_field2,F_reg1/*,mom_cap_123_body */},
	properties = {{"Width",DOUBLE},{"spacing",DOUBLE,MICRO},{"NV",DOUBLE},{"NH",DOUBLE},{"STARTMETAL",DOUBLE},{"endmetal",DOUBLE}},
	property_function = gendev_cmom_fn,
	schematic_devices = {{"cmom"}},
 swappable_pins = {{"PLUS", "MINUS"}}
	);

gendev (all_devices, "cmom_1234",mom_cap_1234_body,
	{{mom_cap_1234_term ,"PLUS"},{mom_cap_1234_term ,"MINUS"},{poly,"BULK",pin_type = BULK}},
	/* VVK - option  DEVICE_PREFIX=X */
	/*DEV_NONPIN_BODY = TRUE*/
	processing_layers = {MOM_field1,MOM_field2,F_reg1,mom_cap_123_body },
	properties = {{"width",DOUBLE},{"spacing",DOUBLE},{"NV",DOUBLE},{"NH",DOUBLE},{"STARTMETAL",DOUBLE},{"endmetal",DOUBLE}},
	property_function = gendev_cmom1234_fn,
	schematic_devices = {{"cmom"}},
 swappable_pins = {{"PLUS", "MINUS"}}
	);

gendev (all_devices, "cmom_234",mom_cap_234_body,
	{{mom_cap_234_term,"PLUS"},{mom_cap_234_term,"MINUS"},{poly,"BULK",pin_type = BULK}},
	/* VVK - option  DEVICE_PREFIX=X */
	/*DEV_NONPIN_BODY = TRUE*/
	processing_layers = {MOM_field2,MOM_field3,F_reg2/*,mom_cap_234_body */},
	properties = {{"width",DOUBLE},{"spacing",DOUBLE},{"NV",DOUBLE},{"NH",DOUBLE},{"STARTMETAL",DOUBLE},{"endmetal",DOUBLE}},
	property_function = gendev_cmom234_fn,
	schematic_devices = {{"cmom"}},
 swappable_pins = {{"PLUS", "MINUS"}}
	);

/* Data creation XJVAR */
varnwj_rf = and( nxwell, VARMARKER );
jvar1_rf = interacting( varnwj_rf, tpdiff );
jvar2_rf = interacting( jvar1_rf, tndiff );
jvar3_rf = not( jvar2_rf, RFDMY );
jvar_rf3t = and( jvar3_rf, VARMARKER );
jvarp_rf = and( jvar2_rf, tpdiff );
jvarn_rf = and( jvar2_rf, tndiff );
jvar_nr = enclosing( jvar_rf3t, jvarp_rf );
jvar_ws = not( jvar_rf3t, jvar_nr );
/* "0.29" is a trade number from spice model */
w_fac = external2( jvarp_rf, jvarn_rf, < 0.29, 
    extension   = NONE,
    look_thru   = ALL,
    orthogonal  = BOTH,
    orientation = { PARALLEL }
);
/* Device Extraction & Equate XJVAR */
gendev (all_devices, "xjvar",jvar_nr,
	{{tpdiff,"PLUS"},{tndiff,"MINUS"},{psub,"BULK",pin_type = BULK}},
	/* VVK - option  DEVICE_PREFIX=X */
	/* VVK - DEV_NONPIN_BODY = TRUE*/ /*CREATE_DEFAULT_PROPERTIES = FALSE*/
	processing_layers = {jvarp_rf,w_fac},
	properties = {{"NR",DOUBLE},{"wr",DOUBLE}},
	property_function = gendev_count_perim_fn,
	schematic_devices = {{"XJVAR",ignore_pins = {"BULK"}}}
	);
gendev (all_devices, "vardio",pvardio,
	{{pvardio,"PLUS"},{nxwell,"MINUS"}},
	/* VVK - option  DEVICE_PREFIX=X */
	/* VVK - DEV_NONPIN_BODY = TRUE*/ /*CREATE_DEFAULT_PROPERTIES = FALSE*/
	recognition_layer = RFDMY,
	properties = {{"A",DOUBLE},{"N",DOUBLE}},
	property_function = gendev_count_area_fn,
	schematic_devices = {{"VARDIO"}}
	);

/* Extraction command */
devices_db = extract_devices(all_devices);
layout_netlist = netlist(devices_db);
	
/* EQUATE SECTION */
my_compare_settings = init_compare_matrix(); 

match (my_compare_settings, 
		detect_permutable_ports = true,
        match_by_net_name = true,
        no_explode_condition = NONE,
        match_condition = {
/*                nets_matched_with_different_name = ERROR,*/
                property_mismatch                = ERROR
        }
);
/******************************************/
/* Merge Parallel section */
merge_parallel (my_compare_settings,NMOS,
	{"N","N25","NDN","NDN25","NM25","NL","NH","NM","N18","N33","NA","NA25","NA18","NA33"},property_functions = {{"calc_width_length_by_ratio" } }
);
merge_parallel (my_compare_settings,PMOS,
	{"P","P25","PM","PL","PH","PM","P18","P33"}
);
merge_parallel (my_compare_settings,RESISTOR,
	{"rm1","rm2","rm3","rm4"}
	);
if( RES_3TERM == 1 ) {
merge_parallel (my_compare_settings,RESISTOR,
	{"rnpoly_3t_psub","rnpolyS_3t_psub","rppoly_3t_psub","rppolyS_3t_psub","hrnpoly_3t_psub",
	"hrppoly_3t_psub","rnpoly_3t_nw","rnpolyS_3t_nw","rppoly_3t_nw","rppolyS_3t_nw","hrnpoly_3t_nw",
	"hrppoly_3t_nw","rndiff_3t","rndiffS_3t","rpdiff_3t","rpdiffS_3t","rnwell_3t","rnwdiff_3t",
	"rpolyc","rpolyhc"});
} else {
merge_parallel (my_compare_settings,RESISTOR,
	{"rnpoly","rnpolyS","rppoly","rppolyS","hrnpoly","hrppoly","rndiff","rndiffS","rpdiff"
	,"rpdiffS","rnwell","rnwdiff","rpoly","rpolyh","rpolyrf","rpolyhrf"});
}
/* Merge Series section */
merge_series_off (my_compare_settings,NMOS,
	{"N","N25","NDN","NDN25","NM25","NL","NH","NM","N18","N33","NA","NA25","NA18","NA33"}
);
merge_series_off (my_compare_settings,PMOS,
	{"P","P25","PM","PL","PH","PM","P18","P33"}
);
merge_series (my_compare_settings,RESISTOR,
	{"rm1","rm2","rm3","rm4"}
	);
if( RES_3TERM == 1 ) {
merge_series (my_compare_settings,RESISTOR,
	{"rnpoly_3t_psub","rnpolyS_3t_psub","rppoly_3t_psub","rppolyS_3t_psub","hrnpoly_3t_psub",
	"hrppoly_3t_psub","rnpoly_3t_nw","rnpolyS_3t_nw","rppoly_3t_nw","rppolyS_3t_nw","hrnpoly_3t_nw",
	"hrppoly_3t_nw","rndiff_3t","rndiffS_3t","rpdiff_3t","rpdiffS_3t","rnwell_3t","rnwdiff_3t",
	"rpolyc","rpolyhc"});
} else {
merge_series (my_compare_settings,RESISTOR,
	{"rnpoly","rnpolyS","rppoly","rppolyS","hrnpoly","hrppoly","rndiff","rndiffS","rpdiff"
	,"rpdiffS","rnwell","rnwdiff","rpoly","rpolyh","rpolyrf","rpolyhrf"});
}
/* Filter options section */
/***************BJT***********************/
filter ( my_compare_settings, PNP, 
	{"VPNP","VPNP25V","LPNP","LPNP25V","DNWPNP"},
	PNP_1);
filter ( my_compare_settings, NPN, 
	{"VNPN","VNPN25V","LNPN","VNPN25V"},
	NPN_1);
/*  FILTER_OPTIONS = { NMOS-1 } */
filter(my_compare_settings,NMOS,
	{"N","N25","NDN","NDN25","NM25","NL","NH","NM","N18","N33","NA","NA25","NA18","NA33"},
NMOS_1);	
/*  FILTER_OPTIONS = { PMOS-1 } */
filter( my_compare_settings, PMOS,
	{"P","P25","PM","PL","PH","PM","P18","P33"},
	PMOS_1
);
/* Check property section */
check_property (my_compare_settings,NMOS,
	{/*"N",*/"N25",/*"NDN",*/"NDN25","NM25","NL","NH","NM","N18","N33","NA","NA25","NA18","NA33"},
	{{"width",[-0.0,+0.0]},{"len",[-0.0,+0.0]}}
);
check_property (my_compare_settings,PMOS,
	{"P","P25","PM","PL","PH","PM","P18","P33"},
	{{"width",[-0.0,+0.0]},{"len",[-0.0,+0.0]}}
);


/* Capacitor Equate */
if( DRAWCBM == 1 ) {
if (CAP_3TERM == 0 ) {
check_property (my_compare_settings,CAPACITOR,
	{"cmim_2t"},
	{{"w",[-0.0,+0.0]},{"l",[-0.0,+0.0]}});
} else {
check_property (my_compare_settings,CAPACITOR,
	{"cmim_3t"},
	{{"w",[-0.0,+0.0]},{"l",[-0.0,+0.0]}});

}
}
check_property (my_compare_settings,RESISTOR,
	{"rm1","rm2","rm3","rm4"},
	{{"l",[-1.000,1.000]},{"w",[-1.000,1.000]}});

if( RES_3TERM == 1 ) {
/* Serp Resistor 3 term EQUATE *//***** Serpentine Resistors 2-term Equate *****/
check_property (my_compare_settings,RESISTOR,
	{"rnpoly_3t_psub","rnpolyS_3t_psub","rppoly_3t_psub","rppolyS_3t_psub","hrnpoly_3t_psub","hrppoly_3t_psub","rnpoly_3t_nw","rnpolyS_3t_nw","rppoly_3t_nw","rppolyS_3t_nw","hrnpoly_3t_nw","hrppoly_3t_nw","rndiff_3t","rndiffS_3t","rpdiff_3t","rpdiffS_3t","rnwell_3t","rnwdiff_3t","rpolyc","rpolyhc"},
	{{"l",[-1.000,1.000]},{"w",[-1.000,1.000]}});

} else {
check_property (my_compare_settings,RESISTOR,
	{"rnpoly","rnpolyS","rppoly","rppolyS","hrnpoly","hrppoly","rndiff","rndiffS","rpdiff"
	,"rpdiffS","rnwell","rnwdiff","rpoly","rpolyh","rpolyrf","rpolyhrf"},
	{{"l",[-1.000,1.000]},{"w",[-1.000,1.000]}});

}
/***** Diode Equate *****/
check_property (my_compare_settings,INDUCTOR,
	{"SYNSTD","INDSYM"},
	{{"S",5.0,},{"w",5.0}});
/* RTMOM */
check_property (my_compare_settings,GENERIC,
	{"INDSYMCT"},
	{{"S",5.0},{"w",5.0}});
check_property (my_compare_settings,GENERIC,
	{"cmom_123","cmom_1234","cmom_234"},
	{{"Width",[-0.0,+0.0]},{"spacing",[-0.0,+0.0]},{"NV",[-0.0,+0.0]},{"NH",[-0.0,+0.0]},{"STARTMETAL",[-0.0,+0.0]},{"endmetal",[-0.0,+0.0]}}
	/* SCHEMATIC_SWAPPABLE_PORTS = { PLUS MINUS }*/
	);
/* END RTMOM */
/* XJVAR Equate */
check_property (my_compare_settings, GENERIC,
	{"xjvar"},
	{{"NR",[-0.0,+0.0]},{"wr",[-0.0,+0.0]}}
	);
check_property (my_compare_settings, GENERIC,
	{"vardio"},
	{{"A",[-0.0,+0.0]}}
	);
/* End VARDIO Equate *//******************************************/
/*
map_pmos (
	state = my_compare_settings ,
	device_name = "P",
	optional_pins = {{"BULK",pin_compared = false }}
,	schematic_devices ={{"P",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
map_pmos (
	state = my_compare_settings ,
	device_name = "PL",
	optional_pins = {{"BULK",pin_compared = false }}
	,schematic_devices ={{"PL",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
map_pmos (
	state = my_compare_settings ,
	device_name = "PM",
	optional_pins = {{"BULK",pin_compared = false }}
	,schematic_devices ={{"PM",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
map_pmos (
	state = my_compare_settings ,
	device_name = "PH",
	optional_pins = {{"BULK",pin_compared = false }}
	,schematic_devices ={{"PH",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
map_pmos (
	state = my_compare_settings ,
	device_name = "P25",
	optional_pins = {{"BULK",pin_compared = false }}
	,schematic_devices ={{"P25",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
map_pmos (
	state = my_compare_settings ,
	device_name = "P18",
	optional_pins = {{"BULK",pin_compared = false }}
	,schematic_devices ={{"P18",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);
map_pmos (
	state = my_compare_settings ,
	device_name = "P33",
	optional_pins = {{"BULK",pin_compared = false }}
	,schematic_devices ={{"P33",optional_pins ={"BULK"},ignore_pins = {"BULK"}}}
	);*/	/*SHORT_EQUIVALENT_NODES=FALSE*/
/*short_equivalent_nodes_off (my_compare_settings,NMOS);
short_equivalent_nodes_off (my_compare_settings,PMOS);*/
compare (my_compare_settings,schematic_netlist,layout_netlist,
		action_on_error = EXPLODE,
	/*PUSH_DOWN_PINS=TRUE*/
		push_down_pins = true,
	/*PUSH_DOWN_DEVICES=TRUE*/
		push_down_devices = true,
/*		case_sensitive = {DEVICE_NAME,NET_PORT},*/
	/*RETAIN_NEW_DATA=TRU
		remove_equiv_sum_files = NONE,*/
	/*REMOVE_DANGLING_NETS=TRUE*/
		remove_dangling_net = ALL,
		 print_messages={all_merged_device_list=true}
	,user_functions_file = data_dir+"/func.rs");

/*
	CALCULATE_CLASS=TRUE - ?
	COMPARE_PROPERTIES=TRUE
	FILTER=TRUE
	MATCH_BY_PROPERTY=TRUE
	MERGE_PARALLEL= TRUE 
	MERGE_PATHS=FALSE
	MERGE_SERIES=TRUE
	PARALLEL_MERGE_RATIO=TRUE User function to be written
	PROPERTY_WARNING=FALSE
	RETAIN_PREVIOUS_DATA=FALSE
	OPTIONAL_PINS = FALSE 
	);*/
/* Hercules lines 2675 ~ 2678:
WRITE_EXTRACT_VIEW {
	LIBRARY_NAME = EXTRACT_VIEW
	LIBRARY_PATH = ./
} */
/* Hercules lines 2680 ~ 2682:
GRAPHICS_NETLIST {
	EXPLORER_LAYERS (0)
} */
pex_layer_matrix = init_pex_layer_matrix(devices_db);
#include "/remote/dept-seg-cae2/FTK/agarwals/PERFORCE/IPL/reference/90nm/icv/lvs/pex_commands.9lm.rs"

pex_rcxt_map_file_h = pex_process_map_file("rcxt_mapping_file");
pex_lpp_map_file_h = pex_lpp_map_file("lpp_mapping_file");
pex_runset_file = pex_runset_report_file("pex_runset_report_file");
xtr_out = milkyway_library(library_name = "MILKYWAY_OUTPUT", library_path = ".");
pex_generate_results(pex_layer_matrix,
		     xtr_out,
		     pex_rcxt_map_file_h,
		     pex_runset_file,
		     precision = 6,
		     pex_lpp_map_file = pex_lpp_map_file_h
		     );
