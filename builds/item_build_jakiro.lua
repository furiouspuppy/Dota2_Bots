X = {}

X["items"] = {
"item_tango";
"item_wind_lace";
"item_arcane_boots";
"item_magic_wand";
"item_euls"; 
"item_force_staff";
"item_aether_lens";
"item_veil_of_discord";
"item_ultimate_scepter";
}

-- Set up Skill build
local SKILL_Q = "jakiro_dual_breath";
local SKILL_W = "jakiro_ice_path";
local SKILL_E = "jakiro_liquid_fire";
local SKILL_R = "jakiro_macropyre";    

local ABILITY1  = "special_bonus_exp_boost_15"
local ABILITY2  = "special_bonus_spell_amplify_8"
local ABILITY3  = "special_bonus_cast_range_125"
local ABILITY4  = "special_bonus_hp_250"
local ABILITY5  = "special_bonus_attack_range_400"
local ABILITY6  = "special_bonus_gold_income_25"
local ABILITY7  = "special_bonus_respawn_reduction_50"
local ABILITY8  = "special_bonus_unique_jakiro"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_W,    SKILL_E,    SKILL_E,
    SKILL_R,    SKILL_E,    SKILL_Q,    SKILL_Q,    ABILITY2,
    SKILL_Q,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY3,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X