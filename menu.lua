module("menu", package.seeall)
require "main"

function load()
  mainMenuPreStory = love.graphics.newImage("assets/mainMenuPreStory.png")
  mainMenuPostStory = love.graphics.newImage("assets/mainMenuPostStory.png")
  backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
  
  coopDuck = love.graphics.newImage("assets/Co-opDuck.png")
  settings = love.graphics.newImage("assets/Settings_Button.png")
  
  coopDuckQuad = love.graphics.newQuad(1,1,500/2,250/2,500/2,250/2)
  settingsQuad = love.graphics.newQuad(1,1,250/2,250/2,250/2,250/2)
  
end

function draw()
  if ( _G.completedStory == true ) then
    love.graphics.draw(mainMenuPostStory, backgroundQuad, 0, 0)
  else
    love.graphics.draw(mainMenuPreStory, backgroundQuad, 0, 0)
  end
  
  love.graphics.draw(coopDuck, coopDuckQuad, 65, 475)
  love.graphics.draw(settings, settingsQuad, 240, 580)
  
 -- xstring = ("asd" and love.mouse.getX())
  --ystring = ("asd" and love.mouse.getY())
 -- love.graphics.setColor(255,0,0)
 -- love.graphics.print(xstring, 120,100)
--  love.graphics.print(ystring, 120,150)
--  love.graphics.setColor(255,255,255)  
  
  
  
end  

function mousepressed(x,y,button,istouch)
  
  
  if (x > 45/2 and x < 261/2 and y > 702/2 and y <930/2) then
    main.gamestate = "story"
    _G.completedStory = true
  end 

  --duck shop 
  if (x > 288/2 and x < 503/2 and y > 702/2 and y <930/2) then
    store.load()
    main.gamestate = "store"
  end 

  -- endless mode
  if (x > 524/2 and x < 739/2 and y > 671/2 and y <899/2 and _G.completedStory) then
    game.load()
    main.gamestate = "endless"
  end 
  
  --Co op mode
  if (x > 65 and x < 310 and y > 480 and y < 600) then
    --load co-op
    --main.gamestate = "coop"
  end
  
  --Settings
  if (x > 250 and x < 350 and y > 615 and y <655) then
    --load settings
    _G.settings = true
  end

end
function touchpressed(id,x,y,sw,sh,pressure)

<<<<<<< HEAD
   if (x > 45/2 and x < 261/2 and y > 702/2 and y <930/2) then
    main.gamestate = "story"
=======
  if (x > 45/2 and x < 261/2 and y > 702/2 and y <930/2) then
>>>>>>> origin/Rhys_O
    _G.completedStory = true
  end 

  --duck shop 
  if (x > 288/2 and x < 503/2 and y > 702/2 and y <930/2) then
    store.load()
    main.gamestate = "store"
  end 

  -- endless mode
  if (x > 524/2 and x < 739/2 and y > 671/2 and y <899/2 and _G.completedStory) then
    game.load()
    main.gamestate = "endless"
  end 
  
  --Co op mode
  if (x > 65 and x < 310 and y > 480 and y < 600) then
    --load co-op
    --main.gamestate = "coop"
  end
  
  --Settings
  if (x > 250 and x < 350 and y > 615 and y <655) then
    --load settings
    _G.settings=true
  end

end