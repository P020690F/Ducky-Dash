module("VsEndScreen", package.seeall)
require "main"
require "game"

function load()
  story1 = love.graphics.newImage("assets/level_select_1.png")
  
  hsdfh = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
  
  replayImg = love.graphics.newImage("assets/Replay_button.png")
  mainImg = love.graphics.newImage("assets/MainMenuButton.png")
  
  buttonQuad = love.graphics.newQuad(1,1,150,150,150,150)
  
  player1Score= 0
  player2Score= 0
end

function draw()
  love.graphics.draw(story1,hsdfh,0,0)
  love.graphics.draw(mainImg,buttonQuad,50,500)
  love.graphics.draw(replayImg,buttonQuad,200,500)
end  

function mousepressed(x,y,button,istouch)
    clickLocations(x,y)
end
function touchpressed(id,x,y,sw,sh,pressure)
  clickLocations(x,y) 
end

function clickLocations(x,y)
  if (y > 543 and y < 602) then
    
    if(x > 63 and x < 184)then     
      main.gamestate = "menu"
    elseif (x > 215 and x < 334 ) then
      game.load()
      main.gamestate = "local"
   
    end
  end
end