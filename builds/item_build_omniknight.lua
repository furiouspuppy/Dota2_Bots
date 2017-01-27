X = {}

X["items"] = {
"item_tango";
"item_stout_shield";
"item_flask";
"item_arcane_boots";
"item_magic_wand";
"item_aether_lens";
"item_mekansm";
"item_ultimate_scepter";
"item_blink";
"item_recipe_guardian_greaves";
}

-- Set up Skill build
local SKILL_Q = "omniknight_purification";
local SKILL_W = "omniknight_repel";
local SKILL_E = "omniknight_degen_aura";
local SKILL_R = "omniknight_guardian_angel";    

local ABILITY1  = "special_bonus_gold_income_10"
local ABILITY2  = "special_bonus_exp_boost_15"
local ABILITY3  = "special_bonus_cast_range_75"
local ABILITY4  = "special_bonus_strength_8"
local ABILITY5  = "special_bonus_attack_damage_100"
local ABILITY6  = "special_bonus_mp_regen_6"
local ABILITY7  = "special_bonus_unique_omniknight_1"
local ABILITY8  = "special_bonus_unique_omniknight_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_E,    SKILL_Q,    SKILL_R,    SKILL_W,    ABILITY1,
    SKILL_W,   	SKILL_R,    SKILL_W,    SKILL_E,    ABILITY3,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X