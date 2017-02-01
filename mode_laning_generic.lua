local dota = require( GetScriptDirectory() .."/dota" )

function OnStart(  )
	table.insert(GetBot().TaskList, 1, dota.Task(GetBot():GetUnitName()))
end