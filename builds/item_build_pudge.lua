X = {}

X["items"] = {
"item_tango";
"item_stout_shield";
"item_urn_of_shadows";
"item_tranquil_boots";
"item_blink"; 
"item_blade_mail";
"item_ultimate_scepter";
"item_aether_lens";
"item_travel_boots";
"item_lotus_orb";
"item_heart";
}

-- Set up Skill build
local SKILL_Q = "pudge_meat_hook";
local SKILL_W = "pudge_rot";
local SKILL_E = "pudge_flesh_heap";
local SKILL_R = "pudge_dismember";    

local ABILITY1  = "special_bonus_strength_8"
local ABILITY2  = "special_bonus_mp_regen_2"
local ABILITY3  = "special_bonus_armor_5"
local ABILITY4  = "special_bonus_movement_speed_15"
local ABILITY5  = "special_bonus_gold_income_25"
local ABILITY6  = "special_bonus_respawn_reduction_35"
local ABILITY7  = "special_bonus_unique_pudge_1"
local ABILITY8  = "special_bonus_unique_pudge_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_W,    SKILL_Q,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_W,    SKILL_W,    ABILITY1,
    SKILL_E,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY4,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X