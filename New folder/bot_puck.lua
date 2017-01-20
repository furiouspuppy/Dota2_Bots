--[[local utils = require(GetScriptDirectory() .. "/util")
local inspect = require(GetScriptDirectory() .. "/inspect")

function Think()
      --utils.GetLane( Vector(2303,543,300))
      DebugDrawLine( Vector(-6555,-5617,300),Vector(6440,5669,300), 255, 0, 0 ) --y = 0.8684878799538284x + 75.93805309734489
      DebugDrawLine( Vector(2303,543,300),Vector(4300,3700,300), 255, 0, 0 )
       DebugDrawLine( Vector(-6000,6000,300),Vector(6000,-6000,300), 0, 0, 255 ) --y = 0.8684878799538284x + 75.93805309734489
 
      --[[local units = GetUnitList(UNIT_LIST_ALL)
      local wards = {}
      for i,v in pairs(units) do
          if v:GetUnitName() == "npc_dota_observer_wards" then
            table.insert(wards, v)
          end
      end
      for i,v in pairs(wards) do
            print(v:GetLocation())
      end
	--local v = utils.tableNeutralCamps[2][1]
	--print(tostring(v[VECTOR]))
	GetBot():Action_AttackMove( Vector(-2809.5, 769.5, 512.0))
	--local test = GetShrine(2,SHRINE_JUNGLE_2)
	--print(assert(inspect.inspect(test)))
	--GetBot():Action_MoveToUnit(test)
	--print(tostring("attempted"))]]
--end


 --[[ Action_AttackMove = <function 1>,
      Action_AttackUnit = <function 2>,
      Action_Buyback = <function 3>,
      Action_Chat = <function 4>,
      Action_ClearActions = <function 5>,
      Action_CourierDeliver = <function 6>,
      Action_DropItem = <function 7>,
      Action_LevelAbility = <function 8>,
      Action_MoveToLocation = <function 9>,
      Action_MoveToUnit = <function 10>,
      Action_PickUpItem = <function 11>,
      Action_PickUpRune = <function 12>,
      Action_PurchaseItem = <function 13>,
      Action_SellItem = <function 14>,
      Action_SwapItems = <function 15>,
      Action_UseAbility = <function 16>,
      Action_UseAbilityOnEntity = <function 17>,
      Action_UseAbilityOnLocation = <function 18>,
      Action_UseAbilityOnTree = <function 19>,
      CanBeSeen = <function 20>,
      CanHelp = true,
      DistanceFromFountain = <function 21>,
      DistanceFromSecretShop = <function 22>,
      DistanceFromSideShop = <function 23>,
      FindAoELocation = <function 24>,
      FindItemSlot = <function 25>,
      GetAbilityByName = <function 26>,
      GetAbilityPoints = <function 27>,
      GetActiveMode = <function 28>,
      GetActiveModeDesire = <function 29>,
      GetActualDamage = <function 30>,
      GetArmor = <function 31>,
      GetAssignedLane = <function 32>,
      GetAttackDamage = <function 33>,
      GetAttackPoint = <function 34>,
      GetAttackRange = <function 35>,
      GetAttackSpeed = <function 36>,
      GetAttackTarget = <function 37>,
      GetAttributeValue = <function 38>,
      GetBaseDamage = <function 39>,
      GetBaseDamageVariance = <function 40>,
      GetBaseMovementSpeed = <function 41>,
      GetBoundingRadius = <function 42>,
      GetCourierValue = <function 43>,
      GetCurrentActionType = <function 44>,
      GetCurrentMovementSpeed = <function 45>,
      GetDifficulty = <function 46>,
      GetEstimatedDamageToTarget = <function 47>,
      GetEvasion = <function 48>,
]]