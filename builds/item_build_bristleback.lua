X = {}

X["items"] = {
"item_tango";
"item_stout_shield"; --vangaurd
"item_ring_of_basilius"; --vladmir
"item_power_treads";
"item_ring_of_health"; --vangaurd
"item_vitality_booster"; --vangaurd
"item_blade_mail";
"item_lifesteal"; --vladmir
"item_headdress"; --vladmir
"item_lotus_orb";
}

-- Set up Skill build
local SKILL_Q = "bristleback_viscous_nasal_goo";
local SKILL_W = "bristleback_quill_spray";
local SKILL_E = "bristleback_bristleback";
local SKILL_R = "bristleback_warpath";    

local ABILITY1 = "special_bonus_strength_7"
local ABILITY2 = "special_bonus_mp_regen_2"
local ABILITY3 = "special_bonus_movement_speed_20"
local ABILITY4 = "special_bonus_hp_200"
local ABILITY5 = "special_bonus_attack_speed_45"
local ABILITY6 = "special_bonus_respawn_reduction_30"
local ABILITY7 = "special_bonus_hp_regen_25"
local ABILITY8 = "special_bonus_unique_bristleback"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_W,    SKILL_E,    SKILL_W,    SKILL_E,    SKILL_W,
    SKILL_R,    SKILL_Q,    SKILL_W,    SKILL_E,    SKILL_E,
    ABILITY2,   SKILL_R,    SKILL_Q,    SKILL_Q,    ABILITY3,
    SKILL_Q,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X