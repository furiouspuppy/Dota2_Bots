_G._savedEnv = getfenv()
module( "enemy_status", package.seeall )
local utils = require(GetScriptDirectory() .. "/util")

local tableEnemyHeroes = {}

----------------------------------------------------------------------------------------------------
--know thy enemy
function FillHeroesTable ()
	if #tableEnemyHeroes == 0 then
		local us = GetTeamPlayers( GetTeam() )
		local them
		if math.abs(GetTeam() - 3) then
			them = 3
		else
			them = 2
		end
		--utils.print_r(them)
		for i=1,5 do
			table.insert(tableEnemyHeroes,GetTeamMember( them, i ))
			--print("added: " .. i)
		end

		--local test = GetNeutralSpawners()
		utils.print_r(tableEnemyHeroes)
		--print(assert(inspect.inspect(enemyPlayers)))
	end
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function GetHeroes ()
	if #tableEnemyHeroes == 0 then
		FillHeroesTable()
	end
	return tableEnemyHeroes
end

----------------------------------------------------------------------------------------------------

for k,v in pairs( enemy_status ) do	_G._savedEnv[k] = v end