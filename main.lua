-- -----------------------------------------------------------------------------------------
--                   Copyright 2020 © John Melody Me
--       Licensed under the Apache License, Version 2.0 (the "License");
--       you may not use this file except in compliance with the License.
--       You may obtain a copy of the License at
--                   http://www.apache.org/licenses/LICENSE-2.0
--       Unless required by applicable law or agreed to in writing, software
--       distributed under the License is distributed on an "AS IS" BASIS,
--       WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--       See the License for the specific language governing permissions and
--       limitations under the License.
--       @Author : John Melody Me
--       @Copyright: John Melody Me & Tan Sin Dee © Copyright 2020
--       @INPIREDBYGF: Cindy Tan Sin Dee <3
-- keytool -genkey -v -keystore mykeystore.keystore -alias aliasname -keyalg RSA -validity 999999
-- -----------------------------------------------------------------------------------------

local tapCount = 0
local background = display.newImageRect("background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY
local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tapText:setFillColor( 1, 1, 1 )

local platform = display.newImageRect("platform.png", 300, 50)
platform.x = display.contentCenterX
platform.y = display.contentHeight - 25

local balloon = display.newImageRect("balloon.png", 112, 112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

local physics = require("physics")
physics.start()

physics.addBody(platform, "static")
physics.addBody(balloon, "dynamic", {radius = 50, bounce = 0.3})

local function pushBalloon()
    balloon:applyLinearImpulse(0, -0.75, balloon.x, balloon.y)
    tapCount = tapCount + 1
    tapText.text = tapCount
end

balloon:addEventListener("tap", pushBalloon)
