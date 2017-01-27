X = {}

X["items"] = {
"item_magic_wand";
"item_tranquil_boots";
"item_medallion_of_courage"; --solar
"item_force_staff";
"item_vladmir";
"item_talisman_of_evasion"; --solar
"item_ultimate_scepter";
"item_aether_lens";
"item_moon_shard";
}

-- Set up Skill build
local SKILL_Q = "vengefulspirit_magic_missile";
local SKILL_W = "vengefulspirit_wave_of_terror";
local SKILL_E = "vengefulspirit_command_aura";
local SKILL_R = "vengefulspirit_nether_swap";    

local ABILITY1  = "special_bonus_magic_resistance_8"
local ABILITY2  = "special_bonus_attack_speed_25"
local ABILITY3  = "special_bonus_all_stats_8"
local ABILITY4  = "special_bonus_unique_vengeful_spirit_1"
local ABILITY5  = "special_bonus_attack_damage_50"
local ABILITY6  = "special_bonus_movement_speed_20"
local ABILITY7  = "special_bonus_unique_vengeful_spirit_2"
local ABILITY8  = "special_bonus_unique_vengeful_spirit_3"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_W,    SKILL_Q,    SKILL_W,    SKILL_Q,
    SKILL_R,    SKILL_Q,    SKILL_E,    SKILL_W,    ABILITY1,
    SKILL_W,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY3,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY6,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X