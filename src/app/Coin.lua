--
-- Author: Your Name
-- Date: 2015-07-28 11:18:49
--
local GameObject = import("app.GameObject")

local Coin = class("Coin", GameObject)

function Coin:handleCollisionWith(name)
	self:remove()
end

return Coin