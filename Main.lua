module("Main", package.seeall)
require "Game"
require "Menu"
require "Sound"
require "Store"
require "Upgrades"

function love.load()
  --if arg[#arg] == "-debug" then require("mobdebug").start() end

  screenWidth = 750/2
  screenHeight = 1337/2
  
  if love.system.getOS() == "Android" then
    local x,y = love.graphics.getDimensions()
    scalex = (x/screenWidth)
    scaley = (y/screenHeight)
  else
    scalex = 1
    scaley = 1
  end
  love.window.setMode(screenWidth * scalex, screenHeight * scaley)
  
  gamestate = "menu"
  Game.load()
  Menu.load()
  Sound.load()
  Store.load()
  Sound.play()
  
  --global value
   _G.completedStory = false
end

function love.draw()
  love.graphics.scale(scalex, scaley)
  
  if gamestate == "menu" then
    Menu.draw()
  end
  
  if gamestate == "story" then
    Menu.drawStory()
  end
  
  if gamestate == "endless" then
    Game.drawEndless()
  end
  
  if gamestate == "store" then
    Store.drawDuckSelect()
  end
end

function love.update()
  love.graphics.scale(scalex, scaley)
  
  if gamestate == "story" then
    Menu.updateStory()
  end
  
  if gamestate == "endless" then
    Game.updateEndless()
  end
end

function love.mousepressed(x,y,button,istouch)
  if (gamestate == "menu") then
    Menu.mousepressed(x,y,button,istouch)
  end
  
  if (gamestate == "endless") then
    Game.mousepressed(x,y,button,istouch)
  end
end

function love.keypressed(key)
  if (gamestate == "endless") then
    Game.keypressed(key)
  end
end

function love.touchpressed(id,x,y,sw,sh,pressure)
  x = x * ScreenWidth
  y = y * ScreenHeight
  
  if (gamestate == "endless") then
    Game.touchpressed(id,x,y,sw,sh,pressure)
  end
  
  if (gamestate == "menu") then
    Menu.touchpressed(id,x,y,sw,sh,pressure)
  end
end
