local utils = require(GetScriptDirectory() .. "/util")
local items = require(GetScriptDirectory() .. "/ItemData" )
local build ="NOT IMPLEMENTED"
if string.match(GetBot():GetUnitName(), "hero") then
    build = require(GetScriptDirectory() .. "/builds/item_build_" .. string.gsub(GetBot():GetUnitName(), "npc_dota_hero_", ""))
end
if build == "NOT IMPLEMENTED" then return end
----------------------------------------------------------------------------------------------------


--[[ Set up your item build.  Remember to use base items.  
To build an derived item like item_magic_wand you will just 
buy the four base items so take care to get items in your 
inventory in the correct order! ]]

local tableItemsToBuy = {}
local tpTimer = 0
local wardTimer = 0

----------------------------------------------------------------------------------------------------

-- Think function to purchase the items and call the skill point think
function ItemPurchaseThink()
    if GetGameState() ~= GAME_STATE_GAME_IN_PROGRESS and
        GetGameState() ~= GAME_STATE_PRE_GAME
    then 
        return
    end
    local npcBot = GetBot();
    
    -- check if real meepo
    if( GetBot():GetUnitName() == "npc_dota_hero_meepo") then
        if(npcBot:GetLevel() > 1) then
            for i=0, 5 do
                if(npcBot:GetItemInSlot(i) ~= nil ) then
                    if not (npcBot:GetItemInSlot(i):GetName() == "item_boots" or 
                        npcBot:GetItemInSlot(i):GetName() == "item_power_treads" or
                        npcBot:GetItemInSlot(i):GetName() == "item_travel_boots") then
                        break
                    end
                end
                if i == 5 then
                    return
                end
            end
        end
    end

    --print(npcBot:GetUnitName())
	local currentItems = {}
	for i=0, 5 do
		currentItems[i] = npcBot:GetItemInSlot(i)
	end
    local hasTP = false
    for _,v in pairs(currentItems) do
        if v:GetName() == "item_tpscroll" or 
            v:GetName() == "item_recipe_travel_boots" or
            v:GetName() == "item_recipe_travel_boots_2"
        then
            hasTP = true
        end
    end
    if not hasTP and DotaTime() > tpTimer + 5 and 
        (npcBot:DistanceFromFountain() == 0 or
            npcBot:DistanceFromSideShop() == 0) and
            npcBot:GetGold() > 50 
    then
        tpTimer = DotaTime()
        npcBot:Action_PurchaseItem( "item_tpscroll" )
    end
    if DotaTime() < -80 + 10 - utils.Roles[npcBot:GetUnitName()] then
        if GetItemStockCount( "item_courier" ) > 0 then
            npcBot:Action_PurchaseItem( "item_courier" )
        end
    end
    if DotaTime() > 180 + 25 - (5 * utils.Roles[npcBot:GetUnitName()]) and DotaTime() < 360 then
        if GetItemStockCount( "item_flying_courier" ) > 0 then
            npcBot:Action_PurchaseItem( "item_flying_courier" )
        end
    end

    if utils.Roles[npcBot:GetUnitName()] > 2 then
        if GetItemStockCount( "item_ward_observer" ) > 0 and wardTimer == 0 then
            wardTimer = DotaTime() + 25 - (5 * utils.Roles[npcBot:GetUnitName()])
            --print(npcBot:GetUnitName() .. wardTimer)
        end
        if wardTimer ~= 0 and wardTimer < DotaTime() then
            --print(npcBot:GetUnitName())
            if GetItemStockCount( "item_ward_observer" ) > 0 then
                npcBot:Action_PurchaseItem( "item_ward_observer" )
            end
            wardTimer = 0
        end
    end


	if ( #tableItemsToBuy == 0 )
	then
		npcBot:SetNextItemPurchaseValue( 0 );
		return;
	end

	local sNextItem = tableItemsToBuy[1];

	npcBot:SetNextItemPurchaseValue( GetItemCost( sNextItem ) );


	if ( npcBot:GetGold() >= GetItemCost( sNextItem ) )
	then
        if ( not npcBot.secretShopMode and IsItemPurchasedFromSecretShop( sNextItem ) and npcBot:DistanceFromSecretShop() >= 0 ) then
            -- this item is from secret shop
            npcBot.secretShopMode = true;
            --print("secretshopmode:"..tostring(npcBot.secretShopMode))
        end
        if npcBot.secretShopMode and  npcBot:DistanceFromSecretShop() > 00  then
            return
        end
		if npcBot:Action_PurchaseItem( sNextItem ) == PURCHASE_ITEM_SUCCESS then
            npcBot.secretShopMode = false;
    		--if(IsCourierAvailable()) then
    		--	--print("useCourier" .. tableItemsToBuy[1])
    		--	npcBot:Action_CourierDeliver( )
    		--end
    		table.remove( tableItemsToBuy, 1 );
        end
	end
end

----------------------------------------------------------------------------------------------------

local function GetBasicItems( ... )
    local basicItemTable = {}
    for i,v in pairs(...) do
        if items[v] ~= nil then
            for _,w in pairs(GetBasicItems(items[v])) do
                table.insert(basicItemTable, w)
            end
        else
            table.insert(basicItemTable, v)
        end
    end
    return basicItemTable
end
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------


--[[this chunk prevents dota_bot_reload_scripts from breaking your 
    item/skill builds.  Note the script doesn't account for 
    consumables. ]]

local npcBot = GetBot();
tableItemsToBuy = GetBasicItems(build["items"])


-- check item build vs current items
local currentItems = {}
for i=0, 15 do
    if(npcBot:GetItemInSlot(i) ~= nil) then
        local _item = npcBot:GetItemInSlot(i):GetName()
        if items[_item] == nil then
            table.insert(currentItems, _item)
        else
            for _,v in pairs(GetBasicItems(items[_item])) do
                table.insert(currentItems, v)
            end
        end
    end
end

--utils.print_r(currentItems)
for i = 0, #currentItems do
    if(currentItems[i] ~= nil) then
        for j = 0, #tableItemsToBuy do
            if tableItemsToBuy[j] == currentItems[i] then
                --print("Removing Item " .. currentItems[i] .. " index " .. j)
                table.remove(tableItemsToBuy, j)
                break
            end
        end
    end
end
--utils.print_r(tableItemsToBuy)