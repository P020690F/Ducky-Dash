module("menu", package.seeall)
require "main"

function load()
  mainMenuPreStory = love.graphics.newImage("assets/mainMenuPreStory.png")
  mainMenuPostStory = love.graphics.newImage("assets/mainMenuPostStory.png")
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
  
  
  if (x > 45/2 and x < 261/2 and y > 702/2 and y <930/2) then
    _G.completedStory = true
  end 

  --duck shop 
  if (x > 288/2 and x < 503/2 and y > 702/2 and y <930/2) then
    main.gamestate = "store"
  end 

  -- endless mode
  if (x > 524/2 and x < 739/2 and y > 671/2 and y <899/2 and _G.completedStory) then
    main.gamestate = "endless"
  end 
end

function touchpressed(id,x,y,sw,sh,pressure)

   if (x > 45/2 and x < 261/2 and y > 702/2 and y <930/2) then
    _G.completedStory = true
  end 

  --duck shop 
  if (x > 288/2 and x < 503/2 and y > 702/2 and y <930/2) then
    main.gamestate = "store"
  end 

  -- endless mode
  if (x > 524 and x < 739 and y > 671 and y <899 and _G.completedStory) then
    main.gamestate = "endless"
  end 
end