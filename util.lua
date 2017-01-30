local utilsModule = {}

local vec = require(GetScriptDirectory() .."/Vectors")
local BotData = require(GetScriptDirectory() .."/BotData")

utilsModule["tableNeutralCamps"] = vec.tableNeutralCamps  -- constant - shouldn't be modified runtime use X.jungle instead
utilsModule["tableRuneSpawns"] = vec.tableRuneSpawns
utilsModule.Roles = BotData.Roles
----------------------------------------------------------------------------------------------------

CDOTA_Bot_Script.secretShopMode = false
CDOTA_Bot_Script.AttackPower = 0
CDOTA_Bot_Script.MagicPower = 0
CDOTA_Bot_Script.Role = 0
CDOTA_Bot_Script.NeedsHelp = false
CDOTA_Bot_Script.CanHelp = true
CDOTA_Bot_Script.IsReady = false
CDOTA_Bot_Script.CanPush = false
CDOTA_Bot_Script.IsFighting = false
CDOTA_Bot_Script.LostCause = false
CDOTA_Bot_Script.hasGlobal = false
CDOTA_Bot_Script.missing = true
CDOTA_Bot_Script.lane = LANE_NONE
CDOTA_Bot_Script.NearbyFriends = {}
CDOTA_Bot_Script.NearbyEnemies = {}
----------------------------------------------------------------------------------------------------

function CDOTA_Bot_Script:GetForwardVector()
    local radians = self:GetFacing() * math.pi / 180
    local forward_vector = Vector(math.cos(radians), math.sin(radians))
    return forward_vector
end

----------------------------------------------------------------------------------------------------

function CDOTA_Bot_Script:IsFacingUnit( hTarget, degAccuracy )
    local direction = (hTarget:GetLocation() - self:GetLocation()):Normalized()
    local dot = direction:Dot(self:GetForwardVector())
    local radians = degAccuracy * math.pi / 180
    return dot > math.cos(radians)
end

----------------------------------------------------------------------------------------------------

function CDOTA_Bot_Script:GetXUnitsTowardsLocation( vLocation, nUnits)
    local direction = (vLocation - self:GetLocation()):Normalized()
    return self:GetLocation() + direction * nUnits
end

----------------------------------------------------------------------------------------------------

function CDOTA_Bot_Script:GetXUnitsInFront( nUnits )
    return self:GetLocation() + self:GetForwardVector() * nUnits
end

----------------------------------------------------------------------------------------------------

function CDOTA_Bot_Script:GetNearestNeutrals( tCamps )
    local closestDistance = 1000000;
    local closestCamp;
    for k,v in ipairs(tCamps) do
        if v ~= nil and GetUnitToLocationDistance( self, v[VECTOR] ) < closestDistance then
            closestDistance = GetUnitToLocationDistance( self, v[VECTOR] )
            closestCamp = v
        end
    end
    return closestCamp
end

----------------------------------------------------------------------------------------------------

function CDOTA_Bot_Script:GetNearest( tVecs )
    local closestDistance = 1000000;
    local closestCamp;
    for k,v in ipairs(tVecs) do
        if v ~= nil and GetUnitToLocationDistance( self, v ) < closestDistance then
            closestDistance = GetUnitToLocationDistance( self, v )
            closestCamp = v
        end
    end
    return closestCamp
end

----------------------------------------------------------------------------------------------------

function CDOTA_Bot_Script:GetLocationDanger()
    return utilsModule.GetLocationDanger(self:GetLocation())
end

----------------------------------------------------------------------------------------------------

function CDOTA_Bot_Script:GetLane()
    return utilsModule.GetLane(self:GetLocation())
end

----------------------------------------------------------------------------------------------------
--check if a path from nloc1 to nloc2 that is nWidth wide is clear of units
function CDOTA_Bot_Script:IsSkillPathClear( vTargetLoc, nWidth, bFriends)
    local heroWidth = 24 --this isn't true for lycan/naga/pl who are 8
    local dist = heroWidth + nWidth + 1
    local pointcount = math.floor(GetUnitToLocationDistance(self, vTargetLoc) / nWidth - 2)
    print(pointcount)
    local pointlist = {}
    local currentPoint = GetBot():GetXUnitsTowardsLocation( vTargetLoc, dist )

    for i=0,pointcount do
        --[[
        for _,v in pairs(pointlist) do
            DebugDrawCircle( v, nWidth, 0, 255, 50 )
            DebugDrawCircle( self:GetLocation(), nWidth, 0, 50, 255 )
            DebugDrawCircle( vTargetLoc, nWidth, 255, 50, 50 )
        end
        ]]

        table.insert(pointlist, currentPoint)
        --print("added point")
        dist = dist + nWidth
        currentPoint = GetBot():GetXUnitsTowardsLocation( vTargetLoc, dist )
        --print(GetUnitToLocationDistance(self, currentPoint))
    end

 
    for _,v in pairs(pointlist) do
        DebugDrawCircle( v, nWidth, 0, 255, 50 )
        DebugDrawCircle( self:GetLocation(), nWidth, 0, 50, 255 )
        DebugDrawCircle( vTargetLoc, nWidth, 255, 50, 50 )
    end

   for _,v in pairs(pointlist) do
        --print("checking point")
        --DebugDrawCircle( v, nWidth, 0, 255, 50 )
        --DebugDrawCircle( self:GetLocation(), nWidth, 0, 50, 255 )
        --DebugDrawCircle( vTargetLoc, nWidth, 255, 50, 50 )
        local enemyHeroes = self:FindAoELocation( true, true, v, 0, nWidth, 0.0, 100000 ) 
        local enemyCreeps = self:FindAoELocation( true, false, v, 0, nWidth, 0.0, 100000 ) 
        local friendlyHeroes = self:FindAoELocation( false, true, v, 0, nWidth, 0.0, 100000 ) 
        local friendlyCreeps = self:FindAoELocation( false, false, v, 0, nWidth, 0.0, 100000 ) 
        if not bFriends then
            friendlyHeroes = 0
            friendlyCreeps = 0
        end
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
 
