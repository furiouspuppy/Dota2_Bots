local utils = require(GetScriptDirectory() .. "/util")
local teamStatus = require(GetScriptDirectory() .. "/team_status" )
----------------------------------------------------------------------------------------------------
local X = {}

local tableMeepos = {}
local isFarmed = false
local pushing = {
	[LANE_TOP] = {};
	[LANE_MID] = {};
	[LANE_BOT] = {};
}
local laning = {}
local farming = {}

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.AddMeepo ( meepo )
	table.insert(tableMeepos, meepo)
	--utils.print_r(tableMeepos)
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.GetMeepos ()
	return tableMeepos
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.GetIsFarmed()
	return isFarmed
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.SetIsFarmed( bFarmed )
	isFarmed = bFarmed
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.GetPushing( nLane )
	--print(tostring(pushing[nLane]))
	return pushing[nLane]
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.AddPushing( nLane, hMeepo )
	table.insert(pushing[nLane], hMeepo)
	--print(tostring(pushing[nLane]))
	return pushing[nLane]
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function X.RemovePushing( nLane, hMeepo )
	for i,v in pairs(pushing[nLane]) do
		if v == hMeepo then
			table.remove(pushing[nLane], i)
		end
	end
	--print(tostring(pushing[nLane]))
	return pushing[nLane]
end


----------------------------------------------------------------------------------------------------

return X