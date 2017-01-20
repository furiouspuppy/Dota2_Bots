local enemyStatus = require(GetScriptDirectory() .."/enemy_status" )
local teamStatus = require(GetScriptDirectory() .."/team_status" )
----------------------------------------------------------------------------------------------------

function GetDesire()
	local npcBot = GetBot()

	for i=0, 5 do
		if(npcBot:GetItemInSlot(i) ~= nil) then
			local _item = npcBot:GetItemInSlot(i):GetName()
			if(_item == "item_ward_observer") then
				return 0.0 --BOT_MODE_DESIRE_MODERATE
			end
		end
	end
	return ( 0.0 );
end
--[[
--npc_dota_observer_wards
function Think()	
	local npcBot = GetBot()
	local wardSpots = utils.deepcopy(utils["tableWardSpots"])

    local units = GetUnitList(UNIT_LIST_ALL)
    local wards = {}
	for i,v in pairs(units) do
	    if v:GetUnitName() == "npc_dota_observer_wards" then
	    	table.insert(wards, v)
	    end
	end

	for i,v in pairs(wards) do
		for i,w in pairs(wardSpots) do
			local distance = w - v:GetLocation()
			if #distance < 1000 then
				w = nil
			end
		end
	end


end
]]