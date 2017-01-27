X = {}

X["items"] = {
"item_tango";
"item_flask";
"item_arcane_boots";
"item_magic_wand";
"item_mekansm"; 
"item_ultimate_scepter";
"item_aether_lens";
"item_dagon_5";
"item_shivas_guard";
"item_guardian_greaves";
"item_octarine_core";
}

-- Set up Skill build
local SKILL_Q = "necrolyte_death_pulse";
local SKILL_W = "necrolyte_sadist";
local SKILL_E = "necrolyte_heartstopper_aura";
local SKILL_R = "necrolyte_reapers_scythe";    

local ABILITY1  = "special_bonus_attack_damage_40"
local ABILITY2  = "special_bonus_strength_6"
local ABILITY3  = "special_bonus_all_stats_6"
local ABILITY4  = "special_bonus_movement_speed_15"
local ABILITY5  = "special_bonus_spell_amplify_5"
local ABILITY6  = "special_bonus_magic_resistance_10"
local ABILITY7  = "special_bonus_hp_400"
local ABILITY8  = "special_bonus_unique_necrophos"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_E,    SKILL_E,    ABILITY2,
    SKILL_E,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY3,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X