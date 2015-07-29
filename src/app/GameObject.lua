--
-- Author: Your Name
-- Date: 2015-07-27 11:57:18
--

local GameObject = class("GameObject", function(node)
	return {}
end)

function GameObject:ctor(node)
	self.node = node
	self:setName(node.config_key)
	print("coin created")
end

function GameObject:update()
	-- print("GameObject:update() " .. self.node.config_key)
end

function GameObject:handleCollisionWith(name)
	-- print(name)
end

function GameObject:remove()
	self.node:removeSelf()
	print("GameObject:remove()")
end

function GameObject:setName(name)
	self.name = name
end

function GameObject:getName()
	return self.name
end

function GameObject:setPosition(x, y)
	self.node:setPosition(x, y)
end

function GameObject:getPosition()
	local x, y = self.node:getPosition()
	return {x = x, y = y}
end

return GameObject