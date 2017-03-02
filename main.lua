module("main", package.seeall)
require "game"
require "menu"
require "sound"
require "store"
require "upgrades"

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
  
  --global value
   _G.completedStory = false
end

function love.draw()
  love.graphics.scale(scalex, scaley)
  
  if gamestate == "menu" then
    menu.draw()
  end
  
  if gamestate == "story" then
    menu.drawStory()
  end
  
  if gamestate == "endless" then
    game.drawEndless()
  end
  
  if gamestate == "store" then
    store.drawDuckSelect()
  end
  
  if gamestate == "gameover" then
    game.drawGameOver()
  end  
end

function love.update()
  love.graphics.scale(scalex, scaley)
  
  if gamestate == "story" then
    menu.updateStory()
  end
  
  if gamestate == "endless" then
    game.updateEndless()
  end
end

function love.mousepressed(x,y,button,istouch)
  if (gamestate == "menu") then
    --menu.mousepressed(x,y,button,istouch)
  end
  
  if (gamestate == "endless") then
    --game.mousepressed(x,y,button,istouch)
  end
end

function love.touchpressed(id,x,y,sw,sh,pressure)
  x = x * screenWidth
  y = y * screenHeight
  
  if (gamestate == "endless") then
    game.touchpressed(id,x,y,sw,sh,pressure)
  end
  
  if (gamestate == "menu") then
    menu.touchpressed(id,x,y,sw,sh,pressure)
  end
end
