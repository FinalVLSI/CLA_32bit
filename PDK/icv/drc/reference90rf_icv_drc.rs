/***********************************************************************/
/*                    SYNOPSYS REFERENCE PDK DRC RUNSET                  */
/***********************************************************************/
/* This File and the associated documentation are confidential         */
/* and proprietary to Synopsys, Inc.                                   */ 
/*                                                                     */
/* Copyright (c), 2009-2010 Synopsys, Inc. All rights reserved.        */
/* This drc deck and the associated documentation are confidential     */
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
/* Synopsys 90 nm Demo DRC runset                                      */
/* This is for a fictional process and just shows how things can be    */ 
/* Synopsys accepts no responsibility for any use of this runset.      */
/*                                                                     */
/***********************************************************************/

//This runset is in the development stage and there might be some updates to it.


#include "icv.rh"

library(
	library_name  = "newLIB",
	format = OPENACCESS,
	cell = "myCell",
    library_definition_file = "lib.defs"

);

openaccess_options(
	view="layout",
	layer_mapping_file="/remote/dept-seg-cae2/FTK/agarwals/PERFORCE/IPL/reference/90nm/techfiles/reference90RF_layer.map"
);

metdLayers : list of polygon_layer={};
metpLayers : list of polygon_layer={};
mettextdLayers : list of polygon_layer={};
viadLayers : list of polygon_layer={};
momdmydLayers : list of polygon_layer={};

nwelldLayer = assign({{==1},{==0}});
diffdLayer = assign({{==2},{==0}}); 
pplusdLayer = assign({{==4},{==0}}); 
nplusdLayer = assign({{==5},{==0}}); 
rpolydLayer = assign({{==6},{==0}}); 
contdLayer = assign({{==7},{==0}}); 
polydLayer = assign({{==3},{==0}}); 
polypLayer = assign({{==41},{==0}});  
//polytextdLayer = assign({{==41},{==0}}); 
excludebLayer = assign({{==19},{==0}});

ctmdLayer = assign({{==20},{==0}});
cbmdLayer = assign({{==21},{==0}});
dnwdLayer = assign({{==22},{==0}});
nwdmydLayer = assign({{==23},{==0}}); 
rpdmydLayer = assign({{==24},{==0}});
diodedLayer = assign({{==25},{==0}}); 
natdLayer = assign({{==26},{==0}}); 
diff25dLayer = assign({{==27},{==0}}); 
rmarkerdLayer = assign({{==28},{==0}}); 
hrimpdLayer = assign({{==29},{==0}}); 
inddmydLayer = assign({{==30},{==0}});
varmarkerdLayer = assign({{==31},{==0}}); 
rmdmydLayer = assign({{==32},{==0}}); 
medvtndLayer = assign({{==33},{==0}}); 
medvtpdLayer = assign({{==34},{==0}});
diff18dLayer = assign({{==35},{==0}}); 
diff33dLayer = assign({{==36},{==0}});
lowvtndLayer = assign({{==37},{==0}}); 
lowvtpdLayer = assign({{==38},{==0}}); 
highvtndLayer = assign({{==39},{==0}});
highvtpdLayer = assign({{==40},{==0}}); 
bjtdummydLayer = assign({{==49},{==0}}); 
iplayerwLayer = assign({{==63},{==0}}); 
psubdLayer = assign({{==64},{==0}}); 
pindummydLayer = assign({{==65},{==0}}); 
rtermmarkerdLayer = assign({{==66},{==0}});
ctmdmydLayer = assign({{==67},{==0}}); 
rfdmydLayer = assign({{==69},{==0}});

metdLayers.push_back(assign({{==8},{==0}}));
metdLayers.push_back(assign({{==10},{==0}}));
metdLayers.push_back(assign({{==12},{==0}}));
metdLayers.push_back(assign({{==14},{==0}}));
metdLayers.push_back(assign({{==70},{==0}}));
metdLayers.push_back(assign({{==72},{==0}}));
metdLayers.push_back(assign({{==74},{==0}}));
metdLayers.push_back(assign({{==76},{==0}}));
metdLayers.push_back(assign({{==78},{==0}}));

metpLayers.push_back(assign({{==9},{==0}}));
metpLayers.push_back(assign({{==11},{==0}}));
metpLayers.push_back(assign({{==13},{==0}}));
metpLayers.push_back(assign({{==15},{==0}}));
metpLayers.push_back(assign({{==71},{==0}}));
metpLayers.push_back(assign({{==73},{==0}}));
metpLayers.push_back(assign({{==75},{==0}}));
metpLayers.push_back(assign({{==77},{==0}}));
metpLayers.push_back(assign({{==79},{==0}}));

viadLayers.push_back(assign({{==16},{==0}}));
viadLayers.push_back(assign({{==17},{==0}}));
viadLayers.push_back(assign({{==18},{==0}}));
viadLayers.push_back(assign({{==80},{==0}}));
viadLayers.push_back(assign({{==81},{==0}}));
viadLayers.push_back(assign({{==82},{==0}}));
viadLayers.push_back(assign({{==83},{==0}}));
viadLayers.push_back(assign({{==84},{==0}}));

for(i=1 to 4 step 1) {
momdmydLayers.push_back(assign({{==68},{==i}}));
}

layer_string_h : newtype hash of string to polygon_layer;
layer_float_h : newtype hash of string to double;
layer_str_str_h : newtype hash of string to layer_float_h ;
list_diff_layers : list of string = {};
list_diff_layers_values : list of double = {};

layer_names : layer_string_h = {
	"NWELL" => nwelldLayer,
	"DIFF" => diffdLayer,
	"POLY" => polydLayer,
	"PPLUS" => pplusdLayer,
	"NPLUS" => nplusdLayer,
	"RPOLY" => rpolydLayer,
	"CONT" => contdLayer,
	"M1" => metdLayers[0],
	"M2" => metdLayers[1],
	"M3" => metdLayers[2],
	"M4" => metdLayers[3],
	"M5" => metdLayers[4],
	"M6" => metdLayers[5],
	"M7" => metdLayers[6],
	"M8" => metdLayers[7],
	"M9" => metdLayers[8],
	"V1" => viadLayers[0],
	"V2" => viadLayers[1],
	"V3" => viadLayers[2],
	"V4" => viadLayers[3],
	"V5" => viadLayers[4],
	"V6" => viadLayers[5],
	"V7" => viadLayers[6],
	"V8" => viadLayers[7],
	"DIODE" => diodedLayer,
	"CTMDMY" => ctmdmydLayer,
	"CTM" => ctmdLayer,
	"CBM" => cbmdLayer,
	"DNW" => dnwdLayer,	
	"NAT" => natdLayer,	
	"DIFF25" => diff25dLayer,
	"DIFF18" => diff18dLayer,
	"DIFF33" => diff33dLayer,
	"NWDMY" => nwdmydLayer,
	"NWDMY" => nwdmydLayer,
	"RMARKER" => rmarkerdLayer,
	"LOWVTN" => lowvtndLayer,
	"MEDVTN" => medvtndLayer,
	"HIGHVTN" => highvtndLayer,
	"LOWVTP" => lowvtpdLayer,
	"MEDVTP" => medvtpdLayer,
	"HIGHVTP" => highvtpdLayer
};	

layer_widths : layer_float_h = {
        "NWELL" => 0.55,
        "DIFF" => 0.09, 
        "POLY" => 0.09,
        "PPLUS" => 0.2,
        "NPLUS" => 0.2,
        "RPOLY" => 0.34,
        "CONT" => 0.09,
        "M1" => 0.1,
        "M2" => 0.15,
        "M3" => 0.15,
        "M4" => 0.15,
        "M5" => 0.15,
        "M6" => 0.15,
        "M7" => 0.15,
        "M8" => 0.15,
        "V1" => 0.13,
        "V2" => 0.13,
        "V3" => 0.13,
        "V4" => 0.13,
        "V5" => 0.13,
        "V6" => 0.13,
        "V7" => 0.13,
        "V8" => 0.13,
        "CTM" => 1.00,
        "DNW" => 2.8
};

layer_spacings : layer_float_h = {
        "NWELL" => 0.55,
        "DIFF" => 0.09,
        "POLY" => 0.09,
        "PPLUS" => 0.1,
        "NPLUS" => 0.1,
        "RPOLY" => 0.34,
        "CONT" => 0.1,
        "M1" => 0.1,
        "M2" => 0.15,
        "M3" => 0.15,
        "M4" => 0.15,
        "M5" => 0.15,
        "M6" => 0.15,
        "M7" => 0.15,
        "M8" => 0.15,
        "M9" => 0.15,
        "V1" => 0.13,
        "V2" => 0.13,
        "V3" => 0.13,
        "V4" => 0.13,
        "V5" => 0.13,
        "V6" => 0.13,
        "V7" => 0.13,
        "V8" => 0.13,
        "DNW" => 4.4
};

layer_areas : layer_float_h = {
        "NWELL" => 1.2,
        "DIFF" => 0.05,
        "POLY" => 0.05,
        "PPLUS" => 0.08,
        "NPLUS" => 0.08,
        "RPOLY" => 0.85,
        "M1" => 0.04,
        "M2" => 0.06,
        "M3" => 0.06,
        "M4" => 0.06,
        "M5" => 0.06,
        "M6" => 0.06,
        "M7" => 0.15,
        "M8" => 0.15,
        "M9" => 0.15,
        "DNW" => 4.4
};

