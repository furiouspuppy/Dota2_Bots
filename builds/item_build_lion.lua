X = {}

X["items"] = {
"item_tranquil_boots";
"item_magic_wand";
"item_blink";
"item_dagon_5"; 
"item_aether_lens";
"item_veil_of_discord";
"item_ultimate_scepter";
}

-- Set up Skill build
local SKILL_Q = "lion_impale";
local SKILL_W = "lion_voodoo";
local SKILL_E = "lion_mana_drain";
local SKILL_R = "lion_finger_of_death";    

local ABILITY1  = "special_bonus_hp_175"
local ABILITY2  = "special_bonus_attack_damage_45"
local ABILITY3  = "special_bonus_respawn_reduction_30"
local ABILITY4  = "special_bonus_gold_income_15"
local ABILITY5  = "special_bonus_magic_resistance_20"
local ABILITY6  = "special_bonus_spell_amplify_8"
local ABILITY7  = "special_bonus_all_stats_20"
local ABILITY8  = "special_bonus_unique_lion"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_E,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_E,    SKILL_E,    ABILITY1,
    SKILL_E,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY4,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X