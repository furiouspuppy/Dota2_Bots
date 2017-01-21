local utils = require("bots" .. "/util")
local teamStatus = require( "bots".."/team_status" )
local enemyStatus = require( "bots".."/enemy_status" )
----------------------------------------------------------------------------------------------------

function GetDesire()
	npcBot = GetBot()
	print("test:"))

	if npcBot.CanHelp then
		for _,v in pairs(teamStatus.GetHeroes()) do
			if v.NeedsHelp and 
				v.Role < npcBot.Role and 
				#(v:GetLocation() - npcBot:GetLocation) < 1500 
			then
				BOT_MODE_DESIRE_VERYHIGH
			end
		end
	end
	return BOT_MODE_DESIRE_NONE
end