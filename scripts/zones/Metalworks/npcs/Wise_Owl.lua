-----------------------------------
-- Area: Metalworks
--  NPC: Wise Owl
-- Type: Smithing Adv. Image Support
-- !pos -106.336 2.000 26.117 237
-----------------------------------
local ID = require("scripts/zones/Metalworks/IDs")
require("scripts/globals/status")
require("scripts/globals/crafting")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local guildMember = isGuildMember(player, 8)
    local SkillLevel = player:getSkillLevel(xi.skill.SMITHING)
    local Cost = getAdvImageSupportCost(player, xi.skill.SMITHING)

    if guildMember == 1 then
        if player:hasStatusEffect(xi.effect.SMITHING_IMAGERY) == false then
            player:startEvent(103, Cost, SkillLevel, 0, 207, player:getGil(), 0, 4095, 0)
        else
            player:startEvent(103, Cost, SkillLevel, 0, 207, player:getGil(), 28721, 4095, 0)
        end
    else
        player:startEvent(103)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    local Cost = getAdvImageSupportCost(player, xi.skill.SMITHING)

    if csid == 103 and option == 1 then
        if player:getGil() >= Cost then
            player:delGil(Cost)
            player:delStatusEffectsByFlag(xi.effectFlag.SYNTH_SUPPORT, true)
            player:addStatusEffect(xi.effect.SMITHING_IMAGERY, 3, 0, 480)
            player:messageSpecial(ID.text.SMITHING_SUPPORT, 0, 2, 0)
        else
            player:messageSpecial(ID.text.NOT_HAVE_ENOUGH_GIL)
        end
    end
end

return entity
