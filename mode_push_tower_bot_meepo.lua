local utils = require(GetScriptDirectory() .. "/util")
local enemyStatus = require(GetScriptDirectory() .."/enemy_status" )
local teamStatus = require(GetScriptDirectory() .."/team_status" )
local meepoStatus = require(GetScriptDirectory() .."/meepo_status" )
----------------------------------------------------------------------------------------------------

local lane = LANE_BOT
local amPushing = false

local PUSH_STATUS_NONE = 0
local PUSH_STATUS_PUSHING = 1
local PUSH_STATUS_BEING_PUSHED = 2
local PUSH_STATUS_PUSHABLE = 3
local PUSH_STATUS_LANING = 4
local PUSH_STATUS_CONTESTED = 5


function GetDesire()
	if DotaTime() < 500 then
		return BOT_MODE_DESIRE_NONE
	end
	local npcBot = GetBot()
	local desire = 0 
	local enemyCount = 0
	local friendCount = 0
	local meepoCount = meepoStatus.GetPushing(lane)
	local laneStatus = PUSH_STATUS_NONE
	--print("---------------")
	--print("BOT")

	if amPushing then
		if #npcBot.NearbyEnemies > 0 then
			amPushing = false
			return BOT_MODE_DESIRE_NONE
		end
		return BOT_MODE_DESIRE_HIGH + .01
	end

	if #meepoCount >= 1 and meepoCount[1] ~= npcBot then
		return BOT_MODE_DESIRE_NONE
	end

	-- check who is in lane and friendly
	for _,v in pairs(teamStatus.GetHeroes()) do
		if v.lane == lane then
			if v:GetActiveMode() == BOT_MODE_LANING then
				laneStatus = PUSH_STATUS_LANING
			end
			friendCount = friendCount + 1
		end
	end
	--print("friends: "..friendCount)
	-- check who is in lane and NOT friendly
	for _,v in pairs(enemyStatus.GetHeroes()) do
		if not v.missing and v.lane == lane then
			enemyCount = enemyCount + 1
		end
	end
	--print("enemies: "..enemyCount)
	--people are still laning, bail
	if laneStatus == PUSH_STATUS_LANING then
		----print('laning')
		return BOT_MODE_DESIRE_NONE
	end

	--
	if enemyCount >= 1 and friendCount == 0 then
		--print("being pushed")
		laneStatus = PUSH_STATUS_BEING_PUSHED
	end
	if enemyCount == 0 and friendCount >= 1 then
		--print("pushing")
		laneStatus = PUSH_STATUS_PUSHING
	end
	if enemyCount == 0 and friendCount == 0 then
		--print("pushable")
		laneStatus = PUSH_STATUS_PUSHABLE
	end
	if enemyCount >= 1 and friendCount >= 1 then
		--print("contested")
		laneStatus = PUSH_STATUS_CONTESTED
	end
	

	if npcBot:GetActiveMode() ~= BOT_MODE_ATTACKING and
		npcBot:GetActiveMode() ~= BOT_MODE_RETREAT and
		npcBot:GetActiveMode() ~= BOT_MODE_DEFEND_ALLY and
		 laneStatus == PUSH_STATUS_PUSHABLE then
		if npcBot.lane == lane then
			--print("already there +.2")
			desire = desire + .2
		end
		if npcBot.lane == LANE_NONE then
			--print("Jungling +.1")
			desire = desire + .1
		end



		local laneHeadUs = GetLaneFrontAmount( GetTeam(), lane, false )
		--print(laneHeadUs)
		desire = desire + (1 - laneHeadUs)
		--print(lane .. ":" .. desire)
		--print("")
		return RemapValClamped( desire, BOT_MODE_DESIRE_MODERATE, BOT_MODE_DESIRE_ABSOLUTE, BOT_MODE_DESIRE_MODERATE, BOT_MODE_DESIRE_VERYHIGH )
	end

	return BOT_MODE_DESIRE_NONE
end

function OnStart()
	local npcBot = GetBot()
	amPushing = true

	meepoStatus.AddPushing( lane, npcBot )
	itemBOT = "item_item_travel_boots"
	for i=0, 5 do
		if(npcBot:GetItemInSlot(i) ~= nil) then
			local _item = npcBot:GetItemInSlot(i):GetName()

			if(_item == itemBOT) then
				itemBOT = npcBot:GetItemInSlot(i);

				if( itemBlink:IsFullyCastable()) then
					npcBot:Action_UseAbilityOnLocation( itemBlink, GetLaneFrontLocation( GetTeam(), lane, 300.0 ));
				end
			end
		end
	end
end

function OnEnd()
	amPushing = false
	local npcBot = GetBot()
	meepoStatus.RemovePushing( lane, npcBot )
end

function Think()
	local npcBot = GetBot()
	if #(npcBot:GetLocation() - GetLaneFrontLocation( GetTeam(), lane, 0 )) > 1000 then
		npcBot:Action_MoveToLocation(GetLaneFrontLocation( GetTeam(), lane, 0 ))
	else
		if not npcBot:IsUsingAbility() and 
			not npcBot:IsChanneling() and
			npcBot:GetAttackTarget() == nil then
			npcBot:Action_AttackMove( GetLaneFrontLocation( GetTeam(), lane, 0 ))
		end
	end
end