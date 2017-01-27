X = {}

X["items"] = {
"item_tango";
"item_clarity";
"item_clarity";
"item_arcane_boots";
"item_blink";
"item_magic_wand";
"item_force_staff";
"item_ultimate_scepter";
"item_euls";
"item_shivas_guard";
"item_refresher";
}


-- Set up Skill build
local SKILL_Q = "earthshaker_fissure";
local SKILL_W = "earthshaker_enchant_totem";
local SKILL_E = "earthshaker_aftershock";
local SKILL_R = "earthshaker_echo_slam";    

local ABILITY1  = "special_bonus_strength_8"
local ABILITY2  = "special_bonus_mp_250"
local ABILITY3  = "special_bonus_movement_speed_20"
local ABILITY4  = "special_bonus_attack_damage_50"
local ABILITY5  = "special_bonus_spell_amplify_10"
local ABILITY6  = "special_bonus_respawn_reduction_35"
local ABILITY7  = "special_bonus_hp_500"
local ABILITY8  = "special_bonus_unique_earthshaker"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_E,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_E,    SKILL_E,    SKILL_E,
    ABILITY2,   SKILL_R,    SKILL_W,    SKILL_W,    ABILITY3,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X