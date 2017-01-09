X = {}
--[[ warning if meepo does not have an item other than 
brown boots / power treads at any time he will think he 
is a clone and skill/item decisions will possilby break! ]]
X["items"] = {

"item_stout_shield", -- vanguard
"item_boots", -- phase boots
"item_blades_of_attack",-- phase boots
"item_blades_of_attack",-- phase boots
"item_slippers", -- wraith band
"item_circlet", -- wraith band
"item_recipe_wraith_band", -- wraith band
"item_ring_of_protection", -- basilius
"item_sobi_mask", -- basilius
"item_quarterstaff", -- echo saber
"item_sobi_mask", -- echo saber
"item_robe", -- echo saber
"item_ogre_axe", -- echo saber
"item_claymore", -- shadow blade
"item_shadow_amulet", -- shadow blade
"item_belt_of_strength",--skull basher
"item_javelin",--skull basher
"item_recipe_basher",--skull basher
"item_ring_of_health",-- vanguard
"item_vitality_booster",-- vanguard
"item_recipe_abyssal_blade", -- abyssal blade
"item_blade_of_alacrity", -- yasha
"item_boots_of_elves", -- yasha
"item_recipe_yasha", -- yasha
"item_ultimate_orb", -- silver edge
"item_recipe_silver_edge", -- silver edge
"item_ultimate_orb", -- manta 
"item_recipe_manta" -- manta
}

-- Set up Skill build
local SKILL_Q = "monkey_king_boundless_strike";
local SKILL_W = "monkey_king_tree_dance";
local SKILL_D = "monkey_king_jingu_mastery";
local SKILL_R = "monkey_king_wukongs_command";    

local ABILITY1  = "special_bonus_attack_speed_20"
local ABILITY2  = "special_bonus_armor_5"
local ABILITY3  = "special_bonus_hp_275"
local ABILITY4  = "special_bonus_movement_speed_20"
local ABILITY5  = "special_bonus_attack_damage_40"
local ABILITY6  = "special_bonus_strength_15"
local ABILITY7  = "special_bonus_magic_resistance_25"
local ABILITY8  = "special_bonus_unique_monkey_king"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_D,    SKILL_Q,    SKILL_D,    SKILL_W,    SKILL_D,
    SKILL_Q,    SKILL_D,    SKILL_Q,    SKILL_Q,    SKILL_R,
    SKILL_R,    "-1",    	SKILL_W,    SKILL_W,    "-1",
    SKILL_W,    "-1",    	SKILL_R,    ABILITY1,   ABILITY4,
    ABILITY6,   "-1",       "-1",       "-1",       ABILITY8
};

return X