X = {}

X["items"] = {
"item_tango";
"item_flask";
"item_stout_shield";
"item_power_treads";
"item_echo_sabre";
"item_helm_of_the_dominator";
"item_blink"; 
"item_black_king_bar";
"item_moon_shard";
"item_assault";
}

-- Set up Skill build
local SKILL_Q = "sven_storm_bolt";
local SKILL_W = "sven_great_cleave";
local SKILL_E = "sven_warcry";
local SKILL_R = "sven_gods_strength";    

local ABILITY1  = "special_bonus_strength_6"
local ABILITY2  = "special_bonus_mp_200"
local ABILITY3  = "special_bonus_movement_speed_20"
local ABILITY4  = "special_bonus_all_stats_8"
local ABILITY5  = "special_bonus_attack_speed_30"
local ABILITY6  = "special_bonus_evasion_15"
local ABILITY7  = "special_bonus_attack_damage_65"
local ABILITY8  = "special_bonus_unique_sven"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_W,    SKILL_W,    SKILL_W,
    SKILL_R,    SKILL_W,    SKILL_E,    SKILL_E,    ABILITY1,
    SKILL_E,   	SKILL_R,    SKILL_Q,    SKILL_Q,    ABILITY4,
    SKILL_Q,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X