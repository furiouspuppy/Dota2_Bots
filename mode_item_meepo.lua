    -- check if real meepo
    if( GetBot():GetUnitName() == "npc_dota_hero_meepo") then
        if(GetBot():GetLevel() > 1) then
            for i=0, 5 do
                if(GetBot():GetItemInSlot(i) ~= nil ) then
                    if (GetBot():GetItemInSlot(i):GetName() ~= "item_boots" and 
                        GetBot():GetItemInSlot(i):GetName() ~= "item_power_treads" and 
                        GetBot():GetItemInSlot(i):GetName() ~= "item_travel_boots") then
                        return
                    end
                end
            end
        end
    end

    -- if not no item mode
    function GetDesire()
        return 0.0
    end