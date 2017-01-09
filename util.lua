local utilsModule = {}

local vec = require(GetScriptDirectory() .."/Vectors")
utilsModule.tableNeutralCamps = vec["tableNeutralCamps"]  -- constant - shouldn't be modified runtime use X.jungle instead
utilsModule.tableRuneSpawns = vec["tableRuneSpawns"]


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

--function to get current hero level
function CDOTA_Bot_Script:GetHeroLevel()
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

function CDOTA_Bot_Script:GetLane()
    local lane = LANE_MID
    return lane
end

----------------------------------------------------------------------------------------------------

-- util function for printing a table
function utilsModule.print_r ( t )  
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

return utilsModule