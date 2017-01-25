local utils = require(GetScriptDirectory() .. "/util")
----------------------------------------------------------------------------------------------------
local X = {}

local tableEnemyHeroes = {}
local rawEnemyPower = 0

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.FillHeroesTable ()
	if next(tableEnemyHeroes) == nil and (GetGameState() == GAME_STATE_GAME_IN_PROGRESS or GetGameState() == GAME_STATE_PRE_GAME) then
		local us = GetTeamPlayers( GetTeam() )
		local them
		if GetTeam() == 2 then
			them = 3
		else
			them = 2
		end
		--utils.print_r(them)
		for i=1,5 do
			if GetTeamMember( them, i ) then
				X.AddHero(GetTeamMember( them, i ))
			end
			--table.insert(tableEnemyHeroes,GetTeamMember( them, i ))
			--print("added: " .. i)
		end

		for _,v in pairs(tableEnemyHeroes) do
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
		--utils.print_r(tableEnemyHeroes)
		--print(assert(inspect.inspect(enemyPlayers)))
	end
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.UpdateEnemyStatus ()
	if #tableEnemyHeroes == 0 or 
		(#tableEnemyHeroes < 5 and 
		GetGameMode( ) == GAMEMODE_AP) 
	then
		X.FillHeroesTable()
	end

	-- try to get a max power assessment
	local dummyArmor = GetTeamMember( GetTeam(), 1 ):GetArmor()
	local dummyPhysResist = 1 - 0.06 * dummyArmor / (1 + (0.06 * math.abs(dummyArmor)))
	local dummyMagResist = GetTeamMember( GetTeam(), 1 ): GetMagicResist()

	for _,v in pairs(tableEnemyHeroes) do
		if v:CanBeSeen() then
			v.missing = false
			v.lane = v:GetLane()
			local pow = v:GetEstimatedDamageToTarget( true, GetTeamMember( GetTeam(), 1 ), 10.0, DAMAGE_TYPE_PHYSICAL ) / dummyPhysResist
			if v.attackPower and pow > v.attackPower then
				v.attackPower = pow
			end
			pow = v:GetEstimatedDamageToTarget( true, GetTeamMember( GetTeam(), 1 ), 10.0, DAMAGE_TYPE_MAGICAL ) / dummyMagResist
			if v.magicPower and pow > v.magicPower then
				v.magicPower = pow
			end
		else
			v.missing = true
		end
	end
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.GetHeroes ()
	if #tableEnemyHeroes == 0 or 
		(#tableEnemyHeroes < 5 and 
		GetGameMode( ) == GAMEMODE_AP) 
	then
		X.FillHeroesTable()
	end
	--print(tostring(tableFriendlyHeroes))
	return tableEnemyHeroes
end

----------------------------------------------------------------------------------------------------
--we missed someone? ... meepo...
function X.AddHero ( hHero )
	for _,v in pairs(tableEnemyHeroes) do
		if v == hHero then
			return
		end
	end

	table.insert(tableEnemyHeroes, hHero )
end


----------------------------------------------------------------------------------------------------

return X