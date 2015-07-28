--
-- Author: Your Name
-- Date: 2015-07-24 16:20:19
--
local Coin = import("app.Coin")
local Bomb = import("app.Bomb")
local EndCoin = import("app.EndCoin")
local Dragon = import("app.Dragon")

ccb["Level"] = GameScene
ccb["Dragon"] = {}
ccb["Coin"] = {}
ccb["EndCoin"] = {}
ccb["Bomb"] = {}

local GameScene = class("GameScene", function()
	return display.newScene("GameScene")
end)

function GameScene:onEnter()
	-- print("onEnter()")
end

function GameScene:ctor()
	local proxy = cc.CCBProxy:create()

	self.GameScene = CCBReaderLoad("GameScene", proxy, GameScene)
	self:addChild(self.GameScene, 0, "GameScene")

	self.Level = CCBReaderLoad("Level", proxy, GameScene)
	self:addChild(self.Level, 1, "Level")

	self:LoadGameObjects()

	self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT,function(dt) 
        self:update(dt)
    end)
	self:scheduleUpdate()

	self:setTouchEnabled(true)
	self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        return self:onTouch(event)
    end)
end

function GameScene:LoadGameObjects()
	self.GameObjects = {}
	local children = self.Level:getChildren()
	for _, node in ipairs(children) do
		-- print(node.config_key)
		if node.config_key == "Coin" then
			table.insert(self.GameObjects, Coin.new(node))
		elseif node.config_key == "Bomb" then
			table.insert(self.GameObjects, Bomb.new(node))
		elseif node.config_key == "Dragon" then
			self.dragon = Dragon.new(node)
			table.insert(self.GameObjects, self.dragon)
		elseif node.config_key == "EndCoin" then
			table.insert(self.GameObjects, EndCoin.new(node))
		end
	end
end

function GameScene:update(dt)
	local y = self.Level:getPositionY()
	self.Level:setPositionY(y - 1)

	for _, node in ipairs(self.GameObjects) do
		node:update()
	end
end

function GameScene:onTouch(event)
	self.touchEvent = event
	if event.name == "began" then
		self:addNodeEventListener(cc.NODE_TOUCH_TARGETING_PHASE, function(dt)
			self:update(dt)
			self:holdTouch(dt, self.touchEvent)
		end)
	elseif event.name == "moved" then
		--todo
	elseif event.name == "ended" then
		self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT,function(dt) 
        	self:update(dt)
   		end)
	end
	return true
end

function GameScene:holdTouch(dt, event)
	local dragonPosX, dragonPosY = self.dragon:getPosition()
	if math.abs(dragonPosX - event.x) <= 1 then
		self.dragon:setPosition(event.x, dragonPosY)
	elseif dragonPosX > event.x then
		self.dragon:setPosition(dragonPosX-1, dragonPosY)
	else
		self.dragon:setPosition(dragonPosX+1, dragonPosY)
	end
end

function GameScene:onDidLoadFromCCB(sender)

end

return GameScene
