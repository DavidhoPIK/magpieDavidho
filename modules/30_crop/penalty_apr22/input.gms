*** |  (C) 2008-2024 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

$setglobal c30_bioen_type  all
* options: begr, betr, all

$setglobal c30_bioen_water  rainfed
* options: rainfed, irrigated, all

$setglobal c30_rotation_constraints  on
*options: on, off

$setglobal c30_rotation_scenario  default
*options: none, default, legumes, betr500, betr1000, agroecology

$setglobal c30_rotation_scenario_speed  by2050
* options: none, by2030, by2020

scalars
 s30_rotation_scenario_start     Rotation scenario start year      / 2020 /
 s30_rotation_scenario_target    Rotation scenario target year     / 2050 /
;


$ifthen "%c30_bioen_type%" == "all" bioen_type_30(kbe30) = yes;
$else bioen_type_30("%c30_bioen_type%") = yes;
$endif

$ifthen "%c30_bioen_water%" == "all" bioen_water_30(w) = yes;
$else bioen_water_30("%c30_bioen_water%") = yes;
$endif

********* CROPAREA INITIALISATION **********************************************

table fm_croparea(t_all,j,w,kcr) Different croparea type areas (mio. ha)
$ondelim
$include "./modules/30_crop/penalty_apr22/input/f30_croparea_w_initialisation.cs3"
$offdelim
;
m_fillmissingyears(fm_croparea,"j,w,kcr");

********* CROP-ROTATIONAL CONSTRAINT *******************************************

table f30_rotation_incentives(rota30,rotascen30) penalties for violating rotation rules (USD05MER)
$ondelim
$include "./modules/30_crop/penalty_apr22/input/f30_rotation_incentives.csv"
$offdelim
;

parameter f30_rotation_rules(rota30) Rotation min or max shares (1)
/
$ondelim
$include "./modules/30_crop/penalty_apr22/input/f30_rotation_rules.csv"
$offdelim
/
;

