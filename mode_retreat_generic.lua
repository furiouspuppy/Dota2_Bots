local utils = require("bots" .. "/util")
local teamStatus = require( "bots".."/team_status" )
local enemyStatus = require( "bots".."/enemy_status" )
----------------------------------------------------------------------------------------------------

--[[
factors:
	enemy presence
	health
	mana
	escape(not implemented)
]]	
local retreating = false

function GetDesire()
	npcBot = GetBot()
	--print("retreating:".. tostring(retreating))
	if GetGameState() ~= GAME_STATE_GAME_IN_PROGRESS and
		GetGameState() ~= GAME_STATE_PRE_GAME then 
		return 0.0
	end

	-- reset if dead
	if not npcBot:IsAlive() then
		npcBot.LostCause = false
		retreating = false
		return 0.0
	end

	-- if a nearby hero with a more important role needs help 
	--	sac yourself trying to save them.
	if retreating or npcBot.LostCause then 
		--print("Role: " .. npcBot.Role)
		--print("IsFighting: " .. tostring(npcBot.IsFighting))
		--print("TeamFight: " .. tostring(teamStatus.TeamFight))
		if npcBot.Role and npcBot.Role > 2 then
			--print("pos 3+ leaving a fight")
			--print("NearbyFriends: ")
			for _,v in pairs(npcBot.NearbyFriends) do
				--print(tostring(v.NeedsHelp) .. ":" .. v.Role)
				if v.NeedsHelp and v.Role < 3 then
					npcBot.LostCause = true
					--print(npcBot:GetUnitName() .. " is a lost cause!")
					--print("----------------------------------")
					--print(" ")
					return BOT_MODE_DESIRE_NONE
				end
			end

			npcBot.LostCause = false			
			--print("----------------------------------")
			--print(" ")
		end

		if (npcBot:DistanceFromFountain() == 0 and
			npcBot:GetHealth() == npcBot:GetMaxHealth() and 
			npcBot:GetMana() == npcBot:GetMaxMana() )
			or
			(npcBot:GetHealth() >= npcBot:GetMaxHealth() *.75 and 
			npcBot:GetHealth() >= npcBot:GetMaxHealth() *.75 and
			npcBot:GetLocationDanger() == 0)
		then
			npcBot.NeedsHelp = false
			npcBot.CanHelp = true
			retreating = false
		end
		return BOT_MODE_DESIRE_ABSOLUTE 
	end

	-- reset flag if not reatreating
	npcBot.LostCause = false

	local retreat = 0
	local healthPer = npcBot:GetHealth() / npcBot:GetMaxHealth()
	local manaPer = npcBot:GetMana() / npcBot:GetMaxMana()

	--range is + 0-0.85
	retreat = 0.6 * (1 - healthPer) + 0.2 * (1 - manaPer)
	local reason1 = retreat
	--print(npcBot:GetUnitName().." 1: " .. retreat)
	--range is + 0-0.25
	for _,v in pairs(enemyStatus.GetHeroes()) do
		if v.missing then
			retreat = retreat + .05
		elseif v.hasGlobal then
			retreat = retreat + .05
		end
	end
	local reason2 = retreat - reason1
	--print(npcBot:GetUnitName().." 2: " .. retreat)

	-- range is * 0 - ~1.6
	for _,v in pairs(npcBot.NearbyEnemies) do
		if npcBot:TimeSinceDamagedByHero( v ) < .3 then
			retreat = retreat * 1.1
		end
	end
	local reason3 = retreat - reason2 - reason1
	--print(npcBot:GetUnitName().." 3: " .. retreat)
	

	--range  is * 1-1.3
	-- no risk modes?
	if (npcBot:GetActiveMode() == BOT_MODE_NONE or
		npcBot:GetActiveMode() == BOT_MODE_SECRET_SHOP or
		npcBot:GetActiveMode() == BOT_MODE_FARM or
		npcBot:GetActiveMode() == BOT_MODE_ASSEMBLE_WITH_HUMANS)
	then
		retreat = retreat + 0
	end

	-- low risk modes
	if (npcBot:GetActiveMode() == BOT_MODE_LANING or
		npcBot:GetActiveMode() == BOT_MODE_SIDE_SHOP or
		npcBot:GetActiveMode() == BOT_MODE_DEFEND_TOWER_TOP or
		npcBot:GetActiveMode() == BOT_MODE_DEFEND_TOWER_MID or
		npcBot:GetActiveMode() == BOT_MODE_DEFEND_TOWER_BOT or
		npcBot:GetActiveMode() == BOT_MODE_ASSEMBLE)
	then
		retreat = retreat * 1.1
	end

	-- med risk modes
	if (npcBot:GetActiveMode() == BOT_MODE_TEAM_ROAM or
		npcBot:GetActiveMode() == BOT_MODE_ITEM or
		npcBot:GetActiveMode() == BOT_MODE_PUSH_TOWER_TOP or
		npcBot:GetActiveMode() == BOT_MODE_PUSH_TOWER_MID or
		npcBot:GetActiveMode() == BOT_MODE_PUSH_TOWER_BOT or
		npcBot:GetActiveMode() == BOT_MODE_WARD)
	then
		retreat = retreat * 1.2
	end

	-- high risk modes
	if (npcBot:GetActiveMode() == BOT_MODE_ATTACK or
		npcBot:GetActiveMode() == BOT_MODE_ROAM or
		npcBot:GetActiveMode() == BOT_MODE_DEFEND_ALLY or
		npcBot:GetActiveMode() == BOT_MODE_EVASIVE_MANEUVERS or
		npcBot:GetActiveMode() == BOT_MODE_ROSHAN)
	then
		retreat = retreat * 1.3
	end
	local reason4 = retreat / (reason1 + reason2 )-- + reason3)
	--print(npcBot:GetUnitName().." 4: " .. retreat)

	--range is * ±2
	--local powerInNumbers = #npcBot.NearbyFriends - #npcBot.NearbyEnemies
	--retreat = retreat * powerInNumbers

	--range is * 1-1.3
	retreat = retreat * (1 + (0.3 * utils.GetLocationDanger(npcBot:GetLocation())))
	
	local reason5 = (0.3 * utils.GetLocationDanger(npcBot:GetLocation()))
	--print(npcBot:GetUnitName().." 5: " .. retreat)
	if RemapValClamped( retreat, DANGER_NONE, DANGER_ABSOLUTE, DANGER_NONE, DANGER_ABSOLUTE ) > .7 then
		retreating = true
		npcBot.NeedsHelp = true
		npcBot.CanHelp = false
		print(reason1 .. ":" .. reason2 .. ":" .. reason4 .. ":" .. reason5)-- .. ":" .. reason3
		return BOT_MODE_DESIRE_ABSOLUTE
	end
	--if npcBot:GetUnitName() == "npc_dota_hero_meepo" then
	--	print("!meepo: " .. reason1 .. ":" .. reason2 .. ":" .. reason3 .. ":" .. reason4 .. ":" .. reason5)
	--end

	return BOT_MODE_DESIRE_NONE
end
--[[
function OnStart()
	-- body
end

function OnEnd()
	-- body
end

function Think()
	-- body
end
]]