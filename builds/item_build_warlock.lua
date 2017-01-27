X = {}

X["items"] = {
"item_tango";
"item_ring_of_basilius";
"item_arcane_boots";
"item_drums_of_endurance";
"item_mekansm"; 
"item_ultimate_scepter";
"item_refresher";
"item_dagon_5";
"item_recipe_guardian_greaves";
"item_octarine_core";
}

-- Set up Skill build
local SKILL_Q = "warlock_fatal_bonds";
local SKILL_W = "warlock_shadow_word";
local SKILL_E = "warlock_upheaval";
local SKILL_R = "warlock_rain_of_chaos";    

local ABILITY1  = "special_bonus_exp_boost_15"
local ABILITY2  = "special_bonus_all_stats_6"
local ABILITY3  = "special_bonus_cast_range_125"
local ABILITY4  = "special_bonus_movement_speed_20"
local ABILITY5  = "special_bonus_hp_350"
local ABILITY6  = "special_bonus_respawn_reduction_30"
local ABILITY7  = "special_bonus_unique_warlock_1"
local ABILITY8  = "special_bonus_unique_warlock_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_W,    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_W,
    SKILL_R,    SKILL_W,    SKILL_Q,    SKILL_Q,    ABILITY1,
    SKILL_E,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY3,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X