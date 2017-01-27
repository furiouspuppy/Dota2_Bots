local build ="NOT IMPLEMENTED"
if string.match(GetBot():GetUnitName(), "hero") then
    build = require(GetScriptDirectory() .. "/builds/item_build_" .. string.gsub(GetBot():GetUnitName(), "npc_dota_hero_", ""))
end
if build == "NOT IMPLEMENTED" then return end
----------------------------------------------------------------------------------------------------

function GetDesire()
  local npcBot = GetBot();
  local desire = 0.0;
  if ( npcBot.secretShopMode == true ) then
    desire = 0.8
  end
  --print("secret desire:"..desire .. " secretdistance:".. npcBot:DistanceFromSecretShop())
  return Clamp( desire, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_ABSOLUTE );
end