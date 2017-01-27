X = {}

X["items"] = {
"item_tango";
"item_wraith_band"; --aquila
"item_boots"; --treads
"item_ring_of_basilius"; --aquila
"item_magic_wand";
"item_boots_of_elves"; --treads
"item_gloves"; --treads
"item_dragon_lance"; 
"item_yasha";
"item_ultimate_scepter";
"item_helm_of_the_dominator";
"item_butterfly";
"item_moon_shard";
}

-- Set up Skill build
local SKILL_Q = "sniper_shrapnel";
local SKILL_W = "sniper_headshot";
local SKILL_E = "sniper_take_aim";
local SKILL_R = "sniper_assassinate";    

local ABILITY1  = "special_bonus_mp_regen_4"
local ABILITY2  = "special_bonus_attack_speed_15"
local ABILITY3  = "special_bonus_unique_sniper_1"
local ABILITY4  = "special_bonus_hp_200"
local ABILITY5  = "special_bonus_armor_8"
local ABILITY6  = "special_bonus_cooldown_reduction_25"
local ABILITY7  = "special_bonus_attack_range_100"
local ABILITY8  = "special_bonus_unique_sniper_2"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_W,    SKILL_E,    SKILL_E,    SKILL_Q,    SKILL_E,
    SKILL_R,    SKILL_E,    SKILL_W,    SKILL_W,    ABILITY2,
    SKILL_W,   	SKILL_R,    SKILL_Q,    SKILL_Q,    ABILITY3,
    SKILL_Q,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X