--
-- Author: Your Name
-- Date: 2015-07-24 16:20:19
--
local GameScene = class("GameScene", function()
	return display.newScene("GameScene")
end)

ccb["Level"] = GameScene
ccb["Dragon"] = {}
ccb["Coin"] = {}
ccb["EndCoin"] = {}
ccb["Bomb"] = {}

function GameScene:ctor()
	local proxy = cc.CCBProxy:create()
	local sky = CCBReaderLoad("Level", proxy, GameScene)
	-- print(sky.config_key)
	self:addChild(sky, 1, "sky")
	self:LoadGameObjects()
end

function GameScene:LoadGameObjects()
	local children = self:getChildByName("sky"):getChildren()
	for _, node in ipairs(children) do
		print(node.config_key)
	end

end

function GameScene:onDidLoadFromCCB(sender)
	print("GameScene:onDidLoadFromCCB(sender)")
	-- dump(ccb)
end

return GameScene
