local utils = require(GetScriptDirectory() .. "/util")
require( GetScriptDirectory().."/jungle_status" )
--print("Farm mode instantiated")
----------------------------------------------------------------------------------------------------

STATE_IDLE = "STATE_IDLE"
STATE_MOVING_TOCAMP = "STATE_MOVING_TOCAMP"
STATE_STACKING_CAMP = "STATE_STACKING_CAMP"
STATE_ATTACKING_CAMP = "STATE_ATTACKING_CAMP"
STATE_RUNE_HUNTING = "STATE_RUNE_HUNTING"
STATE_GATHERING_RUNE = "STATE_GATHERING_RUNE"

local state = STATE_IDLE
local npcBot = GetBot()
local player = npcBot:GetPlayer()
local team = GetTeam()
local level = utils.GetHeroLevel()
local clone = -1
jungle_status.NewJungle()
local campToFarm = nil
local campToStack = nil
local rune
local creepRespawn = true
local runeRespawn = true
local min = 0
local sec = 0

----------------------------------------------------------------------------------------------------

function GetDesire()
	--print(tostring(GetRuneStatus( RUNE_BOUNTY_1 ) == RUNE_STATUS_AVAILABLE ))
	local desireMultiplier = 1
	level = utils.GetHeroLevel()
	min = math.floor(DotaTime() / 60)
	sec = DotaTime() % 60
	local camplvl = CAMP_EASY

	--set clone#
	if(clone == -1) then
		if(level > 16)then
			clone = 3;
		elseif(level > 9)then
			clone = 2;
		elseif(level > 2)then
			clone = 1;
		else
			clone = 0;
		end
		--print("clone " .. clone)
	end

	--TODO Get this mess outta here...
	if (npcBot:GetActiveMode() ~= BOT_MODE_RETREAT and
		npcBot:GetActiveMode() ~= BOT_MODE_EVASIVE_MANEUVERS and
		npcBot:GetActiveMode() ~= BOT_MODE_DEFEND_ALLY)
	then
		GrabRune()
	end

	if ( (npcBot:GetActiveMode() ~= BOT_MODE_RETREAT and
		npcBot:GetActiveMode() ~= BOT_MODE_EVASIVE_MANEUVERS and
		npcBot:GetActiveMode() ~= BOT_MODE_ATTACKING and
		npcBot:GetActiveMode() ~= BOT_MODE_DEFEND_ALLY) and 
		((clone == 0 and level < 2) or 
		(clone == 1 and level < 11) or 
		(clone == 0 and level > 10)) and 
		min % 2 == 1 and sec > 50) 
	then
    	npcBot:Action_MoveToLocation( utils.NearestRuneSpawn(npcBot, utils.tableRuneSpawns[POWERUP_RUNES]))
		return BOT_MODE_DESIRE_VERY_HIGH
	end

	if level > 20 then
		desireMultiplier = .6
	end

	--respawn camps
	if creepRespawn and (min % 2) == 1 then
		jungle_status.NewJungle() 
		runeRespawn = true
		creepRespawn = false
	end

	if runeRespawn and (min % 2) == 0 then
		runeRespawn = false
		creepRespawn = true
	end

	if jungle_status.GetJungle(team) == nil then
		--return BOT_MODE_DESIRE_NONE
	end

	--don't leave fights
	local tableNearbyAttackingAlliedHeroes = npcBot:GetNearbyHeroes( 1300, false, BOT_MODE_NONE );
	for _,v in pairs(tableNearbyAttackingAlliedHeroes) do
		if (v:GetActiveMode() == BOT_MODE_ATTACKING or
			v:GetActiveMode() == BOT_MODE_RETREAT or
			v:GetActiveMode() == BOT_MODE_DEFEND_ALLY)
		then
			return BOT_MODE_DESIRE_NONE
		end
	end

	-- get the main in the jungle for shield benefit at low lvl
	-- then move the main to start roaming later
	if level > 2 and level < 11 then
		if clone == 1 then
			--print("I'm the lane bitch")
			return RemapValClamped( 0.0 * desireMultiplier, 0.0, 1.0, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_ABSOLUTE );
		end
			return RemapValClamped( (npcBot:GetHealth() / (npcBot:GetMaxHealth() * 1.2))* desireMultiplier , 0.0, 1.0, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_ABSOLUTE );
	else
		if clone == 0 then
			--print("Time to roam")
			return RemapValClamped( 0.0 * desireMultiplier, 0.0, 1.0, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_ABSOLUTE );
		end
			return RemapValClamped( (npcBot:GetHealth() / (npcBot:GetMaxHealth() * 1.2))* desireMultiplier , 0.0, 1.0, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_ABSOLUTE );
	end
	return RemapValClamped( 0.0 * desireMultiplier, 0.0, 1.0, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_HIGH );
