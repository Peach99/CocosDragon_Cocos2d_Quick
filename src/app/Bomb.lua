--
-- Author: Your Name
-- Date: 2015-07-28 12:14:30
--

local GameObject = import("app.GameObject")

local Bomb = class("Bomb", GameObject)

function Bomb:handleCollisionWith(name)
	local proxy = cc.CCBProxy:create()
	-- self.GameScene = CCBReaderLoad("GameScene", proxy, GameScene)
	-- self:addChild(self.GameScene, 0, "GameScene")
	-- local explosion = CCBReaderLoad("Explosion", proxy, Bomb)
	-- explosion:setPosition(self.node:getPosition())
	-- self.node:getParent():addChild(explosion)
end

return Bomb