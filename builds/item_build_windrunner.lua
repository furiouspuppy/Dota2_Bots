X = {}

X["items"] = {
"item_tango";
"item_null_talisman";
"item_bottle";
"item_phase_boots";
"item_maelstrom";
"item_force_staff";
"item_ultimate_scepter";
"item_black_king_bar"; 
"item_sheepstick";
}

-- Set up Skill build
local SKILL_Q = "windrunner_shackleshot";
local SKILL_W = "windrunner_powershot";
local SKILL_E = "windrunner_windrun";
local SKILL_R = "windrunner_focusfire";    

local ABILITY1  = "special_bonus_attack_damage_15"
local ABILITY2  = "special_bonus_mp_regen_4"
local ABILITY3  = "special_bonus_hp_200"
local ABILITY4  = "special_bonus_intelligence_16"
local ABILITY5  = "special_bonus_spell_amplify_12"
local ABILITY6  = "special_bonus_magic_resistance_12"
local ABILITY7  = "special_bonus_attack_range_100"
local ABILITY8  = "special_bonus_unique_windranger"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_E,    SKILL_W,    SKILL_W,    SKILL_Q,    SKILL_W,
    SKILL_R,    SKILL_W,    SKILL_Q,    SKILL_Q,    ABILITY1,
    SKILL_Q,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY4,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X