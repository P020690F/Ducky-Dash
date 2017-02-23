module("Menu", package.seeall)
require "Main"

function load()
  mainMenuPreStory = love.graphics.newImage("assets/MainMenuGreyEndless.png")
  mainMenuPostStory = love.graphics.newImage("assets/MainMenuAllYellow.png")
  backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
end

function draw()
  if ( _G.completedStory == true ) then
    love.graphics.draw(mainMenuPostStory, backgroundQuad, 0, 0)
  else
    love.graphics.draw(mainMenuPreStory, backgroundQuad, 0, 0)
  end
end  

function mousepressed(x,y,button,istouch)
  if (x < 95 and y > 355 and y <455) then
    _G.completedStory = true
  end 

  --duck shop 
  if (x > 140 and x < 235 and y > 345 and y <450) then
  
  end 

  -- endless mode
  if (x > 265 and x < 360 and y > 345 and y <450 and _G.completedStory) then
    Main.gamestate = "endless"
  end 
end

function touchpressed(id,x,y,sw,sh,pressure)
    if (x < 95 and y > 355 and y <455) then
    _G.completedStory = true
  end 

  --duck shop 
  if (x > 140 and x < 235 and y > 345 and y <450) then
  
  end 

  -- endless mode
  if (x > 265 and x < 360 and y > 345 and y <450 and _G.completedStory) then
    Main.gamestate = "endless"
  end 
end