local utils = require(GetScriptDirectory() .. "/util")
local enemyStatus = require(GetScriptDirectory() .."/enemy_status" )
local teamStatus = require(GetScriptDirectory() .."/team_status" )
----------------------------------------------------------------------------------------------------

local lane = LANE_TOP

function GetDesire()
	local enemyCount = 0

	for _,v in pairs(enemyStatus.GetHeroes()) do
		if not v.missing and v.lane == lane then
			enemyCount = enemyCount + 1
		end
	end

	if enemyCount >= 2 then
		return BOT_MODE_DESIRE_NONE
	end

	return BOT_MODE_DESIRE_NONE
end