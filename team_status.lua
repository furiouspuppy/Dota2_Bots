_G._savedEnv = getfenv()
module( "team_status", package.seeall )
local utils = require(GetScriptDirectory() .. "/util")

local tableFriendlyHeroes = {}
local tableRunes = {}
local tableNeedsHelp = {}

----------------------------------------------------------------------------------------------------
--know thy enemy
function FillHeroesTable ()
	if #tableFriendlyHeroes == 0 then
		local us = GetTeamPlayers( GetTeam() )
		local them
		if math.abs(GetTeam() - 3) then
			them = 3
		else
			them = 2
		end
		--utils.print_r(them)
		for i=1,5 do
			table.insert(tableFriendlyHeroes,GetTeamMember( them, i ))
			--print("added: " .. i)
		end

		--local test = GetNeutralSpawners()
		utils.print_r(tableFriendlyHeroes)
		--print(assert(inspect.inspect(enemyPlayers)))
	end
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function GetHeroes ()
	if #tableFriendlyHeroes == 0 then
		FillHeroesTable()
	end
	return tableFriendlyHeroes
end

----------------------------------------------------------------------------------------------------
--Call a rune
function CallRune (rune)
	table.insert(tableRunes, rune)
end

----------------------------------------------------------------------------------------------------

--Check if rune is free
function GetCalledRunes ()
	return tableRunes
end

----------------------------------------------------------------------------------------------------

--Clear Rune Calls
function ClearCalledRunes ()
	for k in pairs (tableRunes) do
    	tableRunes[k] = nil
	end
end

----------------------------------------------------------------------------------------------------

for k,v in pairs( team_status ) do	_G._savedEnv[k] = v end