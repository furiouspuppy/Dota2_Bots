X = {}

X["items"] = {
"item_tango";
"item_branches";--magic wand
"item_branches";--magic wand
"item_magic_stick";--magic wand
"item_stout_shield";  -- vangaurd
"item_circlet";--magic wand
"item_boots"; -- phase boots
"item_bottle"; 
"item_blades_of_attack"; -- phase boots
"item_blades_of_attack"; -- phase boots
"item_ring_of_regen"; -- force staff
"item_staff_of_wizardry";-- force staff
"item_recipe_force_staff"; -- force staff
"item_ring_of_health"; -- hood of defiance
"item_cloak"; -- hood of defiance
"item_ring_of_regen"; -- hood of defiance
"item_ring_of_health"; -- vangaurd
"item_vitality_booster"; -- vangaurd
"item_blade_of_alacrity"; -- aghs
"item_ogre_axe";-- aghs
"item_point_booster";-- aghs
"item_staff_of_wizardry";-- aghs
}

-- Set up Skill build
local SKILL_Q = "rattletrap_battery_assault";
local SKILL_W = "rattletrap_power_cogs";
local SKILL_E = "rattletrap_rocket_flare";
local SKILL_R = "rattletrap_hookshot";    

local ABILITY1  = "special_bonus_armor_4"
local ABILITY2  = "special_bonus_mp_200"
local ABILITY3  = "special_bonus_attack_damage_40"
local ABILITY4  = "special_bonus_movement_speed_15"
local ABILITY5  = "special_bonus_respawn_reduction_25"
local ABILITY6  = "special_bonus_magic_resistance_12"
local ABILITY7  = "special_bonus_hp_400"
local ABILITY8  = "special_bonus_unique_clockwerk"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_E,    SKILL_Q,    SKILL_E,    SKILL_W,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_Q,    SKILL_E,    SKILL_E,
    SKILL_W,    SKILL_R,    SKILL_W,    SKILL_W,    "-1",
    "-1",    	"-1",   	SKILL_R,   	ABILITY1,   ABILITY3,
    ABILITY6,   "-1",       "-1",       "-1",   	ABILITY8
};

return X