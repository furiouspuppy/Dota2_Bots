local X = {}
local vec = require(GetScriptDirectory().."/Vectors")
X.tableNeutralCamps = vec["tableNeutralCamps"]  -- constant - shouldn't be modified runtime use X.jungle instead
X.tableRuneSpawns = vec["tableRuneSpawns"]
----------------------------------------------------------------------------------------------------

function X.IsFacingEntity( hUnit, hTarget, degAccuracy )

    local degree = nil;

    -- Do we have a target?
    if(hTarget ~= nil)
    then
        -- Get my hero and my heros target location
        local unitX = hUnit:GetLocation()[1];
        local unitY = hUnit:GetLocation()[2];
        local targetX = hTarget:GetLocation()[1];
        local targetY = hTarget:GetLocation()[2];

        local vX = (targetX-unitX);
        local vY = (targetY-unitY);

        local radians = math.atan2( vY , vX );
        degree = (radians * 180 / math.pi);

        -- We adjust the angle
        degree = degree - 45; 

        if ( degree < 0 )
        then
            degree = degree + 360;
        end

        -- Time to check if the facing is good enough
        local botBoundary = degree - degAccuracy;        
        local topBoundary = degree + degAccuracy;
        local flippedBoundaries = false;

        if(botBoundary < 0)
        then
            botBoundary = botBoundary + 360;
            flippedBoundaries = true;
        end

        if(topBoundary > 360)
        then
            topBoundary = topBoundary - 360;
            flippedBoundaries = true;
        end
        print("is facing! " .. degree .. ":" .. hUnit:GetFacing() .. ":" .. degree - hUnit:GetFacing());
        if( ( flippedBoundaries and (topBoundary < hUnit:GetFacing() ) and ( hUnit:GetFacing() < botBoundary) ) or 
        ( not flippedBoundaries and (botBoundary < hUnit:GetFacing() ) and ( hUnit:GetFacing() < topBoundary) )    )
        then
            --print("is facing! " .. degree .. ":" .. GetFacing() .. ":" .. degree - unit:GetFacing());
            return true
        end
    end

    return false
--[[
    if(degree ~= nil)
    then
        -- debug info
        print("-----------------------------")
        print("degree: ");
        print(degree);
        print("facing: ");
        print(GetBot():GetFacing());
        grades = nil;
    end]]
end

----------------------------------------------------------------------------------------------------

function X.GetXUnitsTowardsLocation( fromloc, toloc, units)
    -- Get angle
    local unitX = fromloc[1];
    local unitY = fromloc[2];
    local targetX = toloc[1];
    local targetY = toloc[2];

    local vX = (targetX-unitX);
    local vY = (targetY-unitY);

    local radians = math.atan2( vY , vX );
    --radians = radians - 0.785398 --correct angle
    local pointx = fromloc[1] + (math.cos(radians) * units);
    local pointy = fromloc[2] + (math.sin(radians) * units);
    
    return Vector(pointx,pointy);
end

----------------------------------------------------------------------------------------------------

function X.GetXUnitsInFront( hUnit, units)
    -- Get angle
    local unitX = hUnit:GetLocation()[1];
    local unitY = hUnit:GetLocation()[2];

    local direction = hUnit:GetFacing() * 3.1415926535 / 180;

    local point = Vector(unitX + (math.cos(direction) * units), unitY + (math.sin(direction) * units))

    return point;
end

----------------------------------------------------------------------------------------------------

