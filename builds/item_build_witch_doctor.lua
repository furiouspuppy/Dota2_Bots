X = {}

X["items"] = {
"item_tango";
"item_clarity";
"item_magic_wand";
"item_arcane_boots";
"item_glimmer_cape"; 
"item_ultimate_scepter";
"item_black_king_bar";
"item_dagon_5";
"item_octarine_core";
}

-- Set up Skill build
local SKILL_Q = "witch_doctor_paralyzing_cask";
local SKILL_W = "witch_doctor_voodoo_restoration";
local SKILL_E = "witch_doctor_maledict";
local SKILL_R = "witch_doctor_death_ward";    

local ABILITY1  = "special_bonus_hp_200"
local ABILITY2  = "special_bonus_exp_boost_20"
local ABILITY3  = "special_bonus_attack_damage_75"
local ABILITY4  = "special_bonus_respawn_reduction_35"
local ABILITY5  = "special_bonus_armor_8"
local ABILITY6  = "special_bonus_magic_resistance_15"
local ABILITY7  = "special_bonus_unique_witch_doctor_1"
local ABILITY8  = "special_bonus_unique_witch_doctor_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_E,    SKILL_E,    ABILITY1,
    SKILL_E,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY4,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X