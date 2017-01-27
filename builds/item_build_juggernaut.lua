X = {}

X["items"] = {
"item_tango";
"item_flask";
"item_poor_mans_shield";
"item_phase_boots";
"item_ring_of_aquila";
"item_helm_of_the_dominator"; 
"item_manta";
"item_mjollnir";
"item_blink";
"item_black_king_bar";
"item_moon_shard";
}

-- Set up Skill build
local SKILL_Q = "juggernaut_blade_fury";
local SKILL_W = "juggernaut_healing_ward";
local SKILL_E = "juggernaut_blade_dance";
local SKILL_R = "juggernaut_omni_slash";    

local ABILITY1  = "special_bonus_hp_150"
local ABILITY2  = "special_bonus_attack_damage_20"
local ABILITY3  = "special_bonus_attack_speed_20"
local ABILITY4  = "special_bonus_armor_6"
local ABILITY5  = "special_bonus_movement_speed_20"
local ABILITY6  = "special_bonus_all_stats_8"
local ABILITY7  = "special_bonus_agility_20"
local ABILITY8  = "special_bonus_unique_juggernaut"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_W,    SKILL_W,    ABILITY2,
    SKILL_W,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY3,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X