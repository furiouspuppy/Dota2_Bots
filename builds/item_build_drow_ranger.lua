X = {}

X["items"] = {
"item_tango";
"item_ring_of_aquila";
"item_power_treads";
"item_dragon_lance";
"item_shadow_blade"; --silver
"item_manta"; 
"item_ultimate_orb"; --silver
"item_recipe_silver_edge"; --silver
"item_ultimate_scepter";
"item_moon_shard";
"item_moon_shard";
}

-- Set up Skill build
local SKILL_Q = "drow_ranger_frost_arrows";
local SKILL_W = "drow_ranger_wave_of_silence";
local SKILL_E = "drow_ranger_trueshot";
local SKILL_R = "drow_ranger_marksmanship";    

local ABILITY1  = "special_bonus_movement_speed_15"
local ABILITY2  = "special_bonus_all_stats_5"
local ABILITY3  = "special_bonus_hp_175"
local ABILITY4  = "special_bonus_attack_speed_20"
local ABILITY5  = "special_bonus_unique_drow_ranger_1"
local ABILITY6  = "special_bonus_strength_14"
local ABILITY7  = "special_bonus_unique_drow_ranger_2"
local ABILITY8  = "special_bonus_unique_drow_ranger_3"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_E,    SKILL_Q,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_E,    SKILL_E,    ABILITY2,
    SKILL_E,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY4,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X