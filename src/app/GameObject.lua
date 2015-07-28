--
-- Author: Your Name
-- Date: 2015-07-27 11:57:18
--

local GameObject = class("GameObject", function(node)
	return {}
end)

function GameObject:ctor(node)
	self.node = node
	print("coin created")
end

function GameObject:update()
	-- print("GameObject:update() " .. self.node.config_key)
end


return GameObject