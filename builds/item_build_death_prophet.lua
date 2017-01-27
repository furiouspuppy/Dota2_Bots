X = {}

X["items"] = {
"item_null_talisman";
"item_faerie_fire";
"item_faerie_fire";
"item_bottle";
"item_phase_boots";
"item_magic_wand";
"item_euls"; 
"item_travel_boots";
"item_black_king_bar";
"item_heart";
"item_rod_of_atos";
"item_octarine_core";
}

-- Set up Skill build
local SKILL_Q = "death_prophet_carrion_swarm";
local SKILL_W = "death_prophet_silence";
local SKILL_E = "death_prophet_spirit_siphon";
local SKILL_R = "death_prophet_exorcism";    

local ABILITY1  = "special_bonus_spell_amplify_4"
local ABILITY2  = "special_bonus_strength_7"
local ABILITY3  = "special_bonus_magic_resistance_8"
local ABILITY4  = "special_bonus_cast_range_75"
local ABILITY5  = "special_bonus_cooldown_reduction_10"
local ABILITY6  = "special_bonus_movement_speed_25"
local ABILITY7  = "special_bonus_hp_400"
local ABILITY8  = "special_bonus_unique_death_prophet"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_E,    SKILL_Q,    SKILL_E,    SKILL_Q,    SKILL_E,
    SKILL_R,    SKILL_E,    SKILL_Q,    SKILL_Q,    ABILITY1,
    SKILL_W,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY4,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X