module("menu", package.seeall)
require "main"

function load()
  mainMenuPreStory = love.graphics.newImage("assets/mainMenuPreStory.png")
  mainMenuPostStory = love.graphics.newImage("assets/mainMenuPostStory.png")
  backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
  
  coopDuck = love.graphics.newImage("assets/Co-opDuck.png")
  settings = love.graphics.newImage("assets/Settings_Button.png")
  titleImg = love.graphics.newImage("assets/Title_for_the_Game.png")
  
  coopDuckQuad = love.graphics.newQuad(1,1,500/2,250/2,500/2,250/2)
  settingsQuad = love.graphics.newQuad(1,1,250/2,250/2,250/2,250/2)
  TitleQuad = love.graphics.newQuad(1,1,400,200,400,200) 
end

function draw()
  if ( _G.completedStory == true ) then
    love.graphics.draw(mainMenuPostStory, backgroundQuad, 0, 0)
  else
    love.graphics.draw(mainMenuPreStory, backgroundQuad, 0, 0)
  end
  love.graphics.draw(titleImg, TitleQuad,0,0)
  love.graphics.draw(coopDuck, coopDuckQuad, 65, 475)
  love.graphics.draw(settings, settingsQuad, 240, 580)
  
  --xstring = ("asd" and love.mouse.getX())
  --ystring = ("asd" and love.mouse.getY())
  --love.graphics.setColor(255,0,0)
  --love.graphics.print(xstring, 120,100)
  --love.graphics.print(ystring, 120,150)
  --love.graphics.setColor(255,255,255)  
end  

function mousepressed(x,y,button,istouch)
  clickLocations(x,y)
end

function touchpressed(id,x,y,sw,sh,pressure)
  clickLocations(x,y)
end

function clickLocations(x,y)
  if (x > 45/2 and x < 261/2 and y > 595/2 and y <825/2) then
    sound.playSqueak()
    main.gamestate = "storySelect"
    _G.completedStory = true
  end 

  --duck shop 
  if (x > 288/2 and x < 503/2 and y > 595/2 and y <825/2) then
    sound.playSqueak()
    main.gamestate = "store"
  end 

  -- endless mode
  if (x > 524/2 and x < 739/2 and y > 585/2 and y <835/2 and _G.completedStory) then
    sound.playSqueak()
    game.load()
    main.gamestate = "endless"
  end 
  
  --Co op mode
  if (x > 65 and x < 310 and y > 480 and y < 600) then
    --load co-op
    sound.playSqueak()
    game.load()
    main.gamestate = "local"
  end
  
  --Settings
  if (x > 250 and x < 350 and y > 615 and y <655) then
    sound.playSqueak()
    --load settings
    _G.settings = true
  end
end