X = {}

X["items"] = {
"item_tango";
"item_stout_shield";
"item_quelling_blade";
"item_poor_mans_shield";
"item_power_treads";
"item_skull_basher";
"item_black_king_bar";
"item_sange_and_yasha";
"item_ultimate_scepter";
"item_greater_crit";
}

-- Set up Skill build
local SKILL_Q = "bloodseeker_bloodrage";
local SKILL_W = "bloodseeker_blood_bath";
local SKILL_E = "bloodseeker_thirst";
local SKILL_R = "bloodseeker_rupture";    

local ABILITY1  = "special_bonus_armor_5"
local ABILITY2  = "special_bonus_attack_damage_25"
local ABILITY3  = "special_bonus_attack_speed_30"
local ABILITY4  = "special_bonus_hp_250"
local ABILITY5  = "special_bonus_respawn_reduction_30"
local ABILITY6  = "special_bonus_all_stats_10"
local ABILITY7  = "special_bonus_unique_bloodseeker"
local ABILITY8  = "special_bonus_lifesteal_30"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_W,    SKILL_E,    SKILL_W,    SKILL_E,    SKILL_W,
    SKILL_R,    SKILL_W,    SKILL_E,    SKILL_E,    ABILITY2,
    SKILL_Q,   	SKILL_R,    SKILL_Q,    SKILL_Q,    ABILITY3,
    SKILL_Q,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X