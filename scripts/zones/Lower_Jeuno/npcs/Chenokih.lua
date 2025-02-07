-----------------------------------
-- Area: Lower Jeuno
--  NPC: Chenokih
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        12850, 24500,    -- Hose
        12866, 22632,    -- Linen Slacks
        12851, 57600,    -- Wool Hose
        12858, 14756,    -- Wool Slops
        12865,  6348,    -- Black Slacks
        12978, 16000,    -- Socks
        12994, 14352,    -- Shoes
        12979, 35200,    -- Wool Socks
        12986,  9180,    -- Chestnut Sabots
        12993,  4128,    -- Sandals
        13577, 11088,    -- Black Cape
        13568,  1250,    -- Scarlet Ribbon
    }

    player:showText(npc, ID.text.CHENOKIH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
