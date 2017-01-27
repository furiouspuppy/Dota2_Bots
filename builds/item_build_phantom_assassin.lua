X = {}

X["items"] = {
"item_tango";
"item_poor_mans_shield";
"item_phase_boots";
"item_vladmir";
"item_desolator"; 
"item_black_king_bar";
"item_manta";
"item_eye_of_skadi";
"item_moon_shard";
}

-- Set up Skill build
local SKILL_Q = "phantom_assassin_stifling_dagger";
local SKILL_W = "phantom_assassin_phantom_strike";
local SKILL_E = "phantom_assassin_blur";
local SKILL_R = "phantom_assassin_coup_de_grace";    

local ABILITY1  = "special_bonus_hp_150"
local ABILITY2  = "special_bonus_attack_damage_15"
local ABILITY3  = "special_bonus_lifesteal_10"
local ABILITY4  = "special_bonus_movement_speed_15"
local ABILITY5  = "special_bonus_attack_speed_35"
local ABILITY6  = "special_bonus_all_stats_10"
local ABILITY7  = "special_bonus_agility_25"
local ABILITY8  = "special_bonus_unique_phantom_assassin"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_E,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_E,    SKILL_E,    ABILITY1,
    SKILL_E,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY3,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X