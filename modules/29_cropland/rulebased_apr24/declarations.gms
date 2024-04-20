*** |  (C) 2008-2024 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

scalars
 s29_shift number of 5-year age-classes corresponding to current time step length (1)
;


parameters
 p29_avl_cropland(t,j)              Total available land for crop cultivation (mio. ha)
 p29_country_snv_weight(i)          SNV policy country weight per region (1)
 p29_snv_shr(t,j)                   Share of semi-natural vegetation in cropland areas (1)
 i29_snv_relocation_target(j)       Overall cropland area that requires relocation due to SNV policy (mio. ha)
 p29_snv_relocation(t,j)            Cropland area that is actually relocated during time step (mio. ha)
 p29_max_snv_relocation(t,j)        Maximum cropland relocation during time step (mio. ha)
 p29_country_dummy(iso)             Dummy parameter indicating whether country is affected by selected cropland policy (1)
 i29_avl_cropland_iso(iso)          Available land area for cropland at ISO level (mio. ha)
 i29_snv_scenario_fader(t_all)      SNV scenario fader (1)

 i29_treecover_scenario_fader(t_all)   Cropland treecover scenario fader (1)
 i29_treecover_target(t,j)             Target share for treecover on total cropland (1)

 p29_treecover_bii_coeff(bii_class_secd,potnatveg)  BII coefficient for cropland treecover (1)
 p29_carbon_density_ac(t,j,ac,ag_pools) Carbon density for ac and ag_pools (tC per ha)
 p29_treecover(t,j,ac)                  Cropland tree cover per age class (mio. ha)
 pc29_treecover(j,ac)                   Cropland tree cover per age class in current time step (mio. ha)

 i29_fallow_scenario_fader(t_all)      Fallow land scenario fader (1)
 i29_fallow_target(t_all)              Target share for fallow land on total cropland (1)
;

positive variables
 vm_fallow(j)                       Fallow land is temporarily fallow cropland (mio. ha)
 v29_treecover(j,ac)                Cropland tree cover per age class (mio. ha)
 vm_cost_cropland(j)                Cost for total cropland (mio. USD05MER per yr)
 v29_cost_treecover_est(j)          Establishment cost for cropland tree cover (mio. USD05MER per yr)
 v29_cost_treecover_recur(j)        Recurring cost for cropland tree cover (mio. USD05MER per yr)
;

equations
 q29_cropland(j)                   Total cropland calculation (mio. ha)
 q29_avl_cropland(j)               Available cropland constraint (mio. ha)
 q29_carbon(j,ag_pools,stockType)  Cropland above ground carbon content calculation (mio. tC)
 q29_land_snv(j)                   Land constraint for the SNV policy in cropland areas (mio. ha)
 q29_land_snv_trans(j)             Land transition constraint for SNV policy in cropland areas (mio. ha)
 q29_cost_cropland(j)              Costs and benefits related to agroforestry (mio. USD05MER per yr)
 q29_cost_treecover_est(j)         Establishment cost for cropland tree cover (mio. USD05MER per yr)
 q29_cost_treecover_recur(j)       Recurring cost for cropland tree cover (mio. USD05MER per yr)
 q29_fallow_shr(j)                 Fallow land minimum share (mio. ha)
 q29_treecover_shr(j)              Cropland treecover minimum share (mio. ha)
 q29_treecover_est(j,ac)           Cropland treecover establishment (mio. ha)
 q29_treecover_bv(j,potnatveg)     Biodiversity value for cropland treecover (mio. ha)
 q29_fallow_bv(j,potnatveg)        Biodiversity value for fallow land (mio. ha)
;

*#################### R SECTION START (OUTPUT DECLARATIONS) ####################
parameters
 ov_fallow(t,j,type)                      Fallow land is temporarily fallow cropland (mio. ha)
 ov29_treecover(t,j,ac,type)              Cropland tree cover per age class (mio. ha)
 ov_cost_cropland(t,j,type)               Cost for total cropland (mio. USD05MER per yr)
 ov29_cost_treecover_est(t,j,type)        Establishment cost for cropland tree cover (mio. USD05MER per yr)
 ov29_cost_treecover_recur(t,j,type)      Recurring cost for cropland tree cover (mio. USD05MER per yr)
 oq29_cropland(t,j,type)                  Total cropland calculation (mio. ha)
 oq29_avl_cropland(t,j,type)              Available cropland constraint (mio. ha)
 oq29_carbon(t,j,ag_pools,stockType,type) Cropland above ground carbon content calculation (mio. tC)
 oq29_land_snv(t,j,type)                  Land constraint for the SNV policy in cropland areas (mio. ha)
 oq29_land_snv_trans(t,j,type)            Land transition constraint for SNV policy in cropland areas (mio. ha)
 oq29_cost_cropland(t,j,type)             Costs and benefits related to agroforestry (mio. USD05MER per yr)
 oq29_cost_treecover_est(t,j,type)        Establishment cost for cropland tree cover (mio. USD05MER per yr)
 oq29_cost_treecover_recur(t,j,type)      Recurring cost for cropland tree cover (mio. USD05MER per yr)
 oq29_fallow_shr(t,j,type)                Fallow land minimum share (mio. ha)
 oq29_treecover_shr(t,j,type)             Cropland treecover minimum share (mio. ha)
 oq29_treecover_est(t,j,ac,type)          Cropland treecover establishment (mio. ha)
 oq29_treecover_bv(t,j,potnatveg,type)    Biodiversity value for cropland treecover (mio. ha)
 oq29_fallow_bv(t,j,potnatveg,type)       Biodiversity value for fallow land (mio. ha)
;
*##################### R SECTION END (OUTPUT DECLARATIONS) #####################

