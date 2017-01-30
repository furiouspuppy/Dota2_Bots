X = {}
--[[ warning if meepo does not have an item other than 
brown boots / power treads at any time he will think he 
is a clone and skill/item decisions will break! ]]
X["items"] = { 
                "item_tango";
				"item_magic_wand";
				"item_power_treads";
                "item_blink";
				"item_sheepstick";
                "item_linken_sphere";
                "item_ethereal_blade";
                "item_dagon_5";
			};

-- Set up Skill build
local SKILL_Q = "puck_illusory_orb";
local SKILL_W = "puck_waning_rift";
local SKILL_E = "puck_phase_shift";
local SKILL_R = "puck_dream_coil";    
local SKILL_D = "puck_ethereal_jaunt";    -- no levels


local ABILITY1 = "special_bonus_intelligence_8"
local ABILITY2 = "special_bonus_hp_150"
local ABILITY3 = "special_bonus_attack_damage_40"
local ABILITY4 = "special_bonus_movement_speed_20"
local ABILITY5 = "special_bonus_spell_amplify_8"
local ABILITY6 = "special_bonus_magic_resistance_20"
local ABILITY7 = "special_bonus_gold_income_50"
local ABILITY8 = "special_bonus_unique_puck"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_E,    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_W,
    SKILL_R,    SKILL_E,    SKILL_Q,    SKILL_Q,    ABILITY2,--"special_bonus_intelligence_8",
    SKILL_W,    SKILL_W,    SKILL_E,    SKILL_E,    ABILITY3,--"special_bonus_attack_damage_40",
    SKILL_R,    "-1",       SKILL_R,    "-1",   	ABILITY5,--"special_bonus_spell_amplify_8",
    "-1",   	"-1",   	"-1",       "-1",       ABILITY7,--"special_bonus_gold_income_50"
};

return X