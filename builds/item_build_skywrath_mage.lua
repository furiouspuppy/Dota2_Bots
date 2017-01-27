X = {}

X["items"] = {
"item_tango";
"item_null_talisman";
"item_bottle";
"item_arcane_boots";
"item_veil_of_discord";
"item_rod_of_atos"; 
"item_ultimate_scepter";
"item_aether_lens";
"item_ethereal_blade";
"item_octarine_core";
}

-- Set up Skill build
local SKILL_Q = "skywrath_mage_arcane_bolt";
local SKILL_W = "skywrath_mage_concussive_shot";
local SKILL_E = "skywrath_mage_ancient_seal";
local SKILL_R = "skywrath_mage_mystic_flare";    

local ABILITY1  = "special_bonus_hp_125"
local ABILITY2  = "special_bonus_intelligence_7"
local ABILITY3  = "special_bonus_attack_damage_50"
local ABILITY4  = "special_bonus_gold_income_10"
local ABILITY5  = "special_bonus_movement_speed_20"
local ABILITY6  = "special_bonus_magic_resistance_15"
local ABILITY7  = "special_bonus_mp_regen_14"
local ABILITY8  = "special_bonus_unique_skywrath"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_E,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_E,    SKILL_E,    ABILITY2,
    SKILL_E,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY4,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X