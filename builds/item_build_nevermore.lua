X = {}

X["items"] = {
"item_tango";
"item_wraith_band";
"item_bottle";
"item_boots"; --treads
"item_ring_of_aquila";
"item_boots_of_elves"; --treads
"item_gloves";  --treads
"item_shadow_blade";  --silver
"item_hurricane_pike";
"item_black_king_bar";
"item_ultimate_orb";  --silver
"item_recipe_silver_edge";  --silver
"item_ultimate_scepter";
"item_satanic";
"item_moon_shard";
}

-- Set up Skill build
local SKILL_Q = "nevermore_shadowraze1";
local SKILL_W = "nevermore_necromastery";
local SKILL_E = "nevermore_dark_lord";
local SKILL_R = "nevermore_requiem";    

local ABILITY1  = "special_bonus_movement_speed_15"
local ABILITY2  = "special_bonus_attack_speed_20"
local ABILITY3  = "special_bonus_spell_amplify_6"
local ABILITY4  = "special_bonus_hp_175"
local ABILITY5  = "special_bonus_evasion_15"
local ABILITY6  = "special_bonus_unique_nevermore_1"
local ABILITY7  = "special_bonus_attack_range_150"
local ABILITY8  = "special_bonus_unique_nevermore_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_W,    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_W,
    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_R,    ABILITY2,
    SKILL_E,   	SKILL_E,    SKILL_E,    SKILL_E,    ABILITY3,
    SKILL_R,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X