layer_external_spacings : layer_str_str_h = {
        "NWELL" => { "DIFF" => 0.22 },
        "PPLUS" => { "DIFF" => 0.02 },
        "NPLUS" => { "DIFF" => 0.02 },
        "RPOLY" => { "DIFF" => 0.22 , "CONT" => 0.22 , "POLY" => 0.22 },
        "CONT"  => { "POLY" => 0.08, "DIFF" => 0.1 },
        "DIFF" =>  { "POLY" => 0.045 },
        "NAT" =>   { "DIFF" => 0.20 },
//      "NPLUS" => { "PPLUS" => 0.00 }
};

layer_internal_spacings : layer_str_str_h = {
        "NWELL" => { "RPOLY" => 0.50 , "DNW" => 0.8 },
        "POLY" => { "DIFF" => 0.16 },
        "PPLUS" => { "POLY" => 0.18 , "RPOLY" => 0.18 },
        "NPLUS" => { "POLY" => 0.18 , "RPOLY" => 0.18 }
};

layer_enclosures : layer_str_str_h = {
        "NWELL" => { "DIFF" => 0.23 , "PPLUS" => 0.0 },
        "RMARKER" => { "POLY" => 0.22 },
        "NWDMY" => { "NWELL" => 0.2 },
        "POLY" => { "DIFF" => 0.13 , "CONT" => 0.05 },
        "DIFF" => { "POLY" => 0.16 , "CONT" => 0.05 , "NWELL" => 0.6 },
        "PPLUS" => { "CONT" => 0.06 },
      //  "PPLUS" => { "CONT" => 0.06 , "POLY" => 0.2 , "DIFF" => 0.13 },
        "NPLUS" => { "CONT" => 0.06 },
      //  "NPLUS" => { "CONT" => 0.06 , "POLY" => 0.2 , "DIFF" => 0.13 },
        "M1" => { "CONT" => 0.005 , "V1" => 0.01 },
        "M2" => { "V1" => 0.01 , "V2" => 0.01 },
        "M3" => { "V2" => 0.01 , "V3" => 0.01 },
        "M4" => { "V3" => 0.01 , "V4" => 0.01 },
        "M5" => { "V4" => 0.01 , "V5" => 0.01 },
        "M6" => { "V5" => 0.01 , "V6" => 0.01 },
        "M7" => { "V6" => 0.01 , "V7" => 0.01 },
        "M8" => { "V7" => 0.01 , "V8" => 0.01 },
        "M9" => { "V8" => 0.01 , "V8" => 0.01 },
        "RPOLY" => { "POLY" => 0.22 , "DIFF" => 0.22 },
        "NAT" => { "DIFF" => 0.28 },
        "DIFF25" => { "DIFF" => 0.3 },
        "DIFF18" => { "DIFF" => 0.3 },
        "DIFF33" => { "DIFF" => 0.3 },
        "CTM" => { "V3" => 0.24 , "M3" => 0.3 }
};
endofline_enclosures : layer_str_str_h = {
        "M1" => { "CONT" => 0.04 , "V1" => 0.04 },
        "M2" => { "V1" => 0.04 , "V2" => 0.04 },
        "M3" => { "V2" => 0.04 , "V3" => 0.04 },
        "M4" => { "V3" => 0.04 , "V4" => 0.04 },
        "M5" => { "V4" => 0.04 , "V5" => 0.04 },
        "M6" => { "V5" => 0.04 , "V6" => 0.04 },
        "M7" => { "V6" => 0.04 , "V7" => 0.04 },
        "M8" => { "V7" => 0.04 , "V8" => 0.04 },
        "M9" => { "V8" => 0.04 , "V8" => 0.04 },
        "POLY" => { "CONT" => 0.07 },
        "DIFF" => { "CONT" => 0.05 }
};

TECH_RULES : string = "true";
MOS_RULES : string = "true";
RES_RULES : string = "true";
DIO_RULES : string = "true";
CAP_RULES : string = "true";

dump_techfile_rules : boolean = ( TECH_RULES == "true" );
dump_mos_rules : boolean = ( MOS_RULES == "true" );
dump_cap_rules : boolean = ( CAP_RULES == "true" );
dump_dio_rules : boolean = ( DIO_RULES == "true" );
dump_res_rules : boolean = ( RES_RULES == "true" );

if ( dump_techfile_rules ) 
{

//All tech file rules
//RULE FOR MIN AREA CHECK
{
        layers = layer_areas.keys();
        for(i=0 to layers.size()-1 step 1) {
            @ "RULE:"+layers[i]+": Area < "+layer_areas[layers[i]];
                area(layer_names[layers[i]],value < layer_areas[layers[i]]);
        }
};
//RULE FOR MIN WIDTH CHECK
{
        layers = layer_widths.keys();
        for(i=0 to layers.size()-1 step 1) {
            @ "RULE:"+layers[i]+": Width < "+layer_widths[layers[i]];
                internal1(layer_names[layers[i]], distance < layer_widths[layers[i]], extension = NONE );
        }
};
//RULE FOR MIN SPACING CHECK ( BETWEEN SAME LAYERS )
{
        layers = layer_spacings.keys();
        for(i=0 to layers.size()-1 step 1) {
            @ "RULE:"+layers[i]+": Spacing < "+layer_spacings[layers[i]];
                external1(layer_names[layers[i]], distance < layer_spacings[layers[i]], extension = RADIAL );
        }
};
//RULE FOR MIN SPACING CHECK ( BETWEEN DIFFERENT LAYERS )
{
        layers = layer_external_spacings.keys();

        for(i=0 to layers.size()-1 step 1) {
                temp = layer_external_spacings[layers[i]];
                temp1 = temp.keys();
                for(j=0 to temp1.size()-1 step 1) {
                        @ "RULE:"+layers[i]+" "+temp1[j]+" Spacing < "+temp[temp1[j]];
                        offset = temp[temp1[j]];
                        external2(layer_names[layers[i]], layer_names[temp1[j]], distance < offset , extension = NONE );
                }
        }
};
//RULE FOR MIN OVERLAP CHECK ( BETWEEN DIFFERENT LAYERS )
{
        layers = layer_internal_spacings.keys();

        for(i=0 to layers.size()-1 step 1) {
                temp = layer_internal_spacings[layers[i]];
                temp1 = temp.keys();
                for(j=0 to temp1.size()-1 step 1) {
                        @ "RULE:"+layers[i]+" "+temp1[j]+" Overlap < "+temp[temp1[j]];
                        offset = temp[temp1[j]];
                        internal2(layer_names[layers[i]], layer_names[temp1[j]], distance < offset , extension = NONE );
                }
        }
};
//RULE FOR MIN ENCLOSURE CHECK ( BETWEEN DIFFERENT LAYERS )
{
        layers = layer_enclosures.keys();

        for(i=0 to layers.size()-1 step 1) {
                temp = layer_enclosures[layers[i]];
                temp1 = temp.keys();
                        for(j=0 to temp1.size()-1 step 1) {
                                offset = temp[temp1[j]];
                                @ "RULE:"+temp1[j]+" "+layers[i]+" Enclosure < "+offset;
//                              not_covered_by(layer_names[temp1[j]], layer_names[layers[i]] , distances = {{{offset},{offset},{offset},{offset}}} );
                                if ( dblne (offset,0) )
                                        enclose(layer_names[temp1[j]], layer_names[layers[i]] , distance < offset, extension = NONE );
                        }
        }
};
{ 
     //  @ "Enclosure of DIFF(not interacting poly) within PPLUS < 0.03";
     //  enclose(layer_names["DIFF"] not_interacting layer_names["POLY"], layer_names["PPLUS"] , distance < 0.03, extension = NONE );
     //  @ "Enclosure of DIFF(not interacting poly) within NPLUS < 0.03";
     //  enclose(layer_names["DIFF"] not_interacting layer_names["POLY"], layer_names["NPLUS"] , distance < 0.03, extension = NONE );
       @ "Enclosure of DIFF(interacting poly) within PPLUS < 0.13";
       enclose(layer_names["DIFF"] interacting layer_names["POLY"], layer_names["PPLUS"] , distance < 0.13, extension = NONE );
       @ "Enclosure of DIFF(interacting poly) within NPLUS < 0.13";
       enclose(layer_names["DIFF"] interacting layer_names["POLY"], layer_names["NPLUS"] , distance < 0.13, extension = NONE );

       @ "DIFF must be enclosed by NPLUS or PPLUS";
       diff = layer_names["DIFF"];
       np_diff = layer_names["DIFF"] inside ( layer_names["PPLUS"] or layer_names["NPLUS"] );
       diff not np_diff;

       @ "Enclosure of DIFF(interacting poly) within PPLUS < 0.13";
       enclose(layer_names["DIFF"] interacting layer_names["POLY"], layer_names["PPLUS"] , distance < 0.13, extension = NONE );
	
       @ "Enclosure of DIFF(not interacting poly) within PPLUS < 0.02";
       enclose(layer_names["DIFF"] not_interacting layer_names["POLY"], layer_names["PPLUS"] , distance < 0.02, extension = NONE );

       @ "Enclosure of DIFF(interacting poly) within NPLUS < 0.13";
       enclose(layer_names["DIFF"] interacting layer_names["POLY"], layer_names["NPLUS"] , distance < 0.13, extension = NONE );

};
//RULE FOR END OF LINE ENCLOSURE CHECK ( BETWEEN DIFFERENT LAYERS )
{
        layers = endofline_enclosures.keys();

        for(i=0 to layers.size()-1 step 1) { 
                temp = endofline_enclosures[layers[i]];
                temp1 = temp.keys();
                temp_layer = layer_enclosures[layers[i]];
                for(j=0 to temp1.size()-1 step 1) {
                   offset = temp[temp1[j]];
                   offset_normal = temp_layer[temp1[j]];
                   @ "RULE:"+temp1[j]+" "+layers[i]+" End of line Enclosure < "+offset + " Normal Enclosure < " + offset_normal;

                   layer1 = covered_by(layer_names[temp1[j]], layer_names[layers[i]] , distances = {{{offset},{offset_normal},{offset},{offset_normal}}} );
                  // layer2 = not(layer_names[layers[i]], layer_names[temp1[j]]);
                   layer2 = covered_by(layer_names[temp1[j]], layer_names[layers[i]] , distances = {{{0.0},{0.0},{0.0},{0.0}}} );
                   not(layer2,layer1);
                }
        }
};

{
	@ "RULE: P+ Material should not overlap N+ Material";
	layer_names["PPLUS"] and layer_names["NPLUS"];

}

}


