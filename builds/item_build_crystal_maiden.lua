X = {}

X["items"] = {
"item_clarity";
"item_clarity";
"item_tango";
"item_wind_lace";
"item_tranquil_boots";
"item_magic_wand";
"item_blink";
"item_black_king_bar";
"item_ultimate_scepter";
"item_veil_of_discord";
"item_ethereal_blade";
}

-- Set up Skill build
local SKILL_Q = "crystal_maiden_crystal_nova";
local SKILL_W = "crystal_maiden_frostbite";
local SKILL_E = "crystal_maiden_brilliance_aura";
local SKILL_R = "crystal_maiden_freezing_field";    

local ABILITY1  = "special_bonus_magic_resistance_15"
local ABILITY2  = "special_bonus_attack_damage_50"
local ABILITY3  = "special_bonus_cast_range_125"
local ABILITY4  = "special_bonus_hp_200"
local ABILITY5  = "special_bonus_gold_income_20"
local ABILITY6  = "special_bonus_respawn_reduction_35"
local ABILITY7  = "special_bonus_unique_crystal_maiden_1"
local ABILITY8  = "special_bonus_unique_crystal_maiden_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_W,    SKILL_Q,    SKILL_E,    SKILL_Q,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_W,    SKILL_W,    ABILITY1,
    SKILL_W,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY3,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X