-- util function for printing a table
function X.print_r ( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end


----------------------------------------------------------------------------------------------------

--function to get current hero level
function X.GetHeroLevel()
    local npcBot = GetBot();
    local respawnTable = {8, 10, 12, 14, 16, 26, 28, 30, 32, 34, 36, 46, 48, 50, 52, 54, 56, 66, 70, 74, 78,  82, 86, 90, 100};
    local nRespawnTime = npcBot:GetRespawnTime() +1 -- It gives 1 second lower values.
    for k,v in pairs (respawnTable) do
        if v == nRespawnTime then
        return k
        end
    end
end

----------------------------------------------------------------------------------------------------

function X.NearestNeutralCamp( hUnit, tCamps )
    local closestDistance = 1000000;
    local closestCamp;
    for k,v in ipairs(tCamps) do
        if v ~= nil and GetUnitToLocationDistance( hUnit, v[VECTOR] ) < closestDistance then
            closestDistance = GetUnitToLocationDistance( hUnit, v[VECTOR] )
            closestCamp = v
            --print(closestCamp..":"..closestDistance)
        end
    end
    return closestCamp
end

----------------------------------------------------------------------------------------------------

function X.NearestRuneSpawn( hUnit, tSpawnVecs )
    local closestDistance = 1000000;
    local closestCamp;
    for k,v in ipairs(tSpawnVecs) do
        if v ~= nil and GetUnitToLocationDistance( hUnit, v ) < closestDistance then
            closestDistance = GetUnitToLocationDistance( hUnit, v )
            closestCamp = v
            --print(closestCamp..":"..closestDistance)
        end
    end
    return closestCamp
end

----------------------------------------------------------------------------------------------------

function X.DistanceToNeutrals(hUnit, largestCampType)
    local camps = {}
    local sCamps = {}
    for i,v in ipairs(vec["tableNeutralCamps"][CAMP_EASY]) do
        camps[GetUnitToLocationDistance( hUnit, v )] = v
    end
    if largestCampType == CAMP_EASY then
        for k,v in spairs(HighScore, function(t,a,b) return t[b] < t[a] end) do
            sCamps[k] = v
        end
        return camps
    end
    for i,v in ipairs(vec["tableNeutralCamps"][CAMP_MEDIUM]) do
        camps[GetUnitToLocationDistance( hUnit, v )] = v
    end
    if largestCampType == CAMP_MEDIUM then
        for k,v in spairs(HighScore, function(t,a,b) return t[b] < t[a] end) do
            sCamps[k] = v
        end
    return camps
    end
    for i,v in ipairs(vec["tableNeutralCamps"][CAMP_HARD]) do
        camps[GetUnitToLocationDistance( hUnit, v )] = v
    end
    if largestCampType == CAMP_HARD then
        for k,v in spairs(HighScore, function(t,a,b) return t[b] < t[a] end) do
            sCamps[k] = v
        end
        return camps
    end
    for i,v in ipairs(vec["tableNeutralCamps"][CAMP_ANCIENT]) do
        camps[GetUnitToLocationDistance( hUnit, v )] = v
    end

    for k,v in spairs(HighScore, function(t,a,b) return t[b] < t[a] end) do
        sCamps[k] = v
    end
    return camps
end

----------------------------------------------------------------------------------------------------

function compare(a,b)
  return a[1] < b[1]
end

----------------------------------------------------------------------------------------------------

function X.spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

----------------------------------------------------------------------------------------------------

function X.cloneTable(t)    
  return {unpack(t)}
end

----------------------------------------------------------------------------------------------------

function X.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[X.deepcopy(orig_key)] = X.deepcopy(orig_value)
        end
        setmetatable(copy, X.deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

----------------------------------------------------------------------------------------------------

--check if a path from nloc1 to nloc2 that is nWidth wide is clear of units
function X.isSkillPathClearOfUnits( hCaster, vTargetLoc, nWidth)
    local heroWidth = 24 --this isn't true for lycan/naga/pl who are 8
    local dist = heroWidth + nWidth + 1
    local pointcount = GetUnitToLocationDistance(hCaster, vTargetLoc) / nWidth - 2
    local pointlist = {}
    local currentPoint = X.GetXUnitsTowardsLocation( vTargetLoc, hCaster:GetLocation(), dist )
    
    for i=0,pointcount do
        --[[
        for _,v in pairs(pointlist) do
            DebugDrawCircle( v, nWidth, 0, 255, 50 )
            DebugDrawCircle( hCaster:GetLocation(), nWidth, 0, 50, 255 )
            DebugDrawCircle( vTargetLoc, nWidth, 255, 50, 50 )
        end
        ]]

        table.insert(pointlist, currentPoint)
        --print("added point")
        dist = dist + nWidth
        currentPoint = X.GetXUnitsTowardsLocation( vTargetLoc, hCaster:GetLocation(), dist )
        --print(GetUnitToLocationDistance(hCaster, currentPoint))
    end

--[[ 
    for _,v in pairs(pointlist) do
        DebugDrawCircle( v, nWidth, 0, 255, 50 )
        DebugDrawCircle( hCaster:GetLocation(), nWidth, 0, 50, 255 )
        DebugDrawCircle( vTargetLoc, nWidth, 255, 50, 50 )
    end
]]
    for _,v in pairs(pointlist) do
        --print("checking point")
        --DebugDrawCircle( v, nWidth, 0, 255, 50 )
        --DebugDrawCircle( hCaster:GetLocation(), nWidth, 0, 50, 255 )
        --DebugDrawCircle( vTargetLoc, nWidth, 255, 50, 50 )
        local enemyHeroes = hCaster:FindAoELocation( true, true, v, 0, nWidth, 0.0, 100000 ) 
        local enemyCreeps = hCaster:FindAoELocation( true, false, v, 0, nWidth, 0.0, 100000 ) 
        local friendlyHeroes = hCaster:FindAoELocation( false, true, v, 0, nWidth, 0.0, 100000 ) 
        local friendlyCreeps = hCaster:FindAoELocation( false, false, v, 0, nWidth, 0.0, 100000 ) 
        if (enemyHeroes.count > 0 or
            enemyCreeps.count > 0 or
            friendlyHeroes.count > 0 or
            friendlyCreeps.count > 0)
        then
            --print("path blocked")
            return false
        end
    end
    --print("Path Clear!")
    return true
end

----------------------------------------------------------------------------------------------------

return X;