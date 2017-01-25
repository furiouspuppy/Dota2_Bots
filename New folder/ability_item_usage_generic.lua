local utils = require(GetScriptDirectory() .. "/util")
local teamStatus = require(GetScriptDirectory() .."/team_status" )
local inspect = require(GetScriptDirectory() .. "/inspect")
----------------------------------------------------------------------------------------------------
local courierTime = 0

function CourierUsageThink()
	
	local npcBot = GetBot()

	--print(GetCourierState(GetCourier(0)))

	if (IsCourierAvailable() and
		npcBot:DistanceFromFountain() < 9000 and 
		DotaTime() > (courierTime + 5) and
		(npcBot:GetCourierValue( ) > 0 or
		npcBot:GetStashValue( ) > 0) and
		npcBot:GetActiveMode() ~= BOT_MODE_ATTACK and
		npcBot:GetActiveMode() ~= BOT_MODE_RETREAT and
		npcBot:GetActiveMode() ~= BOT_MODE_EVASIVE_MANEUVERS and
		npcBot:GetActiveMode() ~= BOT_MODE_DEFEND_ALLY)
	then
		--npcBot:Action_Courier(  )
		courierTime = DotaTime()
	end
end
--[[
courier_burst
courier_go_to_secretshop
courier_return_stash_items

courier_return_to_base
courier_shield
courier_take_stash_items
courier_transfer_items
]]