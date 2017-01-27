X = {}

X["items"] = {
"item_flask";
"item_wraith_band";
"item_phase_boots";
"item_bottle";
"item_dragon_lance";
"item_sange_and_yasha";
"item_black_king_bar"; 
"item_assault";
"item_travel_boots";
"item_shivas_guard";
"item_moon_shard";
}

-- Set up Skill build
local SKILL_Q = "razor_plasma_field";
local SKILL_W = "razor_static_link";
local SKILL_E = "razor_unstable_current";
local SKILL_R = "razor_eye_of_the_storm";    

local ABILITY1  = "special_bonus_movement_speed_15"
local ABILITY2  = "special_bonus_agility_10"
local ABILITY3  = "special_bonus_armor_5"
local ABILITY4  = "special_bonus_cast_range_150"
local ABILITY5  = "special_bonus_hp_250"
local ABILITY6  = "special_bonus_attack_speed_30"
local ABILITY7  = "special_bonus_attack_range_175"
local ABILITY8  = "special_bonus_unique_razor"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_W,    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_Q,
    SKILL_E,    SKILL_Q,    SKILL_R,    SKILL_E,    ABILITY1,
    SKILL_E,   	SKILL_R,    SKILL_E,    SKILL_W,    ABILITY4,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X