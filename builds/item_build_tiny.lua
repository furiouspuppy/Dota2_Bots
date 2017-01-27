X = {}

X["items"] = {
"item_flask";
"item_stout_shield";
"item_bottle";
"item_power_treads";
"item_magic_wand";
"item_blink"; 
"item_echo_saber";
"item_ultimate_scepter";
"item_black_king_bar";
"item_moon_shard";
"item_manta";
}

-- Set up Skill build
local SKILL_Q = "tiny_avalanche";
local SKILL_W = "tiny_toss";
local SKILL_E = "tiny_craggy_exterior";
local SKILL_R = "tiny_grow";    

local ABILITY1  = "special_bonus_strength_6"
local ABILITY2  = "special_bonus_intelligence_10"
local ABILITY3  = "special_bonus_attack_damage_45"
local ABILITY4  = "special_bonus_movement_speed_15"
local ABILITY5  = "special_bonus_attack_speed_25"
local ABILITY6  = "special_bonus_mp_regen_14"
local ABILITY7  = "special_bonus_cooldown_reduction_20"
local ABILITY8  = "special_bonus_unique_tiny"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_W,    SKILL_W,
    SKILL_R,    SKILL_W,    SKILL_Q,    SKILL_Q,    ABILITY1,
    SKILL_E,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY3,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X