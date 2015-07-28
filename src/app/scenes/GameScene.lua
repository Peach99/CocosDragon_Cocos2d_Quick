--
-- Author: Your Name
-- Date: 2015-07-24 16:20:19
--
local Coin = import("app.Coin")
local Bomb = import("app.Bomb")
local EndCoin = import("app.EndCoin")
local Dragon = import("app.Dragon")


local GameScene = class("GameScene", function()
	return display.newScene("GameScene")
end)

ccb["Level"] = GameScene
ccb["Dragon"] = {}
ccb["Coin"] = {}
ccb["EndCoin"] = {}
ccb["Bomb"] = {}

function GameScene:onEnter()
	-- print("onEnter()")
end

function GameScene:ctor()
	local proxy = cc.CCBProxy:create()

	self.GameScene = CCBReaderLoad("GameScene", proxy, GameScene)
	self:addChild(self.GameScene, 0, "GameScene")

	self.Level = CCBReaderLoad("Level", proxy, GameScene)
	self:addChild(self.Level, 1, "sky")

	self:LoadGameObjects()

	self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT,function(dt) 
        self:update(dt)
    end)
	self:scheduleUpdate()
end

function GameScene:LoadGameObjects()
	self.GameObjects = {}
	local children = self:getChildByName("sky"):getChildren()
	for _, node in ipairs(children) do
		-- print(node.config_key)
		if node.config_key == "Coin" then
			table.insert(self.GameObjects, Coin.new(node))
		elseif node.config_key == "Bomb" then
			table.insert(self.GameObjects, Bomb.new(node))
		elseif node.config_key == "Dragon" then
			table.insert(self.GameObjects, Dragon.new(node))
		elseif node.config_key == "EndCoin" then
			table.insert(self.GameObjects, EndCoin.new(node))
		end
	end
end

function GameScene:update(dt)
	local y = self.Level:getPositionY()
	self.Level:setPositionY(y - 1)

	for _, node in ipairs(self.GameObjects) do
		-- print(node.node.config_key)
		node:update()
	end
end

function GameScene:onDidLoadFromCCB(sender)
	-- print("GameScene:onDidLoadFromCCB(sender)")
	-- dump(ccb)
end

return GameScene
