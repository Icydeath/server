-----------------------------------
-- Area: Altar Room
--  NPC: Magicite
-- Involved in Mission: Magicite
-- !pos -344 25 43 152
-----------------------------------
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Altar_Room/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(player:getNation()) == xi.mission.id.nation.MAGICITE and
        not player:hasKeyItem(xi.ki.MAGICITE_ORASTONE) then
        if player:getCharVar("Magicite") == 2 then
            player:startEvent(44, 152, 3, 1743, 3) -- play Lion part of the CS (this is last magicite)
        else
            player:startEvent(44) -- don't play Lion part of the CS
        end
    else
        player:messageSpecial(ID.text.THE_MAGICITE_GLOWS_OMINOUSLY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 44 then
        if player:getCharVar("Magicite") == 2 then
            player:setCharVar("Magicite", 0)
        else
            player:setCharVar("Magicite", player:getCharVar("Magicite") + 1)
        end
        player:setMissionStatus(player:getNation(), 4)
        player:addKeyItem(xi.ki.MAGICITE_ORASTONE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.MAGICITE_ORASTONE)
    end
end

return entity
