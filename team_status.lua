local utils = require(GetScriptDirectory() .. "/util")
local enemyStatus = require( "bots".."/enemy_status" )
----------------------------------------------------------------------------------------------------
local X = {}

local tableFriendlyHeroes = {}
local tableRunes = {}

X.TeamFight = false
X.CallForGlobal = false
X.GlobalTarget = nil1

----------------------------------------------------------------------------------------------------
--know thy self
function X.FillHeroesTable ()
	if GetGameState() ~= GAME_STATE_GAME_IN_PROGRESS and 
		GetGameState() ~= GAME_STATE_PRE_GAME
	then 
		return
	end

	--utils.print_r(them)
	for i=1,5 do
		if GetTeamMember( GetTeam(), i ) then
			X.AddHero(GetTeamMember( GetTeam(), i ))
			--print("found: " .. GetTeamMember( GetTeam(), i ):GetUnitName() )
		end
	end

	--utils.print_r(tableFriendlyHeroes)

	for _,v in pairs(tableFriendlyHeroes) do	
		v.Role = utils.Roles[v:GetUnitName()]		
		if (v:GetUnitName() == "npc_dota_hero_ancient_apparition" or
			v:GetUnitName() == "npc_dota_hero_spirit_breaker" or
			v:GetUnitName() == "npc_dota_hero_wisp" or
			v:GetUnitName() == "npc_dota_hero_treant" or
			v:GetUnitName() == "npc_dota_hero_abyssal_underlord" or
			v:GetUnitName() == "npc_dota_hero_bloodseeker" or
			v:GetUnitName() == "npc_dota_hero_ember_spirit" or
			v:GetUnitName() == "npc_dota_hero_meepo" or
			v:GetUnitName() == "npc_dota_hero_spectre" or
			v:GetUnitName() == "npc_dota_hero_invoker" or
			v:GetUnitName() == "npc_dota_hero_furion" or
			v:GetUnitName() == "npc_dota_hero_silencer" or
			v:GetUnitName() == "npc_dota_hero_storm_spirit" or
			v:GetUnitName() == "npc_dota_hero_zuus")
		then
		v.hasGlobal = true
		end
	end
	--local test = GetNeutralSpawners()
	--utils.print_r(tableFriendlyHeroes)
	--print(assert(inspect.inspect(enemyPlayers)))
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.UpdateTeamStatus( hHero )
	local npcBot = GetBot()
	local updater = 0
	if #tableFriendlyHeroes == 0 or 
		(#tableFriendlyHeroes < 5 and 
		GetGameMode( ) == GAMEMODE_AP) 
	then
		X.FillHeroesTable()
	end

	-- if unit was updated by a different bot (like a player)
	if npcBot ~= hHero then
		npcBot = hHero
	end

	--Make 1 bot in tableFriendlyHeroes updater of human players and enemy team
	for _,v in pairs(tableFriendlyHeroes) do
		if v:IsBot() then
			updater = v
		end
	end

	if updater and updater == npcBot then
		--print("updating")
		enemyStatus.UpdateEnemyStatus()
		for _,v in pairs(tableFriendlyHeroes) do
			if not v:IsBot() then
				X.UpdateTeamStatus( v )
			end
		end
	end

	-- try to get a max power assessment
	local dummyArmor = GetTeamMember( GetTeam(), 1 ):GetArmor()
	local dummyPhysResist = 1 - 0.06 * dummyArmor / (1 + (0.06 * math.abs(dummyArmor)))
	local dummyMagResist = GetTeamMember( GetTeam(), 1 ): GetMagicResist()

	local pow = npcBot:GetEstimatedDamageToTarget( true, GetTeamMember( GetTeam(), 1 ), 10.0, DAMAGE_TYPE_PHYSICAL ) / dummyPhysResist
	--print("pow test "..pow)
	if npcBot.attackPower == nil or pow > npcBot.attackPower then
		npcBot.attackPower = pow
	end
	pow = npcBot:GetEstimatedDamageToTarget( true, GetTeamMember( GetTeam(), 1 ), 10.0, DAMAGE_TYPE_MAGICAL ) / dummyMagResist
	if npcBot.magicPower == nil or pow > npcBot.magicPower then
		npcBot.magicPower = pow
	end

	-- crude way to use help with humans
	if not npcBot:IsBot() then
		if npcBot:GetHealth() < npcBot:GetMaxHealth() * .5 then
			npcBot.NeedsHelp = true
			npcBot.CanHelp = false
		else
			npcBot.NeedsHelp = false
			npcBot.CanHelp = true
		end
	end

	npcBot.lane = npcBot:GetLane()

	--print("UPDATE: " .. npcBot:GetUnitName())
	-- track nearby players
	npcBot.NearbyFriends = {}
	for _,w in pairs(tableFriendlyHeroes) do
		if #(w:GetLocation() - npcBot:GetLocation()) < 1300 then
			table.insert(npcBot.NearbyFriends, w)
		end
	end
	npcBot.NearbyEnemies = {}
	for _,w in pairs(enemyStatus.GetHeroes()) do
		if #(w:GetLocation() - npcBot:GetLocation()) < 1300 then
			table.insert(npcBot.NearbyEnemies, w)
		end
	end

	-- if theres enough people around decalre a teamfight
	if #npcBot.NearbyFriends + #npcBot.NearbyEnemies >= 5 then
		npcBot.IsFighting = true
	else
		npcBot.IsFighting = false
	end

	local fightingCount = 0
	for _,v in pairs(tableFriendlyHeroes) do
		if v.IsFighting then fightingCount = fightingCount + 1 end
	end
	if fightingCount >=3 then
		TeamFight = true
		--print("TEAMFIGHT!")
	else
		TeamFight = false
	end
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.GetHeroes ()
	if #tableFriendlyHeroes == 0 or 
		(#tableFriendlyHeroes < 5 and 
		GetGameMode( ) == GAMEMODE_AP) 
	then
		X.FillHeroesTable()
	end
	--print(tostring(tableFriendlyHeroes))
	return tableFriendlyHeroes
end

----------------------------------------------------------------------------------------------------
--we missed someone? ... meepo...
function X.AddHero ( hHero )
	for _,v in pairs(tableFriendlyHeroes) do
		if v == hHero then
			return
		end
	end

	table.insert(tableFriendlyHeroes, hHero )
	--print(hHero:GetUnitName() .. " added!")
end

----------------------------------------------------------------------------------------------------
--Call a rune
function X.CallRune (rune)
	table.insert(tableRunes, rune)
end

----------------------------------------------------------------------------------------------------

--Check if rune is free
function X.GetCalledRunes ()
	return tableRunes
end

----------------------------------------------------------------------------------------------------

--Clear Rune Calls
function X.ClearCalledRunes ()
	for k in pairs (tableRunes) do
    	tableRunes[k] = nil
	end
end

----------------------------------------------------------------------------------------------------

return X