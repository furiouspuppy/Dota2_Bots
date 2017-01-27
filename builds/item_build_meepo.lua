X = {}
--[[ warning if meepo does not have an item other than 
brown boots / power treads at any time he will think he 
is a clone and skill/item decisions will possilby break! ]]
X["items"] = {
"item_tango";
"item_poor_mans_shield";
"item_boots"; -- BOTs
"item_dragon_lance";
"item_recipe_travel_boots"; -- BOTs
"item_blade_of_alacrity"; -- aghs
"item_ogre_axe";-- aghs
"item_point_booster";-- aghs
"item_staff_of_wizardry";-- aghs
"item_eagle"; -- eth blade
"item_ghost"; -- eth blade
"item_blink";
"item_heart";
"item_eagle"; -- eth blade
"item_ghost"; -- eth blade
}

-- Set up Skill build
local SKILL_Q = "meepo_earthbind";
local SKILL_W = "meepo_poof";
local SKILL_E = "meepo_geostrike";
local SKILL_R = "meepo_divided_we_stand";    

local ABILITY1  = "special_bonus_armor_4"
local ABILITY2  = "special_bonus_attack_damage_15"
local ABILITY3  = "special_bonus_lifesteal_15"
local ABILITY4  = "special_bonus_movement_speed_20"
local ABILITY5  = "special_bonus_evasion_10"
local ABILITY6  = "special_bonus_attack_speed_25"
local ABILITY7  = "special_bonus_hp_400"
local ABILITY8  = "special_bonus_unique_meepo"

--use -1 for levels that shouldn't level a skill
X["skills"] = {
    SKILL_W,    SKILL_Q,    SKILL_R,    SKILL_W,    SKILL_W,
    SKILL_E,    SKILL_W,    SKILL_E,    SKILL_E,    SKILL_R,
    ABILITY1,   SKILL_E,    SKILL_Q,    SKILL_Q,    ABILITY3,
    SKILL_Q,    SKILL_R,    "-1",   	"-1",   	ABILITY5,
    "-1",       "-1",       "-1",       "-1",       ABILITY7
};

return X