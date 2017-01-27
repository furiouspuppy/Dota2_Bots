X = {}

X["items"] = {
"item_tango";
"item_clarity";
"item_clarity";
"item_arcane_boots";
"item_magic_wand";
"item_medallion_of_courage";
"item_urn_of_shadows"; 
"item_aether_lens";
"item_pipe";
"item_ultimate_scepter";
"item_sheepstick";
}

-- Set up Skill build
local SKILL_Q = "dazzle_poison_touch";
local SKILL_W = "dazzle_shallow_grave";
local SKILL_E = "dazzle_shadow_wave";
local SKILL_R = "dazzle_weave";    

local ABILITY1  = "special_bonus_intelligence_10"
local ABILITY2  = "special_bonus_hp_125"
local ABILITY3  = "special_bonus_cast_range_100"
local ABILITY4  = "special_bonus_attack_damage_40"
local ABILITY5  = "special_bonus_movement_speed_25"
local ABILITY6  = "special_bonus_respawn_reduction_30"
local ABILITY7  = "special_bonus_unique_dazzle_1"
local ABILITY8  = "special_bonus_unique_dazzle_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_E,    SKILL_W,    SKILL_E,
    SKILL_R,    SKILL_E,    SKILL_W,    SKILL_W,    ABILITY1,
    SKILL_W,   	SKILL_R,    SKILL_Q,    SKILL_Q,    ABILITY3,
    SKILL_Q,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X