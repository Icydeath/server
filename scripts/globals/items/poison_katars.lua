-----------------------------------
-- ID: 16403
-- Item: Poison Katars
-- Additional Effect: Poison
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onAdditionalEffect = function(player, target, damage)
    local chance = 10

    if (math.random(0, 99) >= chance or applyResistanceAddEffect(player, target, xi.magic.ele.WATER, 0) <= 0.5) then
        return 0, 0, 0
    else
        if (not target:hasStatusEffect(xi.effect.POISON)) then
            target:addStatusEffect(xi.effect.POISON, 4, 3, 30)
        end
        return xi.subEffect.POISON, xi.msg.basic.ADD_EFFECT_STATUS, xi.effect.POISON
    end
end

return item_object
