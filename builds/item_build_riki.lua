X = {}

X["items"] = {
"item_tango";
"item_orb_of_venom";
"item_magic_wand";
"item_phase_boots";
"item_urn_of_shadows";
"item_diffusal_blade_1"; 
"item_manta";
"item_black_king_bar";
"item_vladmir";
"item_abyssal_blade";
"item_moon_shard";
}

-- Set up Skill build
local SKILL_Q = "riki_smoke_screen";
local SKILL_W = "riki_blink_strike";
local SKILL_E = "riki_permanent_invisibility";
local SKILL_R = "riki_tricks_of_the_trade";    

local ABILITY1  = "special_bonus_hp_150"
local ABILITY2  = "special_bonus_movement_speed_15"
local ABILITY3  = "special_bonus_agility_10"
local ABILITY4  = "special_bonus_exp_boost_20"
local ABILITY5  = "special_bonus_cast_range_250"
local ABILITY6  = "special_bonus_all_stats_8"
local ABILITY7  = "special_bonus_unique_riki_1"
local ABILITY8  = "special_bonus_unique_riki_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_E,    SKILL_Q,    SKILL_W,    SKILL_E,    SKILL_E,
    SKILL_R,    SKILL_E,    SKILL_Q,    SKILL_Q,    ABILITY1,
    SKILL_Q,   	SKILL_R,    SKILL_W,    SKILL_W,    ABILITY3,
    SKILL_W,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X