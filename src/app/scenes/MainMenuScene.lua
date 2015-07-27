--
-- Author: Your Name
-- Date: 2015-07-24 11:18:46
--

local GameScene = import("app.scenes.GameScene")

-- UIMainMenuScene = UIMainMenuScene or {}

local MainMenuScene = class("MainMenuScene", function()
	return display.newScene("MainMenuScene")
end)


ccb["MainMenuScene"] = MainMenuScene
-- UIMainMenuScene.pressedPlay = function (sender)
-- 	print("pressedPlay")
-- end

-- UIMainMenuScene.onDidLoadFromCCB = function (sender)
-- 	print("MainMenuScene")
-- end


function MainMenuScene:ctor()
	local proxy = cc.CCBProxy:create()
    local Menu = CCBReaderLoad("MainMenuScene", proxy, self)
    
	self:addChild(Menu)
end

function MainMenuScene:pressedPlay(sender)
	print("pressedPlay")
	display.replaceScene(GameScene.new())
end

return MainMenuScene