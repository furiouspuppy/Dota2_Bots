X = {}

X["items"] = {
"item_tango";
"item_tranquil_boots";
"item_mekansm";
"item_veil_of_discord";
"item_ultimate_scepter"; 
"item_aether_lens";
"item_force_staff";
}

-- Set up Skill build
local SKILL_Q = "lich_frost_nova";
local SKILL_W = "lich_frost_armor";
local SKILL_E = "lich_dark_ritual";
local SKILL_R = "lich_chain_frost";    

local ABILITY1  = "special_bonus_hp_125"
local ABILITY2  = "special_bonus_movement_speed_15"
local ABILITY3  = "special_bonus_cast_range_100"
local ABILITY4  = "special_bonus_all_stats_5"
local ABILITY5  = "special_bonus_attack_damage_150"
local ABILITY6  = "special_bonus_gold_income_20"
local ABILITY7  = "special_bonus_unique_lich_1"
local ABILITY8  = "special_bonus_unique_lich_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_E,    SKILL_Q,    SKILL_E,    SKILL_Q,    SKILL_E,
    SKILL_R,    SKILL_Q,    SKILL_Q,    SKILL_W,    ABILITY2,
    SKILL_W,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY3,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X