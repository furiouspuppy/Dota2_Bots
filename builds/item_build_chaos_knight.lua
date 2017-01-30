X = {}

X["items"] = {
"item_tango";
"item_flask";
"item_stout_shield";
"item_clarity";
"item_quelling_blade";
"item_power_treads";
"item_magic_wand";
"item_armlet";
"item_echo_sabre";
"item_drums_of_endurance";
"item_black_king_bar";
"item_manta";
"item_heart";
}

-- Set up Skill build
local SKILL_Q = "chaos_knight_chaos_bolt";
local SKILL_W = "chaos_knight_reality_rift";
local SKILL_E = "chaos_knight_chaos_strike";
local SKILL_R = "chaos_knight_phantasm";    

local ABILITY1 = "special_bonus_attack_speed_15"
local ABILITY2 = "special_bonus_intelligence_7"
local ABILITY3 = "special_bonus_movement_speed_15"
local ABILITY4 = "special_bonus_strength_10"
local ABILITY5 = "special_bonus_gold_income_20"
local ABILITY6 = "special_bonus_all_stats_12"
local ABILITY7 = "special_bonus_cooldown_reduction_20"
local ABILITY8 = "special_bonus_unique_chaos_knight"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_W,    SKILL_E,
    SKILL_Q,    SKILL_Q,    SKILL_W,    SKILL_W,    ABILITY1,
    SKILL_R,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY4,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X