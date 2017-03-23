module("VsEndScreen", package.seeall)
require "main"
require "game"

function load()
  

  
  replayImg = love.graphics.newImage("assets/Replay_button.png")
  mainImg = love.graphics.newImage("assets/MainMenuButton.png")
  
  buttonQuad = love.graphics.newQuad(1,1,150,150,150,150)
  
  player1Score= 0
  player2Score= 0
  
  
end

function draw()
  

  
    love.graphics.draw(main.background, main.backgroundQuad, 0, 0)
    love.graphics.draw(mainImg,buttonQuad,50,500)
    love.graphics.draw(replayImg,buttonQuad,200,500)
    
  
  
  
  xstring = ("asd" and love.mouse.getX())
  ystring = ("asd" and love.mouse.getY())
  love.graphics.setColor(255,0,0)
  love.graphics.print(xstring, 120,100)
  love.graphics.print(ystring, 120,150)
  love.graphics.setColor(255,255,255)  
  
  
  
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