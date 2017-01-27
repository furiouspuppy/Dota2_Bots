X = {}

X["items"] = {
"item_wraith_band";
"item_flask";
"item_boots";
"item_ring_of_aquila";
"item_boots_of_elves"; 
"item_gloves";
"item_mekansm";
"item_dragon_lance";
"item_black_king_bar";
"item_butterfly";
"item_manta";
"item_moon_shard";
}

-- Set up Skill build
local SKILL_Q = "viper_poison_attack";
local SKILL_W = "viper_nethertoxin";
local SKILL_E = "viper_corrosive_skin";
local SKILL_R = "viper_viper_strike";    

local ABILITY1  = "special_bonus_attack_damage_15"
local ABILITY2  = "special_bonus_hp_125"
local ABILITY3  = "special_bonus_strength_7"
local ABILITY4  = "special_bonus_agility_14"
local ABILITY5  = "special_bonus_armor_7"
local ABILITY6  = "special_bonus_attack_range_75"
local ABILITY7  = "special_bonus_unique_viper_1"
local ABILITY8  = "special_bonus_unique_viper_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_E,    SKILL_E,
    SKILL_R,    SKILL_E,    SKILL_E,    SKILL_W,    ABILITY2,
    SKILL_W,   	SKILL_R,    SKILL_W,    SKILL_Q,    ABILITY3,
    SKILL_Q,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X