X = {}

X["items"] = {
"item_tango";
"item_flask";
"item_magic_wand";
"item_boots";
"item_phase_boots"; --treads
"item_ring_of_aquila";
"item_helm_of_the_dominator"; 
"item_boots_of_elves"; --treads
"item_gloves"; --treads
"item_dragon_lance";
"item_manta";
"item_black_king_bar";
"item_eye_of_skadi";
"item_moon_shard";
}

-- Set up Skill build
local SKILL_Q = "luna_lucent_beam";
local SKILL_W = "luna_moon_glaive";
local SKILL_E = "luna_lunar_blessing";
local SKILL_R = "luna_eclipse";    

local ABILITY1  = "special_bonus_attack_damage_15"
local ABILITY2  = "special_bonus_armor_4"
local ABILITY3  = "special_bonus_hp_150"
local ABILITY4  = "special_bonus_unique_luna_1"
local ABILITY5  = "special_bonus_attack_speed_25"
local ABILITY6  = "special_bonus_magic_resistance_10"
local ABILITY7  = "special_bonus_all_stats_15"
local ABILITY8  = "special_bonus_unique_luna_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_E,    SKILL_Q,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_W,    SKILL_W,    ABILITY1,
    SKILL_W,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY3,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X