-- util function for printing a table
function utilsModule.print_r(t)--print_r ( t )  
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

function utilsModule.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[utilsModule.deepcopy(orig_key)] = utilsModule.deepcopy(orig_value)
        end
        setmetatable(copy, utilsModule.deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

----------------------------------------------------------------------------------------------------

function utilsModule.GetEnemyTeam()
    if GetTeam() == TEAM_RADIANT then
        return TEAM_DIRE
    else
        return TEAM_RADIANT
    end
end

----------------------------------------------------------------------------------------------------

function utilsModule.GetLane( vLoc )
    --local team = GetTeam()
    local sideOfMap = 0

    if vLoc.x + vLoc.y > 0 then --mostly true
        sideOfMap = TEAM_DIRE
    else
        sideOfMap = TEAM_RADIANT
    end
    --print(sideOfMap)
    local angleToMid = 0
    if sideOfMap == TEAM_RADIANT then
        vToLoc = vLoc - LANE_HEAD_RAD
        angleToMid = vToLoc:Dot(LANE_MID_RAD) / (#vToLoc * #LANE_MID_RAD)
    else
        vToLoc = vLoc - LANE_HEAD_DIRE
        --print(tostring(vToLoc))
        --print(tostring(#vToLoc) .. ":".. #LANE_MID_DIRE)
        angleToMid = vToLoc:Dot(LANE_MID_DIRE) / (#vToLoc * #LANE_MID_DIRE)
    end
    if angleToMid > 90 then angleToMid = angleToMid - 180 end
    angleToMid = math.acos(math.abs(angleToMid)) * 180 / math.pi
    --print(sideOfMap .. ":" .. angleToMid)
    if angleToMid < 7.5 then return LANE_MID end
    if angleToMid < 38 then return LANE_NONE end

    if vLoc.x - vLoc.y < 0 then 
        return LANE_TOP
    else 
        return LANE_BOT 
    end

end
----------------------------------------------------------------------------------------------------
-- attempt to assess a locations current danger
function utilsModule.GetLocationDanger( vLoc )
    local npcBot = GetBot()
    --local team = GetTeam()
    local danger = 0
    lane = utilsModule.GetLane( vLoc )
    
    --range is 0 - 1
    local toRosh = vLoc - ROSHAN
    if #toRosh < 500 then
        danger = danger + 1
    end

    --range is 0 - 1 out of lane or 2 if you are base seiged
    --range in lane is 0 - ~3
    if lane == LANE_NONE then
        local lanes = (GetLaneFrontAmount( GetTeam(), LANE_TOP, true ) +
                        GetLaneFrontAmount( GetTeam(), LANE_MID, true ) +
                        GetLaneFrontAmount( GetTeam(), LANE_BOT, true ))
        if lanes == 0 then danger = danger + 2 end
        danger = danger + (1 - (lanes / 3))
    else

        local laneFront = 0
        if lane == LANE_BOT then
            laneFront = GetLocationAlongLane( LANE_BOT, GetLaneFrontAmount( GetTeam(), LANE_BOT, true ) )
        elseif lane == LANE_TOP then
            laneFront = GetLocationAlongLane( LANE_TOP, GetLaneFrontAmount( GetTeam(), LANE_TOP, true ) )
        else
            laneFront = GetLocationAlongLane( LANE_MID, GetLaneFrontAmount( GetTeam(), LANE_MID, true ) )
        end
        --DebugDrawCircle(Vector(laneFront.x, laneFront.y, 300), 25,  0, 255, 0)
        --print(tostring(laneFront))
        local laneDistance = laneFront - GetAncient(GetTeam()):GetLocation()
        local locDistance = vLoc - GetAncient(GetTeam()):GetLocation()
        danger = danger + (math.max((#locDistance - #laneDistance) / 3500, 0))
    end    

    for i=0,10 do
        local tower = GetTower(GetTeam(), i)
        --print("team " ..GetTeam().."  tower " .. i)
        if tower and #(npcBot:GetLocation() - tower:GetLocation()) < 1000 then
            danger = danger - 3
        end

        if GetTeam() - 2 then -- get enemy team (dire - radiant = true)
            tower = GetTower(TEAM_RADIANT, i)
        else
            tower = GetTower(TEAM_DIRE, i)
        end
        if tower and #(npcBot:GetLocation() - tower:GetLocation()) < 1000 then
            danger = danger * 3
        end
    end

    return danger
end
----------------------------------------------------------------------------------------------------

return utilsModule