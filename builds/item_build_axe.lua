X = {}

X["items"] = {
"item_tango";
"item_stout_shield"; --vangaurd for crimson
"item_tranquil_boots";
"item_ring_of_health"; --vangaurd
"item_vitality_booster"; --vangaurd
"item_blink"; 
"item_blade_mail";
"item_pipe";
"item_black_king_bar";
"item_buckler"; --finish crimson
"item_recipe_crimson_guard"; --finish crimson
"item_travel_boots_2";
}

-- Set up Skill build
local SKILL_Q = "axe_berserkers_call";
local SKILL_W = "axe_battle_hunger";
local SKILL_E = "axe_counter_helix";
local SKILL_R = "axe_culling_blade";    

local ABILITY1  = "special_bonus_strength_6"
local ABILITY2  = "special_bonus_mp_regen_3"
local ABILITY3  = "special_bonus_attack_damage_75"
local ABILITY4  = "special_bonus_hp_250"
local ABILITY5  = "special_bonus_hp_regen_25"
local ABILITY6  = "special_bonus_movement_speed_30"
local ABILITY7  = "special_bonus_armor_15"
local ABILITY8  = "special_bonus_unique_axe"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_E,    SKILL_Q,    SKILL_E,    SKILL_W,    SKILL_E,
    SKILL_R,    SKILL_E,    SKILL_Q,    SKILL_Q,    ABILITY2,
    SKILL_Q,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY4,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X