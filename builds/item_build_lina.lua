X = {}

X["items"] = {
"item_tango";
"item_clarity";
"item_wind_lace";
"item_arcane_boots";
"item_magic_wand";
"item_euls"; 
"item_ultimate_scepter";
"item_blink";
"item_force_staff";
"item_sheepstick";
"item_travel_boots_2";
}

-- Set up Skill build
local SKILL_Q = "lina_dragon_slave";
local SKILL_W = "lina_light_strike_array";
local SKILL_E = "lina_fiery_soul";
local SKILL_R = "lina_laguna_blade";    

local ABILITY1  = "special_bonus_mp_250"
local ABILITY2  = "special_bonus_attack_damage_20"
local ABILITY3  = "special_bonus_respawn_reduction_30"
local ABILITY4  = "special_bonus_cast_range_125"
local ABILITY5  = "special_bonus_spell_amplify_6"
local ABILITY6  = "special_bonus_attack_range_150"
local ABILITY7  = "special_bonus_unique_lina_1"
local ABILITY8  = "special_bonus_unique_lina_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_W,    SKILL_Q,    SKILL_Q,    SKILL_E,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_W,    SKILL_W,    ABILITY2,
    SKILL_W,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY4,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X