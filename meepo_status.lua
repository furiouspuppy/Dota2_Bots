local utils = require(GetScriptDirectory() .. "/util")
----------------------------------------------------------------------------------------------------
local X = {}

local tableMeepos = {}

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

return X