module("VsEndScreen", package.seeall)
require "main"
require "game"
require "DuckDataBase"

function load()
  

  
  replayImg = love.graphics.newImage("assets/Replay_Button.png")
  mainImg = love.graphics.newImage("assets/MainMenuButton.png")
  
  buttonQuad = love.graphics.newQuad(1,1,150,150,150,150)
  
  smallDuckQuad = love.graphics.newQuad(1,1,150/2,150/2,150/2,150/2)
  winDuckQuad = love.graphics.newQuad(1,1,450/2,450/2,500/2,500/2)
  
  textBox = love.graphics.newImage("assets/ScoreBox.png")
  textBoxQuad = love.graphics.newQuad(1,1,250,260,250,260)
  
  platform = love.graphics.newImage("assets/platform.png")
  winPlatQuad = love.graphics.newQuad(1,1,150,150,150,150)
  losePlatQuad = love.graphics.newQuad(1,1,75,75,75,75)
  drawPlatQuad = love.graphics.newQuad(1,1,120,120,120,120)
  
  player1Score= 0
  player2Score= 0
  
  
end

function draw()
  

  
  love.graphics.draw(main.background, main.backgroundQuad, 0, 0)
  love.graphics.draw(mainImg,buttonQuad,50,500)
  love.graphics.draw(replayImg,buttonQuad,200,500)
  love.graphics.draw(textBox,textBoxQuad,75,275)
  
  if (player1Score == player2Score) then
    love.graphics.setColor(0,0,255)
    love.graphics.print("The result was a draw!",90,390)
    love.graphics.setColor(255,255,255)  
  else
    
    love.graphics.draw(DuckDataBase.getFrontByCurrentDuck(),winDuckQuad,0,20)
    love.graphics.draw(DuckDataBase.getFrontByCurrentDuck(),smallDuckQuad,250,235)
    love.graphics.draw(platform,winPlatQuad,40,200)
    love.graphics.draw(platform,losePlatQuad,250,280)
    love.graphics.setColor(0,0,255)
    love.graphics.print("The Winner",145,360)
    love.graphics.print("is",195,390)
    if (player1Score > player2Score) then
      love.graphics.print("Player 1!",170,420)
    else
      love.graphics.print("Player 2!",170,420)
    end
    love.graphics.setColor(255,255,255)  
  end
  
  
  
  
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
  if (y > 543 and y < 602) then
    
    if(x > 63 and x < 184)then     
      main.gamestate = "menu"
    elseif (x > 215 and x < 334 ) then
      game.load()
      main.gamestate = "local"
   
    end
  
  
  end
end