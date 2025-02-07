-----------------------------------
-- ID: 5327
-- Item: Potion Drop
-- Item Effect: Restores 60 HP
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    if (target:hasStatusEffect(xi.effect.MEDICINE)) then
        return xi.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

item_object.onItemUse = function(target)
    target:addHP(60*ITEM_POWER)
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 300)
end

return item_object
