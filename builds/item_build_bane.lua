X = {}

X["items"] = {
"item_tango";
"item_clarity";
"item_wind_lace";
"item_arcane_boots";
"item_magic_wand";
"item_glimmer_cape"; 
"item_aether_lens";
"item_force_staff";
"item_rod_of_atos";
"item_ultimate_scepter";
}

-- Set up Skill build
local SKILL_Q = "bane_enfeeble";
local SKILL_W = "bane_brain_sap";
local SKILL_E = "bane_nightmare";
local SKILL_R = "bane_fiends_grip";    

local ABILITY1  = "special_bonus_armor_6"
local ABILITY2  = "special_bonus_mp_200"
local ABILITY3  = "special_bonus_hp_250"
local ABILITY4  = "special_bonus_exp_boost_25"
local ABILITY5  = "special_bonus_movement_speed_35"
local ABILITY6  = "special_bonus_cast_range_175"
local ABILITY7  = "special_bonus_unique_bane_1"
local ABILITY8  = "special_bonus_unique_bane_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_E,    SKILL_W,    SKILL_W,    SKILL_E,    SKILL_W,
    SKILL_R,    SKILL_W,    SKILL_E,    SKILL_E,    ABILITY2,
    SKILL_Q,   	SKILL_R,    SKILL_Q,    SKILL_Q,    ABILITY4,
    SKILL_Q,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X