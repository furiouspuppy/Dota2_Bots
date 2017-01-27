X = {}

X["items"] = {
"item_tango";
"item_stout_shield";
"item_magic_wand";
"item_arcane_boots";
"item_blink"; 
"item_force_staff";
"item_black_king_bar";
"item_ultimate_scepter";
"item_travel_boots_2";
}

-- Set up Skill build
local SKILL_Q = "sandking_burrowstrike";
local SKILL_W = "sandking_sand_storm";
local SKILL_E = "sandking_caustic_finale";
local SKILL_R = "sandking_epicenter";    

local ABILITY1  = "special_bonus_mp_200"
local ABILITY2  = "special_bonus_armor_5"
local ABILITY3  = "special_bonus_magic_resistance_12"
local ABILITY4  = "special_bonus_movement_speed_15"
local ABILITY5  = "special_bonus_hp_350"
local ABILITY6  = "special_bonus_gold_income_20"
local ABILITY7  = "special_bonus_hp_regen_50"
local ABILITY8  = "special_bonus_unique_sand_king"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_E,    SKILL_Q,    SKILL_E,    SKILL_E,    SKILL_R,
    ABILITY1,   SKILL_R,    SKILL_W,    SKILL_W,    ABILITY4,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY8
};

return X