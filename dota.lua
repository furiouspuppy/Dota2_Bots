-- Master Game State
local Dota = {}

TASK_STATUS_INACTIVE = 0
TASK_STATUS_ACTIVE = 1
TASK_STATUS_SUCCESS = 2
TASK_STATUS_FAILURE = 3

TASK_RESULT_INACTIVE = 0
TASK_RESULT_ACTIVE = 1
TASK_RESULT_SUCCESS = 2
TASK_RESULT_FAILURE = 3

function Dota.Task( name )
	local self = {}

	local taskName = name
	local status = TASK_STATUS_INACTIVE
	local result = nil

	function self.TaskName(  )
		return taskName
	end

	function self.Status(  )
		return status
	end

	function self.StatusColor(  )
		if  status == TASK_STATUS_INACTIVE then
			return 255, 255, 255
		elseif status == TASK_STATUS_ACTIVE then
			return 0, 255, 255
		elseif status == TASK_STATUS_SUCCESS then
			return 0, 255, 0
		elseif status == TASK_STATUS_FAILURE then
			return 255, 0, 0
		end
	end

	function self.SetStatus( newStatus )
		status = newStatus
	end

	function self.EndTask( taskResult )
		result = taskResult
	end

	return self
end

printHeight = 100

function Dota.TaskDebug( TaskList )
	local drawX = 050
	local drawY = 150 + GetBot():GetPlayerID() * 10
	local name = string.sub(GetBot():GetUnitName(), 15) .. ": "
	DebugDrawText( drawX, drawY, name, 255, 255, 255 )
	drawX = drawX + 150
	for i=#TaskList, 0, -1 do
		if TaskList[i] then
			local drawText = TaskList[i].TaskName()
			if i > 1 then
				drawText = drawText .. "-> "
			end
			local r,g,b = TaskList[i].StatusColor()
			DebugDrawText( drawX, drawY, drawText, r, g, b )
			drawX = drawX + (#drawText * 7 )
		end
	end
end
--[[ Things to consider for a task
Heroes
	How many needed?
	How many tolerated?
Desire/Importance
Accessability
Danger
Prereqs
Begin State
End State
Progress
	Measure?
]]

--[[  Tasks to consider
Jungle
	Pulling Camps
	Stacking Camps
	Killing Camps
	Blocking Camps
	Unblocking Camps
Support
	Warding
	Dewarding
Scouting
Pushing
	Lane?
	Highground?
Laning 
Defending
	Lane?
	Importance?
Fighting
	Ganking
	Ganked
	Team
	?
Roaming
Retreating
	Need Help?
	Danger level
	retreating to
Item
	secret_shop
	side_shop
	Ground?
	Aegis?
Runes
Assemble
team_roam
Farm
	Where
	Help?
defend_ally
	Should I help?
	Can I help?
	Can I get there?
	Die for them?

evasive_maneuvers
	What am I running from?
	Where am I running to?
roshan
	Help?
]]

return Dota