end

----------------------------------------------------------------------------------------------------

function OnStart()
	
end

----------------------------------------------------------------------------------------------------

function OnEnd() 

end

----------------------------------------------------------------------------------------------------

function Think()	
	--print(clone .. ":" .. state)
	min = math.floor(DotaTime() / 60)
	sec = DotaTime() % 60

	-- force rune attemp TODO get this mess outta here...
	if ( min >=1 and 
		((clone == 0 and level < 2) or 
		(clone == 1 and level < 11) or 
		(clone == 0 and level > 10)) and 
		min % 2 == 1 and sec > 50) 
	then
    	npcBot:Action_MoveToLocation( utils.NearestRuneSpawn(npcBot, utils.tableRuneSpawns[POWERUP_RUNES]))
    	return
    end

	-- check if time to setup stacking
	if (not (state == STATE_MOVING_TOSTACK or
		state == STATE_STACKING_CAMP) and min % 2 == 0 and sec > 40) then
		--print("Stack Time!")
		local tableCreeps = npcBot:GetNearbyCreeps( 700, true ) 

		--finish the camp if you can
		if tableCreeps[1] ~= nil then
			local remainingHealth = 0
			for _,v in pairs(tableCreeps) do
				remainingHealth = remainingHealth + v:GetHealth()
			end
			if remainingHealth > npcBot:GetEstimatedDamageToTarget( false, tableCreeps[1], 10.0, 1 ) then
				campToStack = campToFarm
				state = STATE_STACKING_CAMP
				return
			end
		end	
		--utils.print_r(jungle_status.GetJungle(team))
		if jungle_status.GetJungle(team) == nil then
			--print("whole jungle dead")			
			campToFarm = { [VECTOR] = utils.tableRuneSpawns[team][1] }
			state = STATE_IDLE
		else
			campToStack = utils.NearestNeutralCamp( npcBot, jungle_status.GetJungle(team))
			state = STATE_MOVING_TOSTACK
		end
	end

	-- check if time to for runes
	if ( min % 2 == 1 and sec > 50) then
		--print("Rune Time!")
		rune = utils.NearestRuneSpawn(npcBot, utils.tableRuneSpawns[team])
		state = STATE_RUNE_HUNTING
		return
	end

	if state == STATE_IDLE then
		--print("#"..clone.." is IDLE")
		-- setup jungle decisions for current level
		local campsICanHandle = utils.deepcopy(jungle_status.GetJungle(team))
		if campsICanHandle ~= nil then
			camplvl = CAMP_EASY
			if level > 4 then camplvl = CAMP_MEDIUM end
			if level > 8 then camplvl = CAMP_HARD end
			if level > 13 then camplvl = CAMP_ANCIENT end
			for i=#campsICanHandle,1,-1 do
				if campsICanHandle[i][DIFFICULTY] > camplvl then
					campsICanHandle[i] = nil	
				end
			end
			if campsICanHandle ~= nil then
				campToFarm = utils.NearestNeutralCamp( npcBot, campsICanHandle)
			end
		end
		--print("campToFarm:"..campToFarm)
		if campToFarm == nil then return end
		state = STATE_MOVING_TOCAMP
	end

	if state == STATE_MOVING_TOCAMP then
		--print("#"..clone.." is MOVING to camp:"..campToFarm)
		if GetUnitToLocationDistance( npcBot, campToFarm[VECTOR] ) < 200 then
			state = STATE_ATTACKING_CAMP
		else
			npcBot:Action_MoveToLocation( campToFarm[VECTOR] )
			return
		end
	end

	if state == STATE_MOVING_TOSTACK then
		--print("#"..clone.." is MOVING to stack:".. tostring(campToFarm))
		if GetUnitToLocationDistance( npcBot, campToStack[PRE_STACK_VECTOR] ) < 200 then
			state = STATE_STACKING_CAMP
		else
			npcBot:Action_MoveToLocation( campToStack[PRE_STACK_VECTOR] )
			return
		end
	end

	if state == STATE_ATTACKING_CAMP then
		--print("#"..clone.." is ATTACKING  camp:"..campToFarm)
		local tableCreeps = npcBot:GetNearbyCreeps( 700, true ) 
		if tableCreeps[1] == nil then
			if GetUnitToLocationDistance( npcBot, campToFarm[VECTOR]) < 200 
			then
				jungle_status.JungleCampClear( team, campToFarm[VECTOR] )
			end
			state = STATE_IDLE
		else
			if npcBot:GetAttackTarget() == nil then
				npcBot:Action_AttackUnit( tableCreeps[1], false )
			end
			return
		end	
	end

	if state == STATE_STACKING_CAMP then
		--print("#"..clone.." is STACKING camp:"..campToFarm)
		if min % 2 == 1 then 
			state = STATE_IDLE
			return
			--stack
		elseif campToStack[STACK_TIME] <= sec then
			npcBot:Action_MoveToLocation( campToStack[STACK_VECTOR] )
			return
			--aggro
		elseif (campToStack[STACK_TIME] - 1) <= sec then
			local tableCreeps = npcBot:GetNearbyCreeps( 700, true ) 
			if tableCreeps[1] == nil then
				npcBot:Action_MoveToLocation( campToStack[STACK_VECTOR] )
			else
				if npcBot:GetAttackTarget() == nil then
					npcBot:Action_AttackUnit( tableCreeps[1], false )
				end
				return
			end	
			--prep
		elseif (campToStack[STACK_TIME] - 1) > sec then
			npcBot:Action_MoveToLocation( campToStack[PRE_STACK_VECTOR] )
			return
		end
	end

	if state == STATE_RUNE_HUNTING then
		if GetUnitToLocationDistance( npcBot, rune ) < 200 and min % 2 == 0 then
			state = STATE_IDLE
		end
		npcBot:Action_MoveToLocation(rune)
	end
