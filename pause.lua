module("pause", package.seeall)
require "main"
require "game"

function load()
  resumeImg = love.graphics.newImage("assets/Resume_Button.png")
  retryImg = love.graphics.newImage("assets/RetryButton.png")
  settingsImg = love.graphics.newImage("assets/Settings_Button.png")
  mainImg = love.graphics.newImage("assets/MainMenuButton.png")
  
  buttonQuad = love.graphics.newQuad(1,1,500/2,500/2,500/2,500/2)
end

function draw()
  x = love.mouse.getX()
  love.graphics.print(x, 10 , 10)
  love.graphics.print(love.mouse.getY(), 50 , 10)
  
  love.graphics.draw(resumeImg, buttonQuad, 125/2 ,0)
  if not(main.gamestate == "local") then
    love.graphics.draw(retryImg, buttonQuad, 125/2 ,250/2)
    love.graphics.draw(settingsImg, buttonQuad, 125/2 ,500/2)
  elseif (main.gamestate == "local") then
    love.graphics.draw(settingsImg, buttonQuad, (125/2),(500/2)-63)
  end
  love.graphics.draw(mainImg, buttonQuad, 125/2 ,750/2)
  
end

function mousepressed(x,y,button, istouch)

  if x > 85 and x < 288 then
  
    if y > 70 and y < 176 then
      -- resume
      sound.playSqueak()
      _G.paused = false
    end
  
    if y > 196 and y < 302 and not (main.gamestate == "local") then
      -- retry
      sound.playSqueak()
      game.load()
      _G.paused = false 
    end
  
    if y > 320 and y < 426 and not (main.gamestate == "local")then
      -- settings
      sound.playSqueak()
      _G.settings = true
    end
    
    if y > 257 and y < 363 and main.gamestate == "local" then
      -- settings
      sound.playSqueak()
      _G.settings = true
    end
  
    if y > 446 and y < 552 then
      -- menu
      sound.playSqueak()
      _G.paused = false
      main.gamestate = "menu"
    end
  
  end
end

function touchpressed(id,x,y,sw,sh,pressure)

  if x > 85 and x < 288 then
  
    if y > 70 and y < 176 then
      -- resume
      sound.playSqueak()
      _G.paused = false
    end
  
    if y > 196 and y < 302 and not main.gamestate == "local" then
      -- retry
      sound.playSqueak()
      game.load()
      _G.paused = false 
    end
  
    if y > 320 and y < 426 and not main.gamestate == "local"then
      -- settings
      sound.playSqueak()
      _G.settings = true
    end
    
    if y > 257 and y < 363 and main.gamestate == "local" then
      -- settings
      sound.playSqueak()
      _G.settings = true
    end
  
    if y > 446 and y < 552 then
      -- menu
      sound.playSqueak()
      _G.paused = false
      main.gamestate = "menu"
    end
  
  end
end