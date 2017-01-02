_G._savedEnv = getfenv()
module( "meepo_status", package.seeall )
local utils = require(GetScriptDirectory() .. "/util")

local tableMeepos = {}

----------------------------------------------------------------------------------------------------
--know thy enemy
function AddMeepo ( meepo )
	table.insert(tableMeepos, meepo)
end

----------------------------------------------------------------------------------------------------
--know thy enemy
function GetMeepos ()
	return tableMeepos
end

----------------------------------------------------------------------------------------------------

for k,v in pairs( meepo_status ) do	_G._savedEnv[k] = v end