module("cutscene", package.seeall)
require "main"
require "game"


function load()
  buttonQuad = love.graphics.newQuad(1,1,150,150,150,150)
  story1Cutscene1 = love.graphics.newImage("assets/Story_Page_1.png")
  story1Cutscene2 = love.graphics.newImage("assets/Story_Page_2.png")
  story2Cutscene1 = love.graphics.newImage("assets/Story_Page_3.png")
  story3Cutscene1 = love.graphics.newImage("assets/Story_Page_4.png")
  story3Cutscene2 = love.graphics.newImage("assets/Story_Page_5.png")
  story4Cutscene1 = love.graphics.newImage("assets/Story_Page_6.png")
  story4Cutscene2 = love.graphics.newImage("assets/Story_Page_7.png")
  story4Cutscene3 = love.graphics.newImage("assets/Story_Page_8.png")
  story4Cutscene4 = love.graphics.newImage("assets/Story_Page_9.png")
  
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
  
  story3Cutscene1Frames = {}
  story3Cutscene1Frames[1] = love.graphics.newQuad(0,0,375,214,story3Cutscene1:getDimensions())
  story3Cutscene1Frames[2] = love.graphics.newQuad(0,215,187,127,story3Cutscene1:getDimensions())
  story3Cutscene1Frames[3] = love.graphics.newQuad(0,0,375,342,story3Cutscene1:getDimensions())
  story3Cutscene1Frames[4] = love.graphics.newQuad(0,343,187,132,story3Cutscene1:getDimensions())
  story3Cutscene1Frames[5] = love.graphics.newQuad(0,0,375,475,story3Cutscene1:getDimensions())
  story3Cutscene1Frames[6] = love.graphics.newQuad(0,0,375,669,story3Cutscene1:getDimensions())
  
  story3Cutscene2Frames = {}
  story3Cutscene2Frames[1] = love.graphics.newQuad(0,0,375,234,story3Cutscene2:getDimensions())
  story3Cutscene2Frames[2] = love.graphics.newQuad(0,0,375,447,story3Cutscene2:getDimensions())
  story3Cutscene2Frames[3] = love.graphics.newQuad(0,0,375,669,story3Cutscene2:getDimensions())
  
  story4Cutscene1Frames = {}
  story4Cutscene1Frames[1] = love.graphics.newQuad(0,0,375,221,story4Cutscene1:getDimensions())
  story4Cutscene1Frames[2] = love.graphics.newQuad(0,222,193,213,story4Cutscene1:getDimensions())
  story4Cutscene1Frames[3] = love.graphics.newQuad(0,0,375,435,story4Cutscene1:getDimensions())
  story4Cutscene1Frames[4] = love.graphics.newQuad(0,0,375,669,story4Cutscene1:getDimensions())
  
  story4Cutscene2Frames = {}
  story4Cutscene2Frames[1] = love.graphics.newQuad(0,0,193,195,story4Cutscene2:getDimensions())
  story4Cutscene2Frames[2] = love.graphics.newQuad(0,0,375,195,story4Cutscene2:getDimensions())
  story4Cutscene2Frames[3] = love.graphics.newQuad(0,0,375,443,story4Cutscene2:getDimensions())
  story4Cutscene2Frames[4] = love.graphics.newQuad(0,0,375,669,story4Cutscene2:getDimensions())
  
  story4Cutscene3Frames = {}
  story4Cutscene3Frames[1] = love.graphics.newQuad(0,0,375,228,story4Cutscene3:getDimensions())
  story4Cutscene3Frames[2] = love.graphics.newQuad(0,0,375,446,story4Cutscene3:getDimensions())
  story4Cutscene3Frames[3] = love.graphics.newQuad(0,0,375,669,story4Cutscene3:getDimensions())
  
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
  
  if cutsceneState == 4.1 then
    love.graphics.draw(story3Cutscene1, story3Cutscene1Frames[1],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 4.2
      timer = 0 
    end
  end
  
  if cutsceneState == 4.2 then
    love.graphics.draw(story3Cutscene1, story3Cutscene1Frames[1],0,0)
    love.graphics.draw(story3Cutscene1, story3Cutscene1Frames[2],0,215)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 4.3
      timer = 0 
    end
  end
  
  if cutsceneState == 4.3 then
    love.graphics.draw(story3Cutscene1, story3Cutscene1Frames[3],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 4.4
      timer = 0 
    end
  end
  
  if cutsceneState == 4.4 then
    love.graphics.draw(story3Cutscene1, story3Cutscene1Frames[3],0,0)
    love.graphics.draw(story3Cutscene1, story3Cutscene1Frames[4],0,343)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 4.5
      timer = 0 
    end
  end
  
  if cutsceneState == 4.5 then
    love.graphics.draw(story3Cutscene1, story3Cutscene1Frames[5],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 4.6
      timer = 0 
    end
  end
  
  if cutsceneState == 4.6 then
    love.graphics.draw(story3Cutscene1, story3Cutscene1Frames[6],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      love.graphics.draw(RotatePhone.asdf, buttonQuad,220,545)
    end
  end
  
  if cutsceneState == 5.1 then
    love.graphics.draw(story3Cutscene2, story3Cutscene2Frames[1],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 5.2
      timer = 0 
    end
  end
  
  if cutsceneState == 5.2 then
    love.graphics.draw(story3Cutscene2, story3Cutscene2Frames[2],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 5.3
      timer = 0 
    end
  end
  
  if cutsceneState == 5.3 then
    love.graphics.draw(story3Cutscene2, story3Cutscene2Frames[3],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      love.graphics.draw(RotatePhone.asdf, buttonQuad,220,545)
    end
  end
  
  if cutsceneState == 6.1 then
    love.graphics.draw(story4Cutscene1, story4Cutscene1Frames[1],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 6.2
      timer = 0 
    end
  end
  
  if cutsceneState == 6.2 then
    love.graphics.draw(story4Cutscene1, story4Cutscene1Frames[1],0,0)
    love.graphics.draw(story4Cutscene1, story4Cutscene1Frames[2],0,222)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 6.3
      timer = 0 
    end
  end
  
  if cutsceneState == 6.3 then
    love.graphics.draw(story4Cutscene1, story4Cutscene1Frames[3],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 6.4
      timer = 0 
    end
  end
  
  if cutsceneState == 6.4 then
    love.graphics.draw(story4Cutscene1, story4Cutscene1Frames[4],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      love.graphics.draw(RotatePhone.asdf, buttonQuad,220,545)
    end
  end
  
  if cutsceneState == 7.1 then
    love.graphics.draw(story4Cutscene2, story4Cutscene2Frames[1],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 7.2
      timer = 0 
    end
  end
  
  if cutsceneState == 7.2 then
    love.graphics.draw(story4Cutscene2, story4Cutscene2Frames[1],0,0)
    love.graphics.draw(story4Cutscene2, story4Cutscene2Frames[2],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 7.3
      timer = 0 
    end
  end
  
  if cutsceneState == 7.3 then
    love.graphics.draw(story4Cutscene2, story4Cutscene2Frames[3],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 7.4
      timer = 0 
    end
  end
  
  if cutsceneState == 7.4 then
    love.graphics.draw(story4Cutscene2, story4Cutscene2Frames[4],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      love.graphics.draw(RotatePhone.asdf, buttonQuad,220,545)
    end
  end
  
  if cutsceneState == 8.1 then
    love.graphics.draw(story4Cutscene3, story4Cutscene3Frames[1],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 8.2
      timer = 0 
    end
  end
  
  if cutsceneState == 8.2 then
    love.graphics.draw(story4Cutscene3, story4Cutscene3Frames[2],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      cutsceneState = 8.3
      timer = 0 
    end
  end
  
  if cutsceneState == 8.3 then
    love.graphics.draw(story4Cutscene3, story4Cutscene3Frames[3],0,0)
    timer = timer + 1 * love.timer.getDelta()
    if timer > 2.5 then
      love.graphics.draw(RotatePhone.asdf, buttonQuad,220,545)
    end
  end
  
  if cutsceneState == 9.1 then
    love.graphics.draw(story4Cutscene4,0,0)
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
  timer = 2.5
  
  if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 1.3) then
    cutsceneState = 2.1
    timer = 0
  end  
  
  if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 2.5) then
    timer = 0
    main.gamestate = "story"
    game.load()
    game.storyLevel = 1
    _G.holdStoryLevel = 1
    _G.storyLevel = 1
  end 
  
  if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 3.4) then
    timer = 0
    main.gamestate = "story"
    game.load()
    game.storyLevel = 2
    _G.holdStoryLevel = 2
    _G.storyLevel = 2
  end
  
  if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 4.6) then
    cutsceneState = 5.1
    timer = 0
  end 
  
  if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 5.3) then
    timer = 0
    main.gamestate = "story"
    game.load()
    game.storyLevel = 3
    _G.holdStoryLevel = 3
    _G.storyLevel = 3
  end 
  
  if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 6.4) then
    cutsceneState = 7.1
    timer = 0
  end 
  
  if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 7.4) then
    timer = 0
    main.gamestate = "story"
    game.load()
    game.storyLevel = 4
    _G.holdStoryLevel = 4
    _G.storyLevel = 4
  end 
  
  if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 8.3) then
    cutsceneState = 9.1
    timer = 0
  else if (x > 234 and x < 353 and y > 589 and y < 647 and cutsceneState == 9.1) then
    timer = 0
    main.gamestate = "menu"
  end 
  end
end
  
end  