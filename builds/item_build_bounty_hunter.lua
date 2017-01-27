X = {}

X["items"] = {
"item_tango";
"item_flask";
"item_poor_mans_shield";
"item_phase_boots";
"item_bfury";
"item_desolator";
"item_vladmir";
"item_butterfly";
"item_travel_boots";
"item_rapier";
}

-- Set up Skill build
local SKILL_Q = "bounty_hunter_shuriken_toss";
local SKILL_W = "bounty_hunter_jinada";
local SKILL_E = "bounty_hunter_wind_walk";
local SKILL_R = "bounty_hunter_track";    

local ABILITY1  = "special_bonus_hp_175"
local ABILITY2  = "special_bonus_exp_boost_15"
local ABILITY3  = "special_bonus_attack_speed_40"
local ABILITY4  = "special_bonus_movement_speed_15"
local ABILITY5  = "special_bonus_spell_amplify_8"
local ABILITY6  = "special_bonus_attack_damage_100"
local ABILITY7  = "special_bonus_evasion_20"
local ABILITY8  = "special_bonus_unique_bounty_hunter"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_E,    SKILL_Q,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_W,    SKILL_W,    ABILITY2,
    SKILL_W,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY4,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X