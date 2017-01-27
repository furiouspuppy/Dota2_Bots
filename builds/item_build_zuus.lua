X = {}

X["items"] = {
"item_tango";
"item_clarity";
"item_bottle";
"item_arcane_boots";
"item_soul_ring";
"item_veil_of_discord"; 
"item_aether_lens";
"item_force_staff";
"item_ultimate_scepter";
"item_black_king_bar";
}

-- Set up Skill build
local SKILL_Q = "zuus_arc_lightning";
local SKILL_W = "zuus_lightning_bolt";
local SKILL_E = "zuus_static_field";
local SKILL_R = "zuus_thundergods_wrath";    

local ABILITY1  = "special_bonus_mp_regen_2"
local ABILITY2  = "special_bonus_hp_150"
local ABILITY3  = "special_bonus_armor_5"
local ABILITY4  = "special_bonus_magic_resistance_10"
local ABILITY5  = "special_bonus_movement_speed_35"
local ABILITY6  = "special_bonus_respawn_reduction_40"
local ABILITY7  = "special_bonus_cast_range_200"
local ABILITY8  = "special_bonus_unique_zeus"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_Q,    SKILL_E,    SKILL_Q,    SKILL_W,    SKILL_W,
    SKILL_R,    SKILL_W,    SKILL_W,    SKILL_Q,    ABILITY1,
    SKILL_Q,   	SKILL_R,    SKILL_E,    SKILL_E,    ABILITY4,
    SKILL_E,    "-1",    	SKILL_R,   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X