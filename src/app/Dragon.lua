--
-- Author: Your Name
-- Date: 2015-07-28 11:47:01
--

local GameObject = import("app.GameObject")

local Dragon = class("Dragon", GameObject)

speed = 5

function Dragon:ctor(node)
	self.super.ctor(self,node)
end

function Dragon:update()
	self.super.update(self)
	local newY = self.node:getPositionY() + 1
	self.node:setPositionY(newY)
end

function Dragon:goLeft()
	local newX = self.node:getPositionX() - speed
	self.node:setPositionX(newX)
end

function Dragon:goRight()
	local newX = self.node:getPositionX() + speed
	self.node:setPositionX(newX)
end



return Dragon