if ( dump_mos_rules )
{
//All Reference kit rules
{
	@ "1.8 Enclosure of Gate within Implant < 0.13";
	Gate_layer = layer_names["POLY"] and layer_names["DIFF"];
	enclose(Gate_layer, layer_names["PPLUS"] , distance < 0.13, extension = NONE );
	enclose(Gate_layer, layer_names["NPLUS"] , distance < 0.13, extension = NONE );
};
{
	@ "1.9 Enclosure of Diffusion within Native Oxide < 0.28";
	enclose(layer_names["DIFF"], layer_names["NAT"] , distance < 0.28, extension = NONE );
};
{
	@ "1.11 Active Diffusion(touching Poly-Silicon) spacing to Active Diffusion < 0.13";
	diff_poly = layer_names["DIFF"] and layer_names["POLY"];
	diff_cont_poly = enclosing(layer_names["DIFF"],diff_poly);
	only_diff = not(layer_names["DIFF"],diff_cont_poly);
	external2(diff_cont_poly,only_diff, distance < 0.13 , extension = NONE );
};
{
	@ "1.18 Spacing between Native oxide and diffusion layer < 0.20";
	external2(layer_names["NAT"],layer_names["DIFF"], distance < 0.20 , extension = NONE );
};
{
	@ "1.19 Enclosure of gate with 25Volt ( DIFF25 ) < 0.35";
	Gate_layer = layer_names["POLY"] and layer_names["DIFF"];
	enclose(Gate_layer, layer_names["DIFF25"] , distance < 0.35, extension = NONE );
};
{
	@ "1.23 Poly to Pdiff Spacing < 0.10";
	PDiff = layer_names["DIFF"] inside layer_names["PPLUS"];	
	external2(layer_names["POLY"],PDiff, distance < 0.10 , extension = NONE );
};
{
	@ "1.24 Poly to Ndiff Spacing < 0.10";
	NDiff = layer_names["DIFF"] inside layer_names["NPLUS"];	
	external2(layer_names["POLY"],NDiff, distance < 0.10 , extension = NONE );
};
{
	@ "1.25 Pplus to Ndiff Spacing < 0.02";
	NDiff = layer_names["DIFF"] inside layer_names["NPLUS"];	
	external2(layer_names["PPLUS"],NDiff, distance < 0.02 , extension = NONE );
};
{
	@ "1.26 Nplus to Pdiff Spacing < 0.02";
	PDiff = layer_names["DIFF"] inside layer_names["PPLUS"];	
	external2(layer_names["NPLUS"],PDiff, distance < 0.02 , extension = NONE );
};

{
	@ "1.117 PolySilicon to Contact Spacing ( N18 ) < 0.15";
	n18_cont = layer_names["CONT"] inside layer_names["NPLUS"] inside layer_names["DIFF18"];
	n18_poly = layer_names["POLY"] inside layer_names["NPLUS"] inside layer_names["DIFF18"];
	external2(n18_cont,n18_poly, distance < 0.15 , extension = NONE );
	
	@ "1.123 PolySilicon to Contact Spacing ( NM ) < 0.08";
	nm_cont = layer_names["CONT"] inside layer_names["NPLUS"] ;
	nm_poly = layer_names["POLY"] inside layer_names["NPLUS"] ;
	cont_medvtn = nm_cont and layer_names["MEDVTN"];
	poly_medvtn = nm_poly and layer_names["MEDVTN"];
	cont1 = outside_touching(layer_names["CONT"],cont_medvtn);
	poly1 = outside_touching(layer_names["POLY"],poly_medvtn);
	nm_cont = cont1 or cont_medvtn;
	nm_poly = poly1 or poly_medvtn;	
	external2(nm_cont,nm_poly, distance < 0.08 , extension = NONE );

	@ "1.124 PolySilicon to Contact Spacing ( NL ) < 0.11";
	nl_cont = layer_names["CONT"] inside layer_names["NPLUS"] ;
	nl_poly = layer_names["POLY"] inside layer_names["NPLUS"] ;
	cont_lowvtn = nl_cont and layer_names["LOWVTN"];
	poly_lowvtn = nl_poly and layer_names["LOWVTN"];
	cont1 = outside_touching(layer_names["CONT"],cont_lowvtn);
	poly1 = outside_touching(layer_names["POLY"],poly_lowvtn);
	nl_cont = cont1 or cont_lowvtn;
	nl_poly = poly1 or poly_lowvtn;	
	external2(nl_cont,nl_poly, distance < 0.11 , extension = NONE );

	@ "1.125 PolySilicon to Contact Spacing ( NH ) < 0.11";
	nh_cont = layer_names["CONT"] inside layer_names["NPLUS"] ;
	nh_poly = layer_names["POLY"] inside layer_names["NPLUS"] ;
	cont_highvtn = nh_cont and layer_names["HIGHVTN"];
	poly_highvtn = nh_poly and layer_names["HIGHVTN"];
	cont1 = outside_touching(layer_names["CONT"],cont_highvtn);
	poly1 = outside_touching(layer_names["POLY"],poly_highvtn);
	nh_cont = cont1 or cont_highvtn;
	nh_poly = poly1 or poly_highvtn;	
	external2(nh_cont,nh_poly, distance < 0.11 , extension = NONE );

	@ "1.2 Polysilicon spacing to Contact (for NA Model Device) < 0.08";
	na_cont = layer_names["CONT"] inside layer_names["NPLUS"] inside layer_names["NAT"];
	na_poly = layer_names["POLY"] inside layer_names["NPLUS"] inside layer_names["NAT"];
	external2(na_cont,na_poly, distance < 0.08 , extension = NONE );

	@ "1.1 Polysilicon spacing to Contact (for N Model Device) < 0.08";
	n_cont = layer_names["CONT"] inside layer_names["NPLUS"];
	n_poly = layer_names["POLY"] inside layer_names["NPLUS"];
	n_cont = n_cont not nh_cont not nm_cont not nl_cont not na_cont not n18_cont;
	n_poly = n_poly not nh_poly not nm_poly not nl_poly not na_poly not n18_poly; 
	external2(n_cont,n_poly, distance < 0.08 , extension = NONE );
	
	@ "1.122 PolySilicon to Contact Spacing ( P18 ) < 0.15";
	p18_cont = layer_names["CONT"] inside layer_names["PPLUS"] inside layer_names["NWELL"] inside layer_names["DIFF18"];
	p18_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"] inside layer_names["DIFF18"];
	external2(p18_cont,p18_poly, distance < 0.15 , extension = NONE );

	@ "1.127 PolySilicon to Contact Spacing ( PM ) < 0.08";
	pm_cont = layer_names["CONT"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	pm_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	cont_medvtp = pm_cont and layer_names["MEDVTP"];
	poly_medvtp = pm_poly and layer_names["MEDVTP"];
	cont1 = outside_touching(layer_names["CONT"],cont_medvtp);
	poly1 = outside_touching(layer_names["POLY"],poly_medvtp);
	pm_cont = cont1 or cont_medvtp;
	pm_poly = poly1 or poly_medvtp;	
	external2(pm_cont,pm_poly, distance < 0.08 , extension = NONE );

	@ "1.129 PolySilicon to Contact Spacing ( PL ) < 0.11";
	pl_cont = layer_names["CONT"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	pl_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	cont_lowvtp = pl_cont and layer_names["LOWVTP"];
	poly_lowvtp = pl_poly and layer_names["LOWVTP"];
	cont1 = outside_touching(layer_names["CONT"],cont_lowvtp);
	poly1 = outside_touching(layer_names["POLY"],poly_lowvtp);
	pl_cont = cont1 or cont_lowvtp;
	pl_poly = poly1 or poly_lowvtp;	
	external2(pl_cont,pl_poly, distance < 0.11 , extension = NONE );

	@ "1.130 PolySilicon to Contact Spacing ( PH ) < 0.11";
	ph_cont = layer_names["CONT"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	ph_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	cont_highvtp = ph_cont and layer_names["HIGHVTP"];
	poly_highvtp = ph_poly and layer_names["HIGHVTP"];
	cont1 = outside_touching(layer_names["CONT"],cont_highvtp);
	poly1 = outside_touching(layer_names["POLY"],poly_highvtp);
	ph_cont = cont1 or cont_highvtp;
	ph_poly = poly1 or poly_highvtp;	
	external2(ph_cont,ph_poly, distance < 0.11 , extension = NONE );

	@ "1.6 Polysilicon spacing to Contact (for P Device) < 0.08";
	p_cont = layer_names["CONT"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	p_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	p_cont = p_cont not ph_cont not pm_cont not pl_cont not p18_cont;
	p_poly = p_poly not ph_poly not pm_poly not pl_poly not p18_poly;
	external2(p_cont,p_poly, distance < 0.08 , extension = NONE );
};
{
	p18_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"] inside layer_names["DIFF18"];
	p18_diff = layer_names["DIFF"] inside layer_names["PPLUS"] inside layer_names["NWELL"] inside layer_names["DIFF18"];
	p18_gate = p18_diff and p18_poly;
	p18_sd = p18_diff not p18_gate;
	p18_l = p18_gate not_touching_edge p18_sd;
	@ "1.142 Gate Minimum Length (P18) < 0.28";
	length_edge(p18_l, distance < 0.28 ); 			
	@ "1.143 Gate Maximum Length (P18) > 900";
	length_edge(p18_l, distance > 900 ); 			
	p18_l = p18_gate touching_edge p18_sd;
	@ "1.132 Gate Minimum Width (P18) < 0.4";
	length_edge(p18_l, distance < 0.4 ); 			
	@ "1.133 Gate Maximum Width (P18) > 900";
	length_edge(p18_l, distance > 900 ); 			
	
	pl_diff = layer_names["DIFF"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	pl_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	pl_gate = pl_diff and pl_poly;
	pl_gate = pl_gate inside layer_names["LOWVTP"];
	pl_sd = pl_diff not pl_gate;
	pl_l = pl_gate not_touching_edge pl_sd;
	@ "1.144 Gate Minimum Length (PL) < 0.15";
	length_edge(pl_l, distance < 0.15 ); 			
	@ "1.145 Gate Maximum Length (PL) > 20";
	length_edge(pl_l, distance > 20 ); 			
	pl_l = pl_gate touching_edge pl_sd;
	@ "1.134 Gate Minimum Width (PL) < 0.3";
	length_edge(pl_l, distance < 0.3 ); 			
	@ "1.135 Gate Maximum Width (PL) > 900";
	length_edge(pl_l, distance > 900 ); 			

	pm_diff = layer_names["DIFF"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	pm_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	pm_gate = pm_diff and pm_poly;
	pm_gate = pm_gate inside layer_names["MEDVTP"];
	pm_sd = pm_diff not pm_gate;
	pm_l = pm_gate not_touching_edge pm_sd;
	@ "1.146 Gate Minimum Length (PM) < 0.15";
	length_edge(pm_l, distance < 0.15 ); 			
	@ "1.147 Gate Maximum Length (PM) > 20";
	length_edge(pm_l, distance > 20 ); 			
	pm_l = pm_gate touching_edge pm_sd;
	@ "1.136 Gate Minimum Width (PM) < 0.3";
	length_edge(pm_l, distance < 0.3 ); 			
	@ "1.137 Gate Maximum Width (PM) > 900";
	length_edge(pm_l, distance > 900 ); 			

	ph_diff = layer_names["DIFF"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	ph_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	ph_gate = ph_diff and ph_poly;
	ph_gate = ph_gate inside layer_names["HIGHVTP"];
	ph_sd = ph_diff not ph_gate;
	ph_l = ph_gate not_touching_edge ph_sd;
	@ "1.150 Gate Minimum Length (PH) < 0.15";
	length_edge(ph_l, distance < 0.15 ); 			
	@ "1.151 Gate Maximum Length (PH) > 20";
	length_edge(ph_l, distance > 20 ); 			
	ph_l = ph_gate touching_edge ph_sd;
	@ "1.140 Gate Minimum Width (PH) < 0.3";
	length_edge(ph_l, distance < 0.15 ); 			
	@ "1.141 Gate Maximum Width (PH) > 900";
	length_edge(ph_l, distance > 900 ); 			

	nm_diff = layer_names["DIFF"] inside layer_names["NPLUS"] ;
	nm_poly = layer_names["POLY"] inside layer_names["NPLUS"] ;
	nm_gate = nm_diff and nm_poly;
	nm_gate = nm_gate inside layer_names["MEDVTN"];
	nm_sd = nm_diff not nm_gate;
	nm_l = nm_gate not_touching_edge nm_sd;
	@ "1.171 Gate Minimum Length (NM) < 0.15";
	length_edge(nm_l, distance < 0.15 ); 			
	@ "1.172 Gate Maximum Length (NM) > 20";
	length_edge(nm_l, distance > 20 ); 			
	nm_l = nm_gate touching_edge nm_sd;
	@ "1.155 Gate Minimum Width (NM) < 0.3";
	length_edge(nm_l, distance < 0.15 ); 			
	@ "1.156 Gate Maximum Width (NM) > 900";
	length_edge(nm_l, distance > 900 ); 			

	n18_diff = layer_names["DIFF"] inside layer_names["NPLUS"] inside layer_names["DIFF18"];
	n18_poly = layer_names["POLY"] inside layer_names["NPLUS"] inside layer_names["DIFF18"];
	n18_gate = n18_diff and n18_poly;
	n18_sd = n18_diff not n18_gate;
	n18_l = n18_gate not_touching_edge n18_sd;
	@ "1.175 Gate Minimum Length (N18) < 0.28";
	length_edge(n18_l, distance < 0.28 ); 			
	@ "1.176 Gate Maximum Length (N18) > 900";
	length_edge(n18_l, distance > 900 ); 			
	n18_l = n18_gate touching_edge n18_sd;
	@ "1.155 Gate Minimum Width (N18) < 0.4";
	length_edge(n18_l, distance < 0.4 ); 			
	@ "1.156 Gate Maximum Width (N18) > 900";
	length_edge(n18_l, distance > 900 ); 			
	
	na18_diff = layer_names["DIFF"] inside layer_names["NPLUS"] inside layer_names["NAT"] inside layer_names["DIFF18"];
	na18_poly = layer_names["POLY"] inside layer_names["NPLUS"] inside layer_names["NAT"] inside layer_names["DIFF18"];
	na18_gate = na18_diff and na18_poly;
	na18_sd = na18_diff not na18_gate;
	na18_l = na18_gate not_touching_edge na18_sd;
	@ "1.177 Gate Minimum Length (NA18) < 1.2";
	length_edge(na18_l, distance < 1.2 ); 			
	@ "1.178 Gate Maximum Length (NA18) > 900";
	length_edge(na18_l, distance > 900 ); 			
	na18_l = na18_gate touching_edge na18_sd;
	@ "1.26 Gate Minimum Width (NA18) < 0.5";
	length_edge(na18_l, distance < 0.5 ); 			
	@ "1.27 Gate Maximum Width (NA18) > 900";
	length_edge(na18_l, distance > 900 ); 			
	
	nl_diff = layer_names["DIFF"] inside layer_names["NPLUS"] ;
	nl_poly = layer_names["POLY"] inside layer_names["NPLUS"] ;
	nl_gate = nl_diff and nl_poly;
	nl_gate = nl_gate inside layer_names["LOWVTN"];
	nl_sd = nl_diff not nl_gate;
	nl_l = nl_gate not_touching_edge nl_sd;
	@ "1.179 Gate Minimum Length (NL) < 0.15";
	length_edge(nl_l, distance < 0.15 ); 			
	@ "1.180 Gate Maximum Length (NL) > 20";
	length_edge(nl_l, distance > 20 ); 			
	nl_l = nl_gate touching_edge nl_sd;
	@ "1.159 Gate Minimum Width (NL) < 0.3";
	length_edge(nl_l, distance < 0.3 ); 			
	@ "1.160 Gate Maximum Width (NL) > 900";
	length_edge(nl_l, distance > 900 ); 			
	
	nh_diff = layer_names["DIFF"] inside layer_names["NPLUS"] ;
	nh_poly = layer_names["POLY"] inside layer_names["NPLUS"] ;
	nh_gate = nh_diff and nh_poly;
	nh_gate = nh_gate inside layer_names["HIGHVTN"];
	nh_sd = nh_diff not nh_gate;
	nh_l = nh_gate not_touching_edge nh_sd;
	@ "1.185 Gate Minimum Length (NH) < 0.15";
	length_edge(nh_l, distance < 0.15 ); 			
	@ "1.186 Gate Maximum Length (NH) > 20";
	length_edge(nh_l, distance > 20 ); 			
	nh_l = nh_gate touching_edge nh_sd;
	@ "1.166 Gate Minimum Width (NH) < 0.3";
	length_edge(nh_l, distance < 0.3 ); 			
	@ "1.167 Gate Maximum Width (NH) > 900";
	length_edge(nh_l, distance > 900 ); 			
	
	p_diff = layer_names["DIFF"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	p_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	p_gate = p_diff and p_poly;
	p_gate = p_gate not ph_gate not pl_gate not pm_gate not p18_gate;
	p_sd = p_diff not p_gate;
	p_l = p_gate not_touching_edge p_sd;
	@ "1.16 Minimum length of gate(P) < 0.1";
	length_edge(p_l, distance < 0.1 ); 			
	@ "1.17 Maximum length of gate(P) > 20";
	length_edge(p_l, distance > 20 ); 			
	p_l = p_gate touching_edge p_sd;
	@ "1.12 Minimum Width of gate(P) < 0.12";
	length_edge(p_l, distance < 0.12 ); 			
	@ "1.13 Maximum Width of gate(P) > 900";
	length_edge(p_l, distance > 900 ); 			
	
	na_diff = layer_names["DIFF"] inside layer_names["NPLUS"] inside layer_names["NAT"] ;
	na_poly = layer_names["POLY"] inside layer_names["NPLUS"] inside layer_names["NAT"] ;
	na_gate = na_diff and na_poly;
	na_sd = na_diff not na_gate;
	na_l = na_gate not_touching_edge na_sd;
	@ "1.32 Gate Minimum Length (NA) < 0.2";
	length_edge(na_l, distance < 0.2 ); 			
	@ "1.33 Gate Maximum Length (NA) > 20";
	length_edge(na_l, distance > 20 ); 			
	na_l = na_gate touching_edge na_sd;
	@ "1.24 Gate Minimum Width (NA) < 0.5";
	length_edge(na_l, distance < 0.5 ); 			
	@ "1.25 Gate Maximum Width (NA) > 900";
	length_edge(na_l, distance > 900 ); 			
	
	n_diff = layer_names["DIFF"] inside layer_names["NPLUS"];
	n_poly = layer_names["POLY"] inside layer_names["NPLUS"];
	n_gate = n_diff and n_poly;
	n_gate = n_gate not nh_gate not nl_gate not nm_gate not n18_gate not na_gate not na18_gate;
	n_sd = n_diff not n_gate;
	n_l = n_gate not_touching_edge n_sd;
	@ "1.28 Minimum length of gate(N) < 0.1";
	length_edge(n_l, distance < 0.1 ); 			
	@ "1.29 Maximum length of gate(N) > 20";
	length_edge(n_l, distance > 20 ); 			
	n_l = n_gate touching_edge n_sd;
	@ "1.20 Minimum Width of gate(N) < 0.12";
	length_edge(n_l, distance < 0.1 ); 			
	@ "1.21 Maximum Width of gate(N) > 900";
	length_edge(n_l, distance > 20 ); 			
};
{
	@ "1.85 Gate to Gate Spacing ( NA18 ) < 0.35";
	na18_diff = layer_names["DIFF"] inside layer_names["NPLUS"] inside layer_names["NAT"] inside layer_names["DIFF18"];
	na18_poly = layer_names["POLY"] inside layer_names["NPLUS"] inside layer_names["NAT"] inside layer_names["DIFF18"];
	na18_gate = na18_diff and na18_poly;
	external1(na18_gate, distance < 0.35 , extension = NONE );
	
	@ "1.84 Gate to Gate Spacing ( NA ) < 0.15";
	na_diff = layer_names["DIFF"] inside layer_names["NPLUS"] inside layer_names["NAT"];
	na_poly = layer_names["POLY"] inside layer_names["NPLUS"] inside layer_names["NAT"];
	na_gate = na_diff and na_poly;
	na_gate = na_gate not na18_gate;
	external1(na_gate, distance < 0.15 , extension = NONE );
	
	@ "1.86 Gate to Gate Spacing ( N18 ) < 0.35";
	n18_diff = layer_names["DIFF"] inside layer_names["NPLUS"] inside layer_names["DIFF18"];
	n18_poly = layer_names["POLY"] inside layer_names["NPLUS"] inside layer_names["DIFF18"];
	n18_gate = n18_diff and n18_poly;
	n18_gate = n18_gate not na18_gate;
	external1(n18_gate, distance < 0.35 , extension = NONE );
	
	@ "1.83 Gate to Gate Spacing ( N NL NH ) < 0.15";
	n_nl_nh_diff = layer_names["DIFF"] inside layer_names["NPLUS"];
	n_nl_nh_poly = layer_names["POLY"] inside layer_names["NPLUS"];
	n_nl_nh_gate = n_nl_nh_diff and n_nl_nh_poly;	
	n_nl_nh_gate = n_nl_nh_gate not na_gate not na18_gate not n18_gate;	
	external1(n_nl_nh_gate, distance < 0.15 , extension = NONE );

	@ "1.88 Gate to Gate Spacing ( P18 ) < 0.35";
	p18_diff = layer_names["DIFF"] inside layer_names["PPLUS"] inside layer_names["DIFF18"];
	p18_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["DIFF18"];
	p18_gate = p18_diff and p18_poly;	
	external1(p18_gate, distance < 0.35 , extension = NONE );

	@ "1.87 Gate to Gate Spacing ( P PL PH PM ) < 0.15";
	p_pl_ph_pm_diff = layer_names["DIFF"] inside layer_names["PPLUS"];
	p_pl_ph_pm_poly = layer_names["POLY"] inside layer_names["PPLUS"];
	p_pl_ph_pm_gate = p_pl_ph_pm_diff and p_pl_ph_pm_poly;	
	p_pl_ph_pm_gate = p_pl_ph_pm_gate not p18_gate;	
	external1(p_pl_ph_pm_gate, distance < 0.15 , extension = NONE );

	@ "1.7 Gate (PolySilicon over Diffusion) minimum spacing to Gate < 0.15";
	gate = layer_names["POLY"] and layer_names["DIFF"];
	gate = gate not na18_gate not na_gate not n18_gate not n_nl_nh_gate not p18_gate not p_pl_ph_pm_gate;
  	external1(gate, distance < 0.15, extension = NONE ); 
};
{
	@ "1.893 High Vt to N/P Gate Enclosure < 0.12";
	highvtn = layer_names["HIGHVTN"] inside layer_names["NPLUS"];
	highvtp = layer_names["HIGHVTP"] inside layer_names["PPLUS"];
	nplus = layer_names["NPLUS"] enclosing highvtn;
	pplus = layer_names["PPLUS"] enclosing highvtp;		
	p_diff = layer_names["DIFF"] inside pplus inside layer_names["NWELL"];
	p_poly = layer_names["POLY"] inside pplus inside layer_names["NWELL"];
	p_gate = p_diff and p_poly;	
	n_diff = layer_names["DIFF"] inside layer_names["NPLUS"];
	n_poly = layer_names["POLY"] inside layer_names["NPLUS"];
	n_gate = n_diff and n_poly;
	enclose(n_gate, highvtn, distance < 0.12, extension = NONE );
	enclose(p_gate, highvtp, distance < 0.12, extension = NONE );

	@ "1.892 Low Vt to N/P Gate Enclosure < 0.12";
	lowvtn = layer_names["LOWVTN"] inside layer_names["NPLUS"];
	lowvtp = layer_names["LOWVTP"] inside layer_names["PPLUS"];
	nplus = layer_names["NPLUS"] enclosing lowvtn;
	pplus = layer_names["PPLUS"] enclosing lowvtp;		
	p_diff = layer_names["DIFF"] inside pplus inside layer_names["NWELL"];
	p_poly = layer_names["POLY"] inside pplus inside layer_names["NWELL"];
	p_gate = p_diff and p_poly;	
	n_diff = layer_names["DIFF"] inside layer_names["NPLUS"];
	n_poly = layer_names["POLY"] inside layer_names["NPLUS"];
	n_gate = n_diff and n_poly;
	enclose(n_gate, lowvtn, distance < 0.12, extension = NONE );
	enclose(p_gate, lowvtp, distance < 0.12, extension = NONE );

	@ "1.891 Medium Vt to N/P Gate Enclosure < 0.12";
	medvtn = layer_names["MEDVTN"] inside layer_names["NPLUS"];
	medvtp = layer_names["MEDVTP"] inside layer_names["PPLUS"];
	nplus = layer_names["NPLUS"] enclosing medvtn;
	pplus = layer_names["PPLUS"] enclosing medvtp;		
	p_diff = layer_names["DIFF"] inside pplus inside layer_names["NWELL"];
	p_poly = layer_names["POLY"] inside pplus inside layer_names["NWELL"];
	p_gate = p_diff and p_poly;	
	n_diff = layer_names["DIFF"] inside layer_names["NPLUS"];
	n_poly = layer_names["POLY"] inside layer_names["NPLUS"];
	n_gate = n_gate and n_poly;
	enclose(n_gate, medvtn, distance < 0.12, extension = NONE );
	enclose(p_gate, medvtp, distance < 0.12, extension = NONE );
	
};
{

	@ "1.889 Polysilicon to Diffusion spacing (NM PM) < 0.10";
	medvtn = layer_names["MEDVTN"] inside layer_names["NPLUS"];
	medvtp = layer_names["MEDVTP"] inside layer_names["PPLUS"];
	nplus = layer_names["NPLUS"] enclosing medvtn;
	pplus = layer_names["PPLUS"] enclosing medvtp;		
	p_diff = layer_names["DIFF"] inside pplus inside layer_names["NWELL"];
	p_poly = layer_names["POLY"] inside pplus inside layer_names["NWELL"];
	n_diff = layer_names["DIFF"] inside nplus;
	n_poly = layer_names["POLY"] inside nplus;
	external2(p_diff,p_poly, distance < 0.10 , extension = NONE  ,look_thru = COINCIDENT);
	external2(n_diff,n_poly, distance < 0.10 , extension = NONE  ,look_thru = COINCIDENT);

	@ "1.12 Polysilicon to diffusion spacing (N NL NH) < 0.10";
	lowvtn = layer_names["LOWVTN"] inside layer_names["NPLUS"];
	nplus = layer_names["NPLUS"] enclosing lowvtn;
	n_diff = layer_names["DIFF"] inside nplus;
	n_poly = layer_names["POLY"] inside nplus;
	external2(n_diff,n_poly, distance < 0.10 , extension = NONE ,look_thru = COINCIDENT);
	highvtn = layer_names["HIGHVTN"] inside layer_names["NPLUS"];
	nplus = layer_names["NPLUS"] enclosing highvtn;
	n_diff = layer_names["DIFF"] inside nplus;
	n_poly = layer_names["POLY"] inside nplus;
	external2(n_diff,n_poly, distance < 0.10 , extension = NONE ,look_thru = COINCIDENT );
	nplus = layer_names["NPLUS"] ;
	n_diff = layer_names["DIFF"] inside nplus not lowvtn not medvtn not highvtn;
	n_poly = layer_names["POLY"] inside nplus not lowvtn not medvtn not highvtn;
	external2(n_diff,n_poly, distance < 0.10 , extension = NONE ,look_thru = COINCIDENT );
	
	@ "1.13 Polysilicon to diffusion spacing (for NA Model Device) < 0.10";
	nplus = layer_names["NPLUS"] inside layer_names["NAT"];
	n_diff = layer_names["DIFF"] inside nplus;
	n_poly = layer_names["POLY"] inside nplus;
	external2(n_diff,n_poly, distance < 0.10 , extension = NONE  ,look_thru = COINCIDENT);
	
	@ "1.14 Polysilicon to diffusion spacing (N18) < 0.10";
	nplus = layer_names["NPLUS"] inside layer_names["DIFF18"];
	n_diff = layer_names["DIFF"] inside nplus;
	n_poly = layer_names["POLY"] inside nplus;
	external2(n_diff,n_poly, distance < 0.10 , extension = NONE  ,look_thru = COINCIDENT);
	
	@ "1.17 Polysilicon to diffusion spacing (P PL) < 0.10";
	lowvtp = layer_names["LOWVTP"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	pplus = layer_names["PPLUS"] enclosing lowvtp;
	p_diff = layer_names["DIFF"] inside pplus;
	p_poly = layer_names["POLY"] inside pplus;
	external2(p_diff,p_poly, distance < 0.10 , extension = NONE  ,look_thru = COINCIDENT);
	p_diff = layer_names["DIFF"] inside pplus not lowvtp not layer_names["MEDVTP"] not layer_names["HIGHVTP"];
	p_poly = layer_names["POLY"] inside pplus not lowvtp not layer_names["MEDVTP"] not layer_names["HIGHVTP"];
	external2(p_diff,p_poly, distance < 0.10 , extension = NONE  ,look_thru = COINCIDENT);
	
	@ "1.16 Polysilicon to diffusion spacing (P18) < 0.10";
	pplus = layer_names["PPLUS"] inside layer_names["NWELL"] inside layer_names["DIFF18"];
	p_diff = layer_names["DIFF"] inside pplus;
	p_poly = layer_names["POLY"] inside pplus;
	external2(p_diff,p_poly, distance < 0.10 , extension = NONE  ,look_thru = COINCIDENT);
	
	@ "1.17.1 Polysilicon to diffusion spacing (PH NM) < 0.11";
	medvtn = layer_names["MEDVTN"] inside layer_names["NPLUS"];
	nplus = layer_names["NPLUS"] enclosing medvtn;
	n_diff = layer_names["DIFF"] inside nplus;
	n_poly = layer_names["POLY"] inside nplus;
	external2(n_diff,n_poly, distance < 0.11 , extension = NONE );
	highvtp = layer_names["HIGHVTP"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	pplus = layer_names["PPLUS"] enclosing highvtp;
	p_diff = layer_names["DIFF"] inside pplus;
	p_poly = layer_names["POLY"] inside pplus;
	external2(p_diff,p_poly, distance < 0.11 , extension = NONE  ,look_thru = COINCIDENT);

};
{
	@ "1.187 Enclosure of Diffusion within 18Volt(DIFF 18) < 0.30";
	diff = layer_names["DIFF"] inside layer_names["DIFF18"];
	diff18 = layer_names["DIFF18"] enclosing layer_names["DIFF18"];
	enclose(diff, diff18, distance < 0.30, extension = NONE );
};
{
	@ "1.21 Extension of poly beyond diffusion layer(end cap) of Native MOS < 0.22";
	na_diff = layer_names["DIFF"] inside layer_names["NPLUS"] inside layer_names["NAT"] ;
	na_poly = layer_names["POLY"] inside layer_names["NPLUS"] inside layer_names["NAT"] ;
	na_gate = na_diff and na_poly;
	na_poly = na_poly not na_gate;	
//	l_edges = na_poly not_touching_edge layer_names["NPLUS"];	
	l_edges = na_poly interacting_edge na_gate;	
	l_edges = not_edge(l_edges,na_gate,coincident = false) ;	
	length_edge(l_edges, distance < 0.22 ); 		

	@ "1.22 Extension of poly beyond diffusion layer(end cap) of HV MOS < 0.16";
	highvtp = layer_names["HIGHVTP"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	pplus = layer_names["PPLUS"] enclosing highvtp;
	ph_diff = layer_names["DIFF"] inside pplus;
	ph_poly = layer_names["POLY"] inside pplus;
	ph_gate = ph_poly and ph_diff;	
	ph_poly = ph_poly not ph_gate;
//	l_edges = ph_poly not_touching_edge layer_names["PPLUS"];	
	l_edges = ph_poly interacting_edge ph_gate;	
	l_edges = not_edge(l_edges,ph_gate,coincident = false) ;	
	length_edge(l_edges, distance < 0.16 ); 		
	highvtn = layer_names["HIGHVTN"] inside layer_names["NPLUS"];
	nplus = layer_names["NPLUS"] enclosing highvtn;
	nh_diff = layer_names["DIFF"] inside nplus;
	nh_poly = layer_names["POLY"] inside nplus;
	nh_gate = nh_poly and nh_diff;	
	nh_poly = nh_poly not nh_gate;
	l_edges = nh_poly not_touching_edge layer_names["NPLUS"];	
	l_edges = not_edge(l_edges,nh_gate,coincident = false) ;	
	length_edge(l_edges, distance < 0.16 ); 		
		
	@ "1.20 Extension of poly beyond diffusion layer(end cap) of standard MOS < 0.13";
	p_diff = layer_names["DIFF"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	p_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	p_gate = p_diff and p_poly;
	p_poly = p_poly not p_gate;
	p_poly = p_poly not ph_poly;
//	l_edges = p_poly not_touching_edge layer_names["PPLUS"];	
	l_edges = p_poly interacting_edge p_gate;	
	l_edges = not_edge(l_edges,p_gate,coincident = false) ;	
	length_edge(l_edges, distance < 0.13 ); 		
	n_diff = layer_names["DIFF"] inside layer_names["NPLUS"];
	n_poly = layer_names["POLY"] inside layer_names["NPLUS"];
	n_gate = n_diff and n_poly;
	n_poly = n_poly not n_gate;
	n_poly = n_poly not na_poly not nh_poly;
	n_edges = n_poly not_touching_edge layer_names["NPLUS"];	
	l_edges = not_edge(l_edges,n_gate,coincident = false) ;	
	length_edge(l_edges, distance < 0.13 ); 		
};

{
	@ "1.123 PPLUS enclosure of DIFF in an NWELL strap < 0.02";
	nwell_strap = (( layer_names["NPLUS"] enclosing layer_names["DIFF"] enclosing layer_names["M1"] enclosing layer_names["CONT"] ) inside layer_names["NWELL"] ) not_enclosing layer_names["POLY"];
	diff = layer_names["DIFF"] inside nwell_strap;
	nplus = layer_names["NPLUS"] and nwell_strap; 
	enclose(diff, nplus, distance < 0.02, extension = NONE );
	@ "1.124 NPLUS enclosure of DIFF in an PWELL strap < 0.02";
	pwell_strap = ( layer_names["PPLUS"] enclosing layer_names["DIFF"] enclosing layer_names["M1"] enclosing layer_names["CONT"] ) not_enclosing layer_names["POLY"]; 
	diff = layer_names["DIFF"] inside pwell_strap;
	pplus = layer_names["PPLUS"] and pwell_strap; 
	enclose(diff, pplus, distance < 0.02, extension = NONE );

	@ "1.122 Tap Contact to MOS diffusion spacing < 0.06";
	nwell_strap = (( layer_names["NPLUS"] enclosing layer_names["DIFF"] enclosing layer_names["M1"] enclosing layer_names["CONT"] ) inside layer_names["NWELL"] ) not_enclosing layer_names["POLY"];
	tap_cont = layer_names["CONT"] inside nwell_strap;
	mos_diff = (layer_names["DIFF"] inside ( layer_names["PPLUS"] inside layer_names["NWELL"] )) interacting layer_names["POLY"];	
	external2(tap_cont,mos_diff, distance < 0.06 , extension = NONE );
	pwell_strap = ( layer_names["PPLUS"] enclosing layer_names["DIFF"] enclosing layer_names["M1"] enclosing layer_names["CONT"] ) not_enclosing layer_names["POLY"]; 
	tap_cont = layer_names["CONT"] inside pwell_strap;
	mos_diff = (layer_names["DIFF"] inside layer_names["NPLUS"] ) interacting layer_names["POLY"];	
	external2(tap_cont,mos_diff, distance < 0.06 , extension = NONE );
	
	@ "1.121 Source/Drain Contact to tap diffusion spacing < 0.06";
	sd_cont_n = layer_names["CONT"] inside layer_names["M1"] inside (layer_names["DIFF"] interacting layer_names["POLY"]) inside layer_names["NPLUS"];
	tap_diff = ( layer_names["DIFF"] not_interacting layer_names["POLY"] ) inside layer_names["PPLUS"] ;
	external2(sd_cont_n,tap_diff, distance < 0.06 , extension = NONE );
	@ "1.121 Source/Drain Contact to tap diffusion spacing < 0.06";
	sd_cont_p = layer_names["CONT"] inside layer_names["M1"] inside (layer_names["DIFF"] interacting layer_names["POLY"]) inside layer_names["PPLUS"] inside layer_names["NWELL"];
	tap_diff = ( layer_names["DIFF"] not_interacting layer_names["POLY"] ) inside layer_names["NPLUS"] inside layer_names["NWELL"];
	external2(sd_cont_p,tap_diff, distance < 0.06 , extension = NONE );

};

{
	@ "1.41 Gate to Contact spacing for Non-Dogbone structure(N P) < 0.08";	
	p_diff = layer_names["DIFF"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	p_poly = layer_names["POLY"] inside layer_names["PPLUS"] inside layer_names["NWELL"];
	p_gate = p_diff and p_poly;
	p_diff = p_diff not p_gate;
	cont_diff = (layer_names["DIFF"] enclosing layer_names["M1"] enclosing layer_names["CONT"]) and p_diff;
	p_cont = layer_names["CONT"] inside layer_names["M1"] inside cont_diff;
	rect = rectangles(cont_diff);
	rect = rect enclosing (layer_names["M1"] enclosing layer_names["CONT"]);
	p_diff = outside_touching(rect, p_gate , count = 1 );
	p_cont = p_cont inside p_diff;
	external2(p_gate,p_cont, distance < 0.08 , extension = NONE );
	n_diff = layer_names["DIFF"] inside layer_names["NPLUS"];
	n_poly = layer_names["POLY"] inside layer_names["NPLUS"];
	n_gate = n_diff and n_poly;
	n_diff = n_diff not n_gate;
	cont_diff = (layer_names["DIFF"] enclosing layer_names["M1"] enclosing layer_names["CONT"]) and n_diff;
	n_cont = layer_names["CONT"] inside layer_names["M1"] inside cont_diff;
	rect = rectangles(cont_diff);
	rect = rect enclosing (layer_names["M1"] enclosing layer_names["CONT"]);
	n_diff = outside_touching(rect, n_gate , count = 1 );
	n_cont = n_cont inside n_diff;
	external2(n_gate,n_cont, distance < 0.08 , extension = NONE );
	
};
{
	@ "1.35 Minimum Area of a poly hole formed in MOSFET < 0.2";	
	p_poly = layer_names["POLY"] inside layer_names["PPLUS"];
	p_holes = donut_holes(p_poly);
	p_holes = p_holes interacting (layer_names["DIFF"] enclosing layer_names["M1"] enclosing layer_names["CONT"]);
	area(p_holes,value < 0.2);		
	n_poly = layer_names["POLY"] inside layer_names["NPLUS"];
	n_holes = donut_holes(n_poly);
	n_holes = n_holes interacting (layer_names["DIFF"] enclosing layer_names["M1"] enclosing layer_names["CONT"]);
	area(n_holes,value < 0.2);		
};

}



if ( dump_cap_rules )
{

//Capacitor Design Rules
{
	@ "4.1 Minimum width of a Capacitor top plate (MTCAP) < 1.0";
	ctm = layer_names["CTM"] inside layer_names["CBM"] inside layer_names["CTMDMY"];
	internal1(ctm,distance < 1 , extension = NONE );	 
	
	@ "4.2 Maximum width of a Capacitor top plate (MTCAP) > 100.0";
	ctm = layer_names["CTM"] inside layer_names["CBM"] inside layer_names["CTMDMY"];
	cor = internal1(ctm,distance = (0,100] , extension = NONE );
	ctm not cor;
	
	@ "4.3 Enclosure of Via within the Capacitor layer < 0.24";
	ctm = layer_names["CTM"] inside layer_names["CBM"] inside layer_names["CTMDMY"];
	v8 = layer_names["V8"] inside ctm;
	enclose(v8, ctm, distance < 0.24, extension = NONE );
	
	@ "4.5 Enclosure of (Via within Capacitor layer) within M9(top metal) < 0.06";
	ctm = layer_names["CTM"] inside layer_names["CBM"] inside layer_names["CTMDMY"];
	v8 = layer_names["V8"] inside ctm;
	m9 = layer_names["M9"];
	enclose(v8, m9, distance < 0.06, extension = NONE );
	
	@ "4.9 Capacitor Via minimum Width < 0.13";
	ctm = layer_names["CTM"] inside layer_names["CBM"] inside layer_names["CTMDMY"];
	v8 = layer_names["V8"] inside ctm;
	internal1(v8,distance < 0.13 , extension = NONE );	 
	
	@ "4.10 Top Metal Width inside CTM < 0.33";
	ctm = layer_names["CTM"] inside layer_names["CBM"] inside layer_names["CTMDMY"];
	m9 = layer_names["M9"] inside ctm;
	internal1(m9,distance < 0.34 , extension = NONE );	 
	
	@ "4.13 Bottom Metal via Enclose < 0.2";
	cbm = layer_names["CBM"] inside layer_names["CTMDMY"];
	v8 = layer_names["V8"] inside cbm not layer_names["CTM"];
	m9 = layer_names["M9"] inside cbm not layer_names["CTM"];
	enclose(v8, cbm, distance < 0.2, extension = NONE );

	@ "4.14 CTMDMY Enclosure of CBM < 0.1";
	cbm = layer_names["CBM"] inside layer_names["CTMDMY"];
	ctmdmy = layer_names["CTMDMY"] enclosing cbm;
	enclose(cbm, ctmdmy, distance < 0.1, extension = NONE );
	
	@ "4.16 CTM to CTM Spacing < 0.8";
	ctm = layer_names["CTM"] inside layer_names["CBM"] inside layer_names["CTMDMY"];
	external1(ctm, distance < 0.8 , extension = NONE );
	
	@ "4.17 CTM Cap Via Spacing < 0.3";
	cbm = layer_names["CBM"] inside layer_names["CTMDMY"];
	v8 = layer_names["V8"] inside cbm not layer_names["CTM"];
	ctm = layer_names["CTM"] inside layer_names["CBM"] inside layer_names["CTMDMY"];
	external2(ctm,v8, distance < 0.3 , extension = NONE );
	
	@ "4.18 Capacitor Bottom plate Via Spacing < 0.8";
	cbm = layer_names["CBM"] inside layer_names["CTMDMY"];
	v8 = layer_names["V8"] inside cbm not layer_names["CTM"];
	external1(v8, distance < 0.8 , extension = NONE );
	
	@ "4.19 Bottom plate CTM Enclose < 0.4";
	cbm = layer_names["CBM"] inside layer_names["CTMDMY"];
	ctm = layer_names["CTM"] inside layer_names["CBM"] inside layer_names["CTMDMY"];
	enclose(ctm, cbm, distance < 0.4, extension = NONE );

};

}

if ( dump_dio_rules )
{
//DIODE RULES
{
       @ "3.9/3.11 Minimum Width (All NWELL/PSUB device) < 1.1 / Minimum Length(All NWELL/PSUB device) < 1.1";
       nwdiode = (layer_names["DIODE"] enclosing layer_names["NPLUS"] enclosing layer_names["NWELL"]) inside donut_holes(layer_names["PPLUS"]);
       internal1(nwdiode,distance < 1.1 , extension = NONE);
  
       @ "3.1/3.2 Minimum Width (All N+/PWELL device) < 1.1 / Minimum Length(All N+/PWELL device) < 1.1";
       diode = layer_names["DIODE"] inside layer_names["NPLUS"] inside donut_holes(layer_names["PPLUS"]);
       diode = diode not nwdiode; 
       internal1(diode,distance < 1.1 , extension = NONE);
	
       @ "3.3/3.4 Minimum Width (All P+/NWELL device) < 1.1 / Minimum Length(All P+/NWELL device) < 1.1";
       diode = layer_names["DIODE"] inside layer_names["PPLUS"] inside donut_holes(layer_names["NPLUS"]) inside layer_names["NWELL"];
       internal1(diode,distance < 1.1 , extension = NONE);

       @ "3.10/3.12 Maximum Width (All NWELL/PSUB device) > 100  / Maximum Width(All NWELL/PSUB device) > 100";
       nwdiode = (layer_names["DIODE"] enclosing layer_names["NPLUS"] enclosing layer_names["NWELL"]) inside donut_holes(layer_names["PPLUS"]);
       valid_diode = internal1(nwdiode,distance = (0,100] , extension = NONE);
       nwdiode not valid_diode;

       @ "3.5/3.6 Maximum Width (All N+/PWELL device) > 100  / Maximum Length(All N+/PWELL device) > 100";
       diode = layer_names["DIODE"] inside layer_names["NPLUS"] inside donut_holes(layer_names["PPLUS"]);
       diode = diode not nwdiode;
       valid_diode = internal1(diode,distance = (0,100] , extension = NONE);
       diode not valid_diode;

       @ "3.7/3.8 Maximum Width (All P+/NWELL device) > 100 / Maximum Length(All P+/NWELL device) < 100";
       diode = layer_names["DIODE"] inside layer_names["PPLUS"] inside donut_holes(layer_names["NPLUS"]) inside layer_names["NWELL"];
       valid_diode = internal1(diode,distance = (0,100] , extension = NONE);
       diode not valid_diode; 

       @ "3.18 NWELL enclosure of Ntype Diffusion > 0.23";
       diff = layer_names["DIFF"] inside layer_names["NPLUS"];
       enclose(diff, layer_names["NWELL"], distance < 0.23, extension = NONE );

       @ "3.19 NWELL enclsoure of Ptype Diffusion > 0.23";
       diff = layer_names["DIFF"] inside layer_names["PPLUS"];
       enclose(diff, layer_names["NWELL"], distance < 0.23, extension = NONE );
       
       @ "3.17 Maximum Width of M1 ( Wide Metal Value ) < 15";
       metal = layer_names["M1"]; 
       valid_metal = internal1(layer_names["M1"],distance = (0,15] , extension = NONE);
       metal not valid_metal;					
		
};

}



if ( dump_res_rules )
{

//RESISTOR RULES
{
		


};
{
        @ "Spacing between contacts when there is an array of contacts:3 x 3 (row and column >=3) with space <= 0.16 um < 0.15";
	over_under = 0.08;
	cont = layer_names["CONT"];
	sized_vconts = grow(cont,north = over_under,south = over_under); 
	sized_hconts = grow(cont,east = over_under,west = over_under); 
	vbars = cutting(sized_vconts,cont,count >= 3 );
	hbars = cutting(sized_hconts,cont,count >= 3 );
	vbars = vbars interacting hbars;
	hbars = hbars interacting vbars;	
	cont_array = vbars or hbars;
	cont_array = cutting(cont_array,hbars,count >= 3);
	cont_array = cutting(cont_array,vbars,count >= 3);
	conts = cont interacting cont_array;
        external1(conts, distance < 0.15, extension = NONE );
};
{
        @ "Spacing between vias(v1) when there is an array of vias:3 x 3 (row and column >=3) with space <= 0.18 um < 0.17";
	over_under = 0.09;
	via = layer_names["V1"];
	sized_vvias = grow(via,north = over_under,south = over_under); 
	sized_hvias = grow(via,east = over_under,west = over_under); 
	vbars = cutting(sized_vvias,via,count >= 3 );
	hbars = cutting(sized_hvias,via,count >= 3 );
	vbars = vbars interacting hbars;
	hbars = hbars interacting vbars;	
	via_array = vbars or hbars;
	via_array = cutting(via_array,hbars,count >= 3);
	via_array = cutting(via_array,vbars,count >= 3);
	vias = via interacting via_array;
        external1(vias, distance < 0.17, extension = NONE );
};
{
        @ "Spacing between vias(v2) when there is an array of vias:3 x 3 (row and column >=3) with space <= 0.18 um < 0.17";
	over_under = 0.09;
	via = layer_names["V2"];
	sized_vvias = grow(via,north = over_under,south = over_under); 
	sized_hvias = grow(via,east = over_under,west = over_under); 
	vbars = cutting(sized_vvias,via,count >= 3 );
	hbars = cutting(sized_hvias,via,count >= 3 );
	vbars = vbars interacting hbars;
	hbars = hbars interacting vbars;	
	via_array = vbars or hbars;
	via_array = cutting(via_array,hbars,count >= 3);
	via_array = cutting(via_array,vbars,count >= 3);
	vias = via interacting via_array;
        external1(vias, distance < 0.17, extension = NONE );
};
{
        @ "Spacing between vias(v3) when there is an array of vias:3 x 3 (row and column >=3) with space <= 0.18 um < 0.17";
	over_under = 0.09;
	via = layer_names["V3"];
	sized_vvias = grow(via,north = over_under,south = over_under); 
	sized_hvias = grow(via,east = over_under,west = over_under); 
	vbars = cutting(sized_vvias,via,count >= 3 );
	hbars = cutting(sized_hvias,via,count >= 3 );
	vbars = vbars interacting hbars;
	hbars = hbars interacting vbars;	
	via_array = vbars or hbars;
	via_array = cutting(via_array,hbars,count >= 3);
	via_array = cutting(via_array,vbars,count >= 3);
	vias = via interacting via_array;
        external1(vias, distance < 0.17, extension = NONE );
};
{
        @ "Spacing between vias(v4) when there is an array of vias:3 x 3 (row and column >=3) with space <= 0.18 um < 0.17";
	over_under = 0.09;
	via = layer_names["V4"];
	sized_vvias = grow(via,north = over_under,south = over_under); 
	sized_hvias = grow(via,east = over_under,west = over_under); 
	vbars = cutting(sized_vvias,via,count >= 3 );
	hbars = cutting(sized_hvias,via,count >= 3 );
	vbars = vbars interacting hbars;
	hbars = hbars interacting vbars;	
	via_array = vbars or hbars;
	via_array = cutting(via_array,hbars,count >= 3);
	via_array = cutting(via_array,vbars,count >= 3);
	vias = via interacting via_array;
        external1(vias, distance < 0.17, extension = NONE );
};
{
        @ "Spacing between vias(v5) when there is an array of vias:3 x 3 (row and column >=3) with space <= 0.18 um < 0.17";
	over_under = 0.09;
	via = layer_names["V5"];
	sized_vvias = grow(via,north = over_under,south = over_under); 
	sized_hvias = grow(via,east = over_under,west = over_under); 
	vbars = cutting(sized_vvias,via,count >= 3 );
	hbars = cutting(sized_hvias,via,count >= 3 );
	vbars = vbars interacting hbars;
	hbars = hbars interacting vbars;	
	via_array = vbars or hbars;
	via_array = cutting(via_array,hbars,count >= 3);
	via_array = cutting(via_array,vbars,count >= 3);
	vias = via interacting via_array;
        external1(vias, distance < 0.17, extension = NONE );
};
{
        @ "Spacing between vias(v6) when there is an array of vias:3 x 3 (row and column >=3) with space <= 0.18 um < 0.17";
	over_under = 0.09;
	via = layer_names["V6"];
	sized_vvias = grow(via,north = over_under,south = over_under); 
	sized_hvias = grow(via,east = over_under,west = over_under); 
	vbars = cutting(sized_vvias,via,count >= 3 );
	hbars = cutting(sized_hvias,via,count >= 3 );
	vbars = vbars interacting hbars;
	hbars = hbars interacting vbars;	
	via_array = vbars or hbars;
	via_array = cutting(via_array,hbars,count >= 3);
	via_array = cutting(via_array,vbars,count >= 3);
	vias = via interacting via_array;
        external1(vias, distance < 0.17, extension = NONE );
};
{
        @ "Spacing between vias(v7) when there is an array of vias:3 x 3 (row and column >=3) with space <= 0.18 um < 0.17";
	over_under = 0.09;
	via = layer_names["V7"];
	sized_vvias = grow(via,north = over_under,south = over_under); 
	sized_hvias = grow(via,east = over_under,west = over_under); 
	vbars = cutting(sized_vvias,via,count >= 3 );
	hbars = cutting(sized_hvias,via,count >= 3 );
	vbars = vbars interacting hbars;
	hbars = hbars interacting vbars;	
	via_array = vbars or hbars;
	via_array = cutting(via_array,hbars,count >= 3);
	via_array = cutting(via_array,vbars,count >= 3);
	vias = via interacting via_array;
        external1(vias, distance < 0.17, extension = NONE );
};
{
        @ "Spacing between vias(v8) when there is an array of vias:3 x 3 (row and column >=3) with space <= 0.18 um < 0.17";
	over_under = 0.09;
	via = layer_names["V8"];
	sized_vvias = grow(via,north = over_under,south = over_under); 
	sized_hvias = grow(via,east = over_under,west = over_under); 
	vbars = cutting(sized_vvias,via,count >= 3 );
	hbars = cutting(sized_hvias,via,count >= 3 );
	vbars = vbars interacting hbars;
	hbars = hbars interacting vbars;	
	via_array = vbars or hbars;
	via_array = cutting(via_array,hbars,count >= 3);
	via_array = cutting(via_array,vbars,count >= 3);
	vias = via interacting via_array;
        external1(vias, distance < 0.17, extension = NONE );
};
	
{
	@ "RULE: NWELL Space to RPOLY < 0.18";
	nwell = layer_names["NWELL"] interacting layer_names["NWDMY"];
	nwell = nwell interacting layer_names["RPOLY"];
	rpoly = layer_names["RPOLY"];
	external2(nwell,rpoly, distance < 0.18 , extension = NONE ,look_thru = COINCIDENT);
};
}

