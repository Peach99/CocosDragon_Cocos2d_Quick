--
-- Author: Your Name
-- Date: 2015-07-24 11:18:46
--
UIMainMenuScene = UIMainMenuScene or {}
ccb["MainMenuScene"] = UIMainMenuScene

local MainMenuScene = class("MainMenuScene", function()
	return display.newScene("MainMenuScene")
end)

UIMainMenuScene.pressedPlay = function (sender)
	print("MainMenuScene")
end




function MainMenuScene:ctor()
	local proxy = cc.CCBProxy:create()
    local Menu = CCBReaderLoad("MainMenuScene", proxy, UIMainMenuScene)
	self:addChild(Menu)
end






return MainMenuScene