module("main", package.seeall)
require "game"
require "menu"
require "sound"
require "store"
require "pause"
require "DuckDataBase"
require "settingspage"
require "storyMenu"
require "RotatePhone"
require "VsEndScreen"
require "cutscene"
require "credits"

function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end

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
  background = love.graphics.newImage("assets/Placeholder_Background.png")
  backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
  
  gamestate = "menu"
  DuckDataBase.load()
  menu.load()
  sound.load()
  store.load()
  sound.play()
  pause.load()
  settingspage.load()
  storyMenu.load()
  RotatePhone.load()
  VsEndScreen.load()
  upgrades.load()
  cutscene.load()
  credits.load()
 
  
  --global value
   _G.completedStory = true
   _G.paused = false
   _G.settings = false
   _G.musicVolume = 1.0
   _G.effectVolume = 1.0
   _G.DuckBills = 5000
   _G.storyLevel = 1
   _G.holdStoryLevel =0
   _G.creditsLoad = false
end

function love.draw()
  love.graphics.scale(scalex, scaley)
  
  if gamestate == "menu" then
    sound.play()
    if _G.settings or _G.creditsLoad then
      love.graphics.setColor(113,113,113)
    end
    menu.draw()
    if _G.settings or _G.creditsLoad then
      love.graphics.setColor(255,255,255)
    end
  end
  
  if gamestate == "story" then
    sound.play()
    if _G.paused then
      love.graphics.setColor(113,113,113)
    end
    game.drawStory()
    if _G.paused then
      love.graphics.setColor(255,255,255)
    end
  end
  
  if gamestate == "endless" then
    sound.play()
    if _G.paused then
      love.graphics.setColor(113,113,113)
    end
    game.drawEndless()
    if _G.paused then
      love.graphics.setColor(255,255,255)
    end
  end

  if gamestate == "local" then
    sound.play()
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
  
   if gamestate == "storySelect" then
    storyMenu.draw()
  end
  
  if gamestate == "gameover" then
    sound.play()
    game.drawGameOver()
  end  
  
  if gamestate == "localSwitch" then
    RotatePhone.draw()
  end
  
  if gamestate == "coopend" then
    VsEndScreen.draw()
  end
  
  if gamestate == "cutscene" then
    cutscene.draw()
  end
  
  if _G.paused then
    if not _G.settings then
      pause.draw()
    else
      settingspage.draw()
    end
  end 
  
  if _G.settings then
    settingspage.draw()   
  end 
  
  if gamestate == "finishStoryLevel" then
    game.finishStoryLevel()
  end
  
  if _G.creditsLoad then
    credits.draw()
  end
end

function love.update()
  love.graphics.scale(scalex, scaley)
  
  if gamestate == "story" then
    game.updateStory()
  elseif gamestate == "endless" then
    game.updateEndless()
  elseif gamestate == "local" then
    game.updateLocal()
  elseif gamestate == "store" then
    store.updateStore()
  elseif gamestate == "localSwitch" then
    RotatePhone.update()
  elseif _G.creditsLoad then
    credits.update()
  end
end

if love.system.getOS() == "Android" then
function love.touchpressed(id,x,y,sw,sh,pressure)
  x = x * screenWidth
  y = y * screenHeight
  
  if ((not _G.paused) and (gamestate == "endless" or  gamestate == "story" or gamestate == "local" or gamestate == "finishStoryLevel")) then
    game.touchpressed(id,x,y,sw,sh,pressure)
  
  elseif (gamestate == "gameover") then
    game.touchpressed(id,x,y,sw,sh,pressure)

  elseif (gamestate == "storySelect") then
    storyMenu.touchpressed(id,x,y,sw,sh,pressure)
  
  elseif (gamestate == "localSwitch") then
    RotatePhone.touchpressed(id,x,y,sw,sh,pressure)
      
  elseif (gamestate == "coopend") then
    VsEndScreen.touchpressed(id,x,y,sw,sh,pressure)
  
  elseif (gamestate == "store") then
    store.clickStoreHub(x,y)
  
  elseif (_G.paused and not _G.settings) then
    pause.touchpressed(id,x,y,sw,sh,pressure)
  
  elseif (_G.settings) then
    settingspage.touchpressed(id,x,y,sw,sh,pressure)
  
  elseif (gamestate == "menu" and not _G.settings and not _G.creditsLoad) then
    menu.touchpressed(id,x,y,sw,sh,pressure)
  
  elseif (gamestate == "cutscene") then
    cutscene.touchpressed(id,x,y,sw,sh,pressure)
  elseif (_G.creditsLoad) then
    credits.touchpressed(id,x,y,sw,sh,pressure)
  end
end

function love.touchreleased(id,x,y,dx,dy,pressure)
  x = x * screenWidth
  y = y * screenHeight
  
  if ((not _G.paused) and (gamestate == "endless" or  gamestate == "story" or gamestate == "local" or gamestate == "finishStoryLevel")) then
    game.touchreleased(id,x,y,sw,sh,pressure)
  elseif (_G.settings) then
    settingspage.touchreleased(id,x,y,sw,sh,pressure)
  end
end

else --If Android else
  
function love.mousepressed(x,y,button,istouch) 
  if ((not _G.paused) and (gamestate == "endless" or  gamestate == "story" or gamestate == "local" or gamestate == "finishStoryLevel")) then
    game.mousepressed(x,y,button,istouch) 
    
  elseif (gamestate == "gameover") then
    game.mousepressed(x,y,button,istouch) 

  elseif (gamestate == "storySelect") then
    storyMenu.mousepressed(x,y,button,istouch)
    
  elseif (gamestate == "localSwitch") then
    RotatePhone.mousepressed(x,y,button,istouch)
      
  elseif (gamestate == "coopend") then
    VsEndScreen.mousepressed(x,y,button,istouch)
  
  elseif (gamestate == "store") then
    store.clickStoreHub(x,y)
    
  elseif (_G.paused and not _G.settings) then
    pause.mousepressed(x,y,button,istouch)
  
  elseif (_G.settings) then
    settingspage.mousepressed(x,y,button,istouch)
  
  elseif (gamestate == "menu" and not _G.settings and not _G.creditsLoad) then
    menu.mousepressed(x,y,button,istouch)
  
  elseif (gamestate == "cutscene") then
    cutscene.mousepressed(x,y,button,istouch)
  elseif (_G.creditsLoad) then
    credits.mousepressed(x,y,button,istouch)
  end
end

function love.mousereleased(x,y,button,istouch)
  if ((not _G.paused) and (gamestate == "endless" or  gamestate == "story" or gamestate == "local")) then
    game.mousereleased(x,y,button,istouch) 
  elseif (_G.settings) then
    settingspage.mousereleased(x,y,button,istouch)
  end
end
end --If Android End