module("main", package.seeall)
require "Game"
require "Menu"
require "Sound"
require "Store"
require "Upgrades"
require "Pause"

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
  Pause.load()
  
  --global value
   _G.completedStory = false
   _G.paused = false
end

function love.draw()
  love.graphics.scale(scalex, scaley)
  
  if gamestate == "menu" then
    if _G.paused then
      love.graphics.setColor(113,113,113)
    end
    Menu.draw()
    if _G.paused then
      love.graphics.setColor(255,255,255)
    end
  end
  
  if gamestate == "story" then
    if _G.paused then
      love.graphics.setColor(113,113,113)
    end
    Menu.drawStory()
    if _G.paused then
      love.graphics.setColor(255,255,255)
    end
  end
  
  if gamestate == "endless" then
    if _G.paused then
      love.graphics.setColor(113,113,113)
    end
    Game.drawEndless()
    if _G.paused then
      love.graphics.setColor(255,255,255)
    end
  end
  
  if gamestate == "store" then
    Store.drawStoreHub()
  end
  
  if _G.paused then
    Pause.draw()
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
  
  if gamestate == "store" then
    Store.updateStore()
  end
end

function love.mousepressed(x,y,button,istouch)
  
  if (gamestate == "menu") then
    Menu.mousepressed(x,y,button,istouch)
  end
  
  if (gamestate == "endless" and not _G.paused) then
    Game.mousepressed(x,y,button,istouch)
  end
  
  if (gamestate == "Store") then
    Store.clickStoreHub(x,y,button,istouch)
  end
  
  if (_G.paused) then
    Pause.mousepressed(x,y,button,istouch)
  end
end

function love.keypressed(key)
  if (gamestate == "endless") then
    Game.keypressed(key)
  end
end

function love.touchpressed(id,x,y,sw,sh,pressure)
  x = x * screenWidth
  y = y * screenHeight
  
  if (gamestate == "endless" and not _G.Paused) then
    Game.touchpressed(id,x,y,sw,sh,pressure)
  end
  
  if (gamestate == "menu") then
    Menu.touchpressed(id,x,y,sw,sh,pressure)
  end
  
  if (gamestate == "store") then
    Store.pressStoreHub(id,x,y,sw,sh,pressure)
  end
   if (_G.paused) then
    Pause.touchpressed(x,y,button,istouch)
  end
end
