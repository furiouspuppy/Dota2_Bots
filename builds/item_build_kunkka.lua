X = {}

X["items"] = {
"item_tango";
"item_stout_shield";
"item_branches";
"item_branches";
"item_bottle";
"item_phase_boots"; 
"item_armlet";
"item_greater_crit";
"item_blink";
"item_black_king_bar";
"item_silver_edge";
}

-- Set up Skill build
local SKILL_Q = "kunkka_torrent";
local SKILL_W = "kunkka_tidebringer";
local SKILL_E = "kunkka_x_marks_the_spot";
local SKILL_R = "kunkka_ghostship";  

local ABILITY1  = "special_bonus_attack_damage_20"
local ABILITY2  = "special_bonus_mp_150"
local ABILITY3  = "special_bonus_hp_regen_15"
local ABILITY4  = "special_bonus_movement_speed_15"
local ABILITY5  = "special_bonus_hp_300"
local ABILITY6  = "special_bonus_gold_income_20"
local ABILITY7  = "special_bonus_magic_resistance_25"
local ABILITY8  = "special_bonus_unique_kunkka"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_W,    SKILL_Q,    SKILL_W,    SKILL_E,    SKILL_W,
    SKILL_R,    SKILL_W,    SKILL_E,    SKILL_Q,    ABILITY1,
    SKILL_E,   	SKILL_R,    SKILL_E,    SKILL_Q,    ABILITY3,
    SKILL_Q,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X