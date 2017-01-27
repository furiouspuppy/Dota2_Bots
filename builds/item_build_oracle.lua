X = {}

X["items"] = {
"item_tango";
"item_clarity";
"item_wind_lace";
"item_arcane_boots";
"item_magic_wand";
"item_aether_lens";
"item_euls";
"item_dagon_5";
"item_ultimate_scepter";
"item_octarine_core";
}

-- Set up Skill build
local SKILL_Q = "oracle_fortunes_end";
local SKILL_W = "oracle_fates_edict";
local SKILL_E = "oracle_purifying_flames";
local SKILL_R = "oracle_false_promise";    

local ABILITY1  = "special_bonus_respawn_reduction_20"
local ABILITY2  = "special_bonus_exp_boost_15"
local ABILITY3  = "special_bonus_hp_200"
local ABILITY4  = "special_bonus_gold_income_10"
local ABILITY5  = "special_bonus_movement_speed_25"
local ABILITY6  = "special_bonus_intelligence_20"
local ABILITY7  = "special_bonus_cast_range_250"
local ABILITY8  = "special_bonus_unique_oracle"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_E,    SKILL_W,    SKILL_E,
    SKILL_R,    SKILL_E,    SKILL_Q,    SKILL_Q,    ABILITY2,
    SKILL_Q,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY4,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X