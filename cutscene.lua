module("cutscene", package.seeall)
require "main"
require "game"


function load()
  buttonQuad = love.graphics.newQuad(1,1,150,150,150,150)
  story1Cutscene1 = love.graphics.newImage("assets/Story_Page_1.png")
  story1Cutscene2 = love.graphics.newImage("assets/Story_Page_2.png")
  story2Cutscene1 = love.graphics.newImage("assets/Story_Page_3.png")
  
  timer = 0
  cutsceneState = 1.1
  
  story1Cutscene1Frames = {}
  story1Cutscene1Frames[1] = love.graphics.newQuad(0,0,375,197,story1Cutscene1:getDimensions())
  story1Cutscene1Frames[2] = love.graphics.newQuad(0,0,375,394,story1Cutscene1:getDimensions())
  story1Cutscene1Frames[3] = love.graphics.newQuad(0,0,375,669,story1Cutscene1:getDimensions())
  
  story1Cutscene2Frames = {}
  story1Cutscene2Frames[1] = love.graphics.newQuad(0,0,184,190,story1Cutscene2:getDimensions())
  story1Cutscene2Frames[2] = love.graphics.newQuad(0,0,375,190,story1Cutscene2:getDimensions())
  story1Cutscene2Frames[3] = love.graphics.newQuad(0,190,184,168,story1Cutscene2:getDimensions())
  story1Cutscene2Frames[4] = love.graphics.newQuad(0,0,375,358,story1Cutscene2:getDimensions())
  story1Cutscene2Frames[5] = love.graphics.newQuad(0,0,375,669,story1Cutscene2:getDimensions())
  
  story2Cutscene1Frames = {}
  story2Cutscene1Frames[1] = love.graphics.newQuad(0,0,375,234,story2Cutscene1:getDimensions())
  story2Cutscene1Frames[2] = love.graphics.newQuad(0,234,188,207,story2Cutscene1:getDimensions())
  story2Cutscene1Frames[3] = love.graphics.newQuad(0,0,375,441,story2Cutscene1:getDimensions())
  story2Cutscene1Frames[4] = love.graphics.newQuad(0,0,375,669,story2Cutscene1:getDimensions())
end

function draw()
  if cutsceneState == 1.1 then
    love.graphics.draw(story1Cutscene1, story1Cutscene1Frames[1],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 1.2
      timer = 0  
    end
  end
  
  if cutsceneState == 1.2 then
    love.graphics.draw(story1Cutscene1, story1Cutscene1Frames[2],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 1.3
      timer = 0  
    end
  end
  
  if cutsceneState == 1.3 then
    love.graphics.draw(story1Cutscene1, story1Cutscene1Frames[3],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
    love.graphics.draw(RotatePhone.asdf, buttonQuad,220,545)
    end
  end
  
  if cutsceneState == 2.1 then
    love.graphics.draw(story1Cutscene2, story1Cutscene2Frames[1],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 2.2
      timer = 0  
    end
  end
  
  if cutsceneState == 2.2 then
    love.graphics.draw(story1Cutscene2, story1Cutscene2Frames[2],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 2.3
      timer = 0  
    end
  end
  
  if cutsceneState == 2.3 then
    love.graphics.draw(story1Cutscene2, story1Cutscene2Frames[2],0,0)
    love.graphics.draw(story1Cutscene2, story1Cutscene2Frames[3],0,190)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 2.4
      timer = 0  
    end
  end
  
  if cutsceneState == 2.4 then
    love.graphics.draw(story1Cutscene2, story1Cutscene2Frames[4],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 2.5
      timer = 0  
    end
  end
  
  if cutsceneState == 2.5 then
    love.graphics.draw(story1Cutscene2, story1Cutscene2Frames[5],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      love.graphics.draw(RotatePhone.asdf, buttonQuad,220,545)
    end
  end
  
  if cutsceneState == 3.1 then
    love.graphics.draw(story2Cutscene1, story2Cutscene1Frames[1],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 3.2
      timer = 0  
    end
  end
  
  if cutsceneState == 3.2 then
    love.graphics.draw(story2Cutscene1, story2Cutscene1Frames[1],0,0)
    love.graphics.draw(story2Cutscene1, story2Cutscene1Frames[2],0,234)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 3.3
      timer = 0  
    end
  end
  
  if cutsceneState == 3.3 then
    love.graphics.draw(story2Cutscene1, story2Cutscene1Frames[3],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 3.4
      timer = 0  
    end
  end
  
  if cutsceneState == 3.4 then
    love.graphics.draw(story2Cutscene1, story2Cutscene1Frames[4],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      love.graphics.draw(RotatePhone.asdf, buttonQuad,220,545)
    end
  end
  
  
  
  
  
function mousepressed(x,y,button,istouch)
  clickLocations(x,y)
end

function touchpressed(id,x,y,sw,sh,pressure)
  clickLocations(x,y)
end

function clickLocations(x,y)
  if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 1.3) then
    cutsceneState = 2.1
    timer = 0
  end  
  
  if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 2.5) then
    timer = 0
    game.storyLevel = 1
    main.gamestate = "story"
    game.load()
  end 
  
  if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 3.4) then
    timer = 0
    game.storyLevel = 2
    main.gamestate = "story"
    game.load()
  end
end
  
end  