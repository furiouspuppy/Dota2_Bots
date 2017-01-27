local utils = require(GetScriptDirectory() .. "/util")
local items = require(GetScriptDirectory() .. "/ItemData" )
local build ="NOT IMPLEMENTED"
if string.match(GetBot():GetUnitName(), "hero") then
    build = require(GetScriptDirectory() .. "/builds/item_build_" .. string.gsub(GetBot():GetUnitName(), "npc_dota_hero_", ""))
end
if build == "NOT IMPLEMENTED" then return end
----------------------------------------------------------------------------------------------------

--[[ Set up your skill build. ]]
local BotAbilityPriority = build["skills"]

-- Think function for spending skill points
function AbilityLevelUpThink()    
    --print(GetBot():GetUnitName())
    if GetGameState() ~= GAME_STATE_GAME_IN_PROGRESS and
        GetGameState() ~= GAME_STATE_PRE_GAME
    then 
        return
    end
    local npcBot = GetBot()
    -- Do I have a skill point?
    --print (npcBot:GetUnitName() .. npcBot:GetAbilityPoints())
    if (npcBot:GetAbilityPoints() > 0) then  
        local ability_name = BotAbilityPriority[1];
        --print(ability_name)
        -- Can I slot a skill with this skill point?
        if(ability_name ~="-1")
        then
            local ability = GetBot():GetAbilityByName(ability_name);
            -- Check if its a legit upgrade
            --print(npcBot:GetUnitName() .. ":" .. tostring(ability:CanAbilityBeUpgraded())..":".. ability:GetLevel() .. "<" .. ability:GetMaxLevel())
            if( ability:CanAbilityBeUpgraded() and ability:GetLevel() < ability:GetMaxLevel())  
            then
                local currentLevel = ability:GetLevel();
                GetBot():Action_LevelAbility(BotAbilityPriority[1]);
                if ability:GetLevel() > currentLevel then
                    --print("Skill: "..ability_name.."  upgraded!");
                    table.remove(BotAbilityPriority,1)
                else
                    --print("Skill: "..ability_name.." upgrade failed?!?");
                    end
            end 
        else
            table.remove(BotAbilityPriority,1)
        end
	end
end


----------------------------------------------------------------------------------------------------


--[[this chunk prevents dota_bot_reload_scripts from breaking your 
    item/skill builds.  Note the script doesn't account for 
    consumables. ]]

-- check skill build vs current level
local npcBot = GetBot()
local ability_name = BotAbilityPriority[1];
local ability = GetBot():GetAbilityByName(ability_name);
--print(ability:GetLevel())
if(ability ~= nil and ability:GetLevel() > 0) then
    --print (#BotAbilityPriority .. " > " .. "25 - " .. npcBot:GetLevel())
    if #BotAbilityPriority > (25 - npcBot:GetLevel()) then
        --print(#BotAbilityPriority - (25 - npcBot:GetLevel()))
        for i=1, (#BotAbilityPriority - (25 - npcBot:GetLevel())) do
            table.remove(BotAbilityPriority, 1)
        end
    end
end
