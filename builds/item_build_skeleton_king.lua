X = {}

X["items"] = {
"item_tango";
"item_flask";
"item_stout_shield";
"item_quelling_blade";
"item_magic_wand";
"item_power_treads";
"item_armlet";
"item_blink";
"item_echo_sabre";
"item_black_king_bar";
"item_radiance";
}

-- Set up Skill build
local SKILL_Q = "skeleton_king_hellfire_blast";
local SKILL_W = "skeleton_king_vampiric_aura";
local SKILL_E = "skeleton_king_mortal_strike";
local SKILL_R = "skeleton_king_reincarnation";    

local ABILITY1  = "special_bonus_attack_damage_15"
local ABILITY2  = "special_bonus_intelligence_8"
local ABILITY3  = "special_bonus_movement_speed_15"
local ABILITY4  = "special_bonus_hp_200"
local ABILITY5  = "special_bonus_attack_speed_40"
local ABILITY6  = "special_bonus_strength_20"
local ABILITY7  = "special_bonus_unique_wraith_king_1"
local ABILITY8  = "special_bonus_unique_wraith_king_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_E,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_E,    SKILL_E,    ABILITY1,
    SKILL_E,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY3,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X