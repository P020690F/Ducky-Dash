module("game", package.seeall)
require "main"
require "duckdatabase"
require "storyMenu"
function load()
 
 duckSkin = love.graphics.newImage("assets/Duck Skins/" .. duckdatabase.currentDuck .. ".png")
 
 storyLevel = 0
 upgradeState = "normalSpeed"
 duckState = "vulnerable"
 
 water = love.graphics.newImage("assets/Water.png")
 waterQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 drain = love.graphics.newImage("assets/Drain.png")
 drainQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 bathtub = love.graphics.newImage("assets/Bathtub.png")
 backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 gameover = love.graphics.newImage("assets/GameOverScreen.png")
 retryButton = love.graphics.newImage("assets/RetryButton.png")
 mainmenuButton = love.graphics.newImage("assets/MainMenuButton.png")
 buttonQuad = love.graphics.newQuad(1,1,150,150,150,150)
 scoreFont = love.graphics.newFont(20)
 
 speedMultiplier = 1
 endlessScore = 0
 speed = 2.5
 
 bubbles= love.graphics.newImage("assets/bubbles.png")
 bubblesQuad = love.graphics.newQuad(1,1,100,100,100,100)
 
 Ducky = {
 Tex = duckSkin,
 PosX = 130,
 PosY = 350,
 Position = "middle",
 Height = 10,
 Width = 10
 }
 DuckQuad = love.graphics.newQuad(1,1,100,100,100,100)

 LeftPoint = { PosX = 50, PosY = 400 }
 MiddlePoint = { PosX = 130, PosY = 400 }
 RightPoint = { PosX = 210, PosY = 400 }
 
 duckHorizontalMove = "still"
 duckVerticalMove = "still"
 
 duckLife = 2
 
 Obstacles = {}
 for i = 1, 5 do
   local tempObject = {}
   tempObject.Tex = bubbles
   tempObject.Lane = math.random(1,3) --Random Number to decide which Lane the obstacle is in
   
   if (tempObject.Lane == 1) then
     tempObject.PosX = LeftPoint.PosX
   end
   
   if (tempObject.Lane == 2) then
     tempObject.PosX = MiddlePoint.PosX
   end
   
    if (tempObject.Lane == 3) then
     tempObject.PosX = RightPoint.PosX
   end
 
   tempObject.PosY = -(i * 100)
   tempObject.Width = 10
   tempObject.Height = 10
   table.insert(Obstacles, tempObject)
 end
end

function drawStory()
  love.graphics.draw(bathtub, backgroundQuad, 0, 0)
  love.graphics.draw(water, waterQuad, 0, 0)
  love.graphics.draw(drain, drainQuad, 0, 0)
end  

function updateStory()
end  

function drawEndless()
  love.graphics.draw(bathtub, backgroundQuad, 0, 0)
  love.graphics.draw(water, waterQuad, 0, 0)
  love.graphics.draw(drain, drainQuad, 0, 0)
  love.graphics.setFont(scoreFont)
  love.graphics.setColor(255,0,0)
  love.graphics.print("Score: ", 10, 600)
  love.graphics.print(endlessScore, 80, 600)
  love.graphics.setColor(255,255,255)
  
  for i,v in ipairs(Obstacles) do
    love.graphics.draw(v.Tex,bubblesQuad,v.PosX, v.PosY)
  end
  love.graphics.draw(Ducky.Tex, DuckQuad, Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height)
end

function updateEndless()
  if not _G.paused then
    if duckHorizontalMove == "left" then
      if Ducky.Position == "left" then
        Ducky.PosX = Ducky.PosX - 5
        if Ducky.PosX == 50 then
          duckHorizontalMove = "still"
        end
      elseif Ducky.Position == "middle" then
        Ducky.PosX = Ducky.PosX - 5
        if Ducky.PosX == 130 then
          duckHorizontalMove = "still"
        end
      end 
    end
    
    if duckHorizontalMove == "right" then
      if Ducky.Position == "right" then
        Ducky.PosX = Ducky.PosX + 5
        if Ducky.PosX == 210 then
          duckHorizontalMove = "still"
        end
      elseif Ducky.Position == "middle" then
        Ducky.PosX = Ducky.PosX + 5
        if Ducky.PosX == 130 then
          duckHorizontalMove = "still"
        end
      end 
    end
    
    if duckVerticalMove == "down" then
      if duckLife == 1 then
        Ducky.PosY =  Ducky.PosY + 5
        if Ducky.PosY == 400 then
          duckVerticalMove = "still"
          duckState = "vulnerable"
        end
      end
    end

      if endlessScore >= 5 and endlessScore % 5 == 0 then
          speed = endlessScore / 20 + 2.5
      end
      
      if (upgradeState == "halfSpeed") then
        speedMultiplier = 0.5
      else
        speedMultiplier = 1
      end
    
    for i,v in ipairs(Obstacles) do
      v.PosY = v.PosY + (speed * speedMultiplier)
        
      if v.PosY > 500 then
          v.PosY = -(i * 100)
          endlessScore = endlessScore + 1
      end
    end
    
    if(duckState == "vulnerable") then
      for i,v in ipairs(Obstacles) do
        hitTest = CheckCollision(v.PosX, v.PosY, v.Width, v.Height, Ducky.PosX, Ducky.PosY, Ducky.Width, Ducky.Height)
        if (hitTest) then
          duckLife = duckLife - 1
          if duckLife == 1  then
            duckVerticalMove = "down"  
            duckState = "BeenHit"
            v.PosY = -100
          elseif duckLife == 0 then
            main.gamestate = "gameover"
          end
          _G.DuckBills = _G.DuckBills + endlessScore
        end  
      end
    end
  end
end

function drawGameOver()
  love.graphics.draw(gameover, backgroundQuad, 0, 0)
  love.graphics.draw(retryButton, buttonQuad, 30, 475)
  love.graphics.draw(mainmenuButton, buttonQuad, 200, 475)
end  

function mousepressed(x,y,button,istouch)
  clickLocations(x,y)
end

function touchpressed(id,x,y,sw,sh,pressure)
  clickLocations(x,y)
end

function clickLocations (x,y)
  if (Ducky.Position == "left" and x > Ducky.PosX) then
    Ducky.Position = "middle"
    duckHorizontalMove = "right"
  elseif (Ducky.Position == "right" and x < Ducky.PosX) then
    Ducky.Position = "middle"
    duckHorizontalMove = "left"
  elseif (Ducky.Position == "middle") then
    if (x < Ducky.PosX) then
      Ducky.Position = "left"
      duckHorizontalMove = "left"
    elseif (x > Ducky.PosX) then
      Ducky.Position = "right"
      duckHorizontalMove = "right"
    end
  end
  
  if x >= 30 and x < 180 and y >= 475 and y < 625 and main.gamestate == "gameover" then
    game.load()
    main.gamestate = "endless"
  end
  
  if x >= 200 and x < 350 and y >= 475 and y < 625 and main.gamestate == "gameover" then
    main.gamestate = "menu"
  end
  
  if (x > 644/2 and y > 1239/2 and x < 695/2 and y < 1311 and main.gamestate ~= "gameover") then
    _G.paused = true
  end

end


function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
