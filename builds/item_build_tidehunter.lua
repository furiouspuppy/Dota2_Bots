X = {}

X["items"] = {
"item_tango";
"item_tango";
"item_clarity";
"item_clarity";
"item_clarity";
"item_magic_wand";
"item_arcane_boots";
"item_mekansm";
"item_blink"; 
"item_refresher";
"item_heart";
"item_shivas_guard";
"item_black_king_bar";
}

-- Set up Skill build
local SKILL_Q = "tidehunter_gush";
local SKILL_W = "tidehunter_kraken_shell";
local SKILL_E = "tidehunter_anchor_smash";
local SKILL_R = "tidehunter_ravage";    

local ABILITY1  = "special_bonus_attack_damage_50"
local ABILITY2  = "special_bonus_hp_150"
local ABILITY3  = "special_bonus_armor_7"
local ABILITY4  = "special_bonus_exp_boost_30"
local ABILITY5  = "special_bonus_mp_regen_6"
local ABILITY6  = "special_bonus_strength_15"
local ABILITY7  = "special_bonus_cooldown_reduction_20"
local ABILITY8  = "special_bonus_unique_tidehunter"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_E,    SKILL_E,    ABILITY1,
    SKILL_E,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY4,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X