end

function GrabRune()
	
	-- grab a rune if we walk by it
	if (GetUnitToLocationDistance( npcBot , RAD_BOUNTY_RUNE_SAFE) < 450 and
		GetRuneStatus( RUNE_BOUNTY_1 ) == RUNE_STATUS_AVAILABLE )
	then   
    	npcBot:Action_PickUpRune(RUNE_BOUNTY_1);
    elseif (GetUnitToLocationDistance( npcBot , RAD_BOUNTY_RUNE_OFF) < 450 and
		GetRuneStatus( RUNE_BOUNTY_2 ) == RUNE_STATUS_AVAILABLE )
	then   
    	npcBot:Action_PickUpRune(RUNE_BOUNTY_2);
	elseif (GetUnitToLocationDistance( npcBot , DIRE_BOUNTY_RUNE_SAFE) < 450 and
		GetRuneStatus( RUNE_BOUNTY_3 ) == RUNE_STATUS_AVAILABLE )
	then   
    	npcBot:Action_PickUpRune(RUNE_BOUNTY_3);
	elseif (GetUnitToLocationDistance( npcBot , DIRE_BOUNTY_RUNE_OFF) < 450 and
		GetRuneStatus( RUNE_BOUNTY_4 ) == RUNE_STATUS_AVAILABLE )
	then    
    	npcBot:Action_PickUpRune(RUNE_BOUNTY_4);
    elseif (GetUnitToLocationDistance( npcBot , POWERUP_RUNE_TOP) < 450 and
		GetRuneStatus( RUNE_POWERUP_1 ) == RUNE_STATUS_AVAILABLE )
	then    
    	npcBot:Action_PickUpRune(RUNE_POWERUP_1);
    elseif (GetUnitToLocationDistance( npcBot , POWERUP_RUNE_BOT) < 450 and
		GetRuneStatus( RUNE_POWERUP_2 ) == RUNE_STATUS_AVAILABLE )
	then    
    	npcBot:Action_PickUpRune(RUNE_POWERUP_2);
    end
end