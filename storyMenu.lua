module("storyMenu", package.seeall)
require "main"
require "game"

function load()
  story1 = love.graphics.newImage("assets/level_select_1.png")
  story2 = love.graphics.newImage("assets/level_select_2.png")
  story3 = love.graphics.newImage("assets/level_select_3.png")
  story4 = love.graphics.newImage("assets/level_select_4.png")
  mainImg = love.graphics.newImage("assets/MainMenuButton.png")
  buttonQuad = love.graphics.newQuad(1,1,150,150,150,150)  
  backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
end

function draw()
  if ( _G.storyLevel == 1 ) then
    love.graphics.draw(story1,backgroundQuad, 0, 0)
  elseif ( _G.storyLevel == 2 ) then
    love.graphics.draw(story2, backgroundQuad, 0, 0)
  elseif ( _G.storyLevel == 3 ) then
    love.graphics.draw(story3, backgroundQuad, 0, 0)
  elseif ( _G.storyLevel == 4 ) then
    love.graphics.draw(story4, backgroundQuad, 0, 0)
  end
  love.graphics.draw(mainImg, buttonQuad, 105 ,475)
end  

function mousepressed(x,y,button,istouch)
    clickLocations(x,y)
end
function touchpressed(id,x,y,sw,sh,pressure)
  clickLocations(x,y) 
end

function clickLocations(x,y)
  if ((x > 120 and x < 240) and ( y > 520 and y < 580)) then
    sound.playSqueak()
    main.gamestate = "menu"
  end
  
  if (x > 95 and x < 263) then   
    if(y < 381 and y > 331)then
      sound.playSqueak()
      main.gamestate = "cutscene"
      sound.play()
      cutscene.cutsceneState = 1.1
      game.pointsRequired = 20
    elseif (y > 250 and y < 300 and _G.storyLevel >= 2) then
      sound.playSqueak()
      main.gamestate = "cutscene"
      sound.play()
      cutscene.cutsceneState = 3.1
      game.pointsRequired = 40
    elseif (y > 165 and y < 213 and _G.storyLevel >= 3) then
      sound.playSqueak()
      main.gamestate = "cutscene"
      sound.play()
      cutscene.cutsceneState = 4.1
      game.pointsRequired = 60
    elseif (y > 79 and y < 127 and _G.storyLevel >= 4) then
      sound.playSqueak()
      main.gamestate = "cutscene"
      sound.play()
      cutscene.cutsceneState = 6.1
      game.pointsRequired = 80
    end
  end
end