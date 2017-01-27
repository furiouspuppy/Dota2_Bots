X = {}

X["items"] = {
"item_tango";
"item_stout_shield";
"item_quelling_blade";
"item_bottle";
"item_power_treads";
"item_magic_wand"; 
"item_armlet";
"item_shadow_blade";
"item_black_king_bar";
"item_ultimate_orb";
"item_recipe_silver_edge";
"item_blink";
"item_moon_shard";
"item_assault";
}

-- Set up Skill build
local SKILL_Q = "dragon_knight_breathe_fire";
local SKILL_W = "dragon_knight_dragon_tail";
local SKILL_E = "dragon_knight_dragon_blood";
local SKILL_R = "dragon_knight_elder_dragon_form";    

local ABILITY1  = "special_bonus_strength_6"
local ABILITY2  = "special_bonus_attack_speed_20"
local ABILITY3  = "special_bonus_exp_boost_25"
local ABILITY4  = "special_bonus_attack_damage_40"
local ABILITY5  = "special_bonus_gold_income_20"
local ABILITY6  = "special_bonus_hp_300"
local ABILITY7  = "special_bonus_movement_speed_50"
local ABILITY8  = "special_bonus_unique_dragon_knight"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_E,    SKILL_E,    SKILL_E,
    ABILITY2,   SKILL_R,    SKILL_W,    SKILL_W,    ABILITY4,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X