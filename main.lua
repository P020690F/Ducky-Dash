module("main", package.seeall)
require "game"
require "menu"
require "sound"
require "store"
require "upgrades"
require "pause"

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
  game.load()
  menu.load()
  sound.load()
  store.load()
  sound.play()
  upgrades.load()
  pause.load()
  
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
    menu.draw()
    if _G.paused then
      love.graphics.setColor(255,255,255)
    end
  end
  
  if gamestate == "story" then
    if _G.paused then
      love.graphics.setColor(113,113,113)
    end
    game.drawStory()
    if _G.paused then
      love.graphics.setColor(255,255,255)
    end
  end
  
  if gamestate == "endless" then
    if _G.paused then
      love.graphics.setColor(113,113,113)
    end
    game.drawEndless()
    if _G.paused then
      love.graphics.setColor(255,255,255)
    end
  end
  
  if gamestate == "local" then
    if _G.paused then
      love.graphics.setColor(113,113,113)
    end
    game.drawLocal()
    if _G.paused then
      love.graphics.setColor(255,255,255)
    end
  end
  
  if gamestate == "store" then
    store.drawStoreHub()
  end
  
  if gamestate == "gameover" then
    game.drawGameOver()
  end  
  if _G.paused then
    pause.draw()
  end 
end

function love.update()
  love.graphics.scale(scalex, scaley)
  
  if gamestate == "story" then
    game.updateStory()
  end
  
  if gamestate == "endless" then
    game.updateEndless()
  end
  
    if gamestate == "local" then
    game.updateLocal()
  end
  
  if gamestate == "store" then
    store.updateStore()
  end
end

if love.system.getOS() == "Android" then
  
function love.touchpressed(id,x,y,sw,sh,pressure)
  x = x * screenWidth
  y = y * screenHeight
  
  if (gamestate == "endless" and not _G.Paused) then
    game.touchpressed(id,x,y,sw,sh,pressure)
  end
  
  if (gamestate == "local" and not _G.paused) then
    game.mousepressed(x,y,button,istouch)
  end
  
  if (gamestate == "story" and not _G.Paused) then
    game.touchpressed(id,x,y,sw,sh,pressure)
  end
  
  if (gamestate == "gameover") then
    game.touchpressed(id,x,y,sw,sh,pressure)
  end
  
  if (gamestate == "menu") then
    menu.touchpressed(id,x,y,sw,sh,pressure)
  end
  
  if (gamestate == "store") then
    store.pressStoreHub(id,x,y,sw,sh,pressure)
  end
  
  if (_G.paused) then
    pause.touchpressed(id,x,y,sw,sh,pressure)
  end
end
  
else
  
function love.mousepressed(x,y,button,istouch) 
  if (gamestate == "menu") then
    menu.mousepressed(x,y,button,istouch)
  end
   
  if (gamestate == "local" and not _G.Paused) then
    game.touchpressed(id,x,y,sw,sh,pressure)
  end
  
  if (gamestate == "endless" and not _G.paused) then
    game.mousepressed(x,y,button,istouch)
  end
  
  if (gamestate == "gameover") then
    game.mousepressed(x,y,button,istouch)
  end
  
  if (gamestate == "store") then
    store.clickStoreHub(x,y,button,istouch)
  end
  
  if (gamestate == "story") then
    game.mousepressed(x,y,button,istouch)
  end
  
  if (_G.paused) then
    pause.mousepressed(x,y,button,istouch)
  end
end
end