local utils = require(GetScriptDirectory() .. "/util")
----------------------------------------------------------------------------------------------------

local castBoundlessStrikeDesire = 0;
local castTreeDanceDesire = 0;
local castPrimalSpringDesire = 0; 
local castSpringEarlyDesire = 0;
local castMischiefDesire = 0;
local castRevertFormDesire = 0;
local castWukongDesire = 0;
local min = 0
local sec = 0
-----------------------------------------------------------------------------------------------------
local courierTime = 0

--[[function CourierUsageThink()
	local npcBot = GetBot()

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
		npcBot:Action_CourierDeliver( )
		courierTime = DotaTime()
	end
end]]
----------------------------------------------------------------------------------------------------

function AbilityUsageThink()
	local npcBot = GetBot();
	min = math.floor(DotaTime() / 60)
	sec = DotaTime() % 60

	-- Check if we're already using an ability
	if ( npcBot:IsUsingAbility() ) then return end;

	abilityBoundlessStrike = npcBot:GetAbilityByName( "monkey_king_boundless_strike" );
	abilityTreeDance = npcBot:GetAbilityByName( "monkey_king_tree_dance" );
	abilityPrimalSpring = npcBot:GetAbilityByName( "monkey_king_primal_spring" );
	--abilitySpringEarly = npcBot:GetAbilityByName( "monkey_king_spring_early" );
	abilityMischief = npcBot:GetAbilityByName( "monkey_king_mischief" );
	abilityRevertForm = npcBot:GetAbilityByName( "monkey_king_untransform" );
	abilityWukong = npcBot:GetAbilityByName( "monkey_king_wukongs_command" );
	itemBlink = "item_blink";
	itemTalon = "item_iron_talon";
	for i=0, 5 do
		if(npcBot:GetItemInSlot(i) ~= nil) then
			local _item = npcBot:GetItemInSlot(i):GetName()
			if(_item == itemBlink) then
				itemBlink = npcBot:GetItemInSlot(i);
			end
			if(_item == itemTalon) then
				itemTalon = npcBot:GetItemInSlot(i);
			end
		end
	end

	-- Consider using each ability

	castBoundlessStrikeDesire, castBoundlessStrikeTarget = ConsiderBoundlessStrike();
	castTreeDanceDesire, castTreeDanceTarget = ConsiderTreeDance();
	castPrimalSpringDesire, castPrimalSpringTarget = ConsiderPrimalSpring(); 
	--castSpringEarlyDesire = ConsiderSpringEarly();
	castMischiefDesire = ConsiderMischief();
	castRevertFormDesire = ConsiderRevertForm();
	castWukongDesire, castWukongTarget = ConsiderWukong();

	local highestDesire = castBoundlessStrikeDesire;
	local desiredSkill = 1;

	if ( castPrimalSpringDesire > highestDesire) 
		then
			highestDesire = castPrimalSpringDesire;
			desiredSkill = 2;
	end

	if ( castSpringEarlyDesire > highestDesire) 
		then
			highestDesire = castSpringEarlyDesire;
			desiredSkill = 3;
	end

	if ( castTreeDanceDesire > highestDesire) 
		then
			highestDesire = castTreeDanceDesire;
			desiredSkill = 4;
	end

	if ( castWukongDesire > highestDesire) 
		then
			highestDesire = castWukongDesire;
			desiredSkill = 5;
	end

	if ( castMischiefDesire > highestDesire) 
		then
			highestDesire = castMischiefDesire;
			desiredSkill = 6;
	end

	if ( castRevertFormDesire > highestDesire) 
		then
			highestDesire = castRevertFormDesire;
			desiredSkill = 7;
	end

	if highestDesire == 0 then return;
    elseif desiredSkill == 1 then 
		npcBot:Action_UseAbilityOnLocation( abilityBoundlessStrike, castBoundlessStrikeTarget );
    elseif desiredSkill == 2 then 
		npcBot:Action_UseAbilityOnLocation( abilityPrimalSpring, castPrimalSpringTarget );
    --elseif desiredSkill == 3 then 
	--	npcBot:Action_UseAbility( abilitySpringEarly );
    elseif desiredSkill == 4 then 
		npcBot:Action_UseAbilityOnTree( abilityTreeDance, castTreeDanceTarget );
	elseif desiredSkill == 5 then 
		npcBot:Action_UseAbilityOnLocation( abilityWukong, castWukongTarget );
	elseif desiredSkill == 6 then 
		npcBot:Action_UseAbility( abilityMischief );
	elseif desiredSkill == 7 then 
		npcBot:Action_UseAbility( abilityRevertForm );
	end	
end

----------------------------------------------------------------------------------------------------

function CanCastBoundlessStrikeOnTarget( npcTarget )
	return npcTarget:CanBeSeen() and not npcTarget:IsMagicImmune() and not npcTarget:IsInvulnerable();
end

----------------------------------------------------------------------------------------------------

function ConsiderBoundlessStrike()

	local npcBot = GetBot();

	-- Make sure it's castable
	if ( not abilityBoundlessStrike:IsFullyCastable() ) then 
		return BOT_ACTION_DESIRE_NONE;
	end;

	-- Get some of its values
	local nDamageMult = abilityBoundlessStrike:GetSpecialValueInt( "strike_crit_mult" );
	local nRadius = abilityBoundlessStrike:GetSpecialValueInt( "strike_radius" );
	local nCastRange = abilityBoundlessStrike:GetCastRange();

	if npcBot:HasModifier( "modifier_monkey_king_jingu_mastery" ) then
		local locationAoE = npcBot:FindAoELocation( true, true, npcBot:GetLocation(), nCastRange, nRadius, 0.0, 100000 );

		if ( locationAoE.count >= 2 ) 
		then
			return BOT_ACTION_DESIRE_HIGH, locationAoE.targetloc;
		end
	end

	-- If we want to cast priorities at all, bail
	--if ( castPhaseDesire > 0 or castCoilDesire > 50) then
	--	return BOT_ACTION_DESIRE_NONE;
	--end


	return BOT_ACTION_DESIRE_NONE;

end

----------------------------------------------------------------------------------------------------

function ConsiderTreeDance()

	local npcBot = GetBot();

	-- Make sure it's castable
	if ( not abilityTreeDance:IsFullyCastable() ) then 
		return BOT_ACTION_DESIRE_NONE;
	end;

	-- Get some of its values
	local nCastRange = abilityTreeDance:GetCastRange();



	local nearbyTree = npcBot:GetNearbyTrees(1000)


	-- If we want to cast priorities at all, bail
	--if ( castPhaseDesire > 0 or castCoilDesire > 50) then
	--	return BOT_ACTION_DESIRE_NONE;
	--end


	return BOT_ACTION_DESIRE_NONE;

end

----------------------------------------------------------------------------------------------------

function ConsiderPrimalSpring()
	local npcBot = GetBot();

	-- Make sure it's castable
	if ( not abilityPrimalSpring:IsFullyCastable() or not abilityPrimalSpring:IsActivated()) then 
		return BOT_ACTION_DESIRE_NONE;
	end;

	-- Get some of its values
	local nDamage = abilityPrimalSpring:GetSpecialValueInt( "impact_damage" );
	local nRadius = abilityPrimalSpring:GetSpecialValueInt( "impact_radius" );
	local nCastRange = abilityPrimalSpring:GetSpecialValueInt( "max_distance" );



	local locationAoE = npcBot:FindAoELocation( true, true, npcBot:GetLocation(), nCastRange, nRadius, 1.7, 100000 );

	if ( locationAoE.count >= 2 ) 
	then
		return BOT_ACTION_DESIRE_HIGH, locationAoE.targetloc;
	end


	return BOT_ACTION_DESIRE_NONE;

end

----------------------------------------------------------------------------------------------------
--[[
function ConsiderSpringEarly()

	local npcBot = GetBot();

	-- Make sure it's castable
	if ( not abilitySpringEarly:IsFullyCastable() ) then 
		return BOT_ACTION_DESIRE_NONE;
	end;

	-- If we want to cast priorities at all, bail
	--if ( castPhaseDesire > 0 or castCoilDesire > 50) then
	--	return BOT_ACTION_DESIRE_NONE;
	--end


	return BOT_ACTION_DESIRE_NONE;

end
]]
----------------------------------------------------------------------------------------------------

function ConsiderWukong()

	local npcBot = GetBot();

	-- Make sure it's castable
	if ( not abilityWukong:IsFullyCastable() ) then 
		return BOT_ACTION_DESIRE_NONE;
	end;

	-- Get some of its values
	local nDamage = abilityWukong:GetSpecialValueInt( "bonus_damage" );
	local nRadius = abilityWukong:GetSpecialValueInt( "second_radius" );
	local nCastRange = abilityWukong:GetSpecialValueInt( "cast_range" );

	local locationAoE = npcBot:FindAoELocation( true, true, npcBot:GetLocation(), nCastRange, nRadius, 0.0, 100000 );

	if ( locationAoE.count >= 4 ) 
	then
		return BOT_ACTION_DESIRE_HIGH, locationAoE.targetloc;
	end


	return BOT_ACTION_DESIRE_NONE;

end

----------------------------------------------------------------------------------------------------

function ConsiderMischief()

	local npcBot = GetBot();

	-- Make sure it's castable
	if ( not abilityMischief:IsFullyCastable() ) then 
		return BOT_ACTION_DESIRE_NONE;
	end;

	-- If we want to cast priorities at all, bail
	--if ( castPhaseDesire > 0 or castCoilDesire > 50) then
	--	return BOT_ACTION_DESIRE_NONE;
	--end


	return BOT_ACTION_DESIRE_NONE;

end

----------------------------------------------------------------------------------------------------

function ConsiderRevertForm()

	local npcBot = GetBot();

	-- Make sure it's castable
	if ( not abilityRevertForm:IsFullyCastable() ) then 
		return BOT_ACTION_DESIRE_NONE;
	end;

	-- If we want to cast priorities at all, bail
	--if ( castPhaseDesire > 0 or castCoilDesire > 50) then
	--	return BOT_ACTION_DESIRE_NONE;
	--end


	return BOT_ACTION_DESIRE_NONE;

end
