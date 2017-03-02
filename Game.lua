module("game", package.seeall)
require "main"

function load()
 standardduck = love.graphics.newImage("assets/Duck Skins/Standard_Duck.png")
 astronautduck = love.graphics.newImage("assets/Duck Skins/Astronaut_Duck.png")
 punkduck = love.graphics.newImage("assets/Duck Skins/Punk_Duck.png")
 
 upgradeState = "none"
 
 water = love.graphics.newImage("assets/Water.png")
 waterQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 drain = love.graphics.newImage("assets/Drain.png")
 drainQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 bathtub = love.graphics.newImage("assets/Bathtub.png")
 backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 
 speed = 2.5
 
 bubbles= love.graphics.newImage("assets/bubbles.png")
 bubblesQuad = love.graphics.newQuad(1,1,100,100,100,100)
 
 Ducky = {
 Tex = standardduck,
 PosX = 0,
 PosY = 0,
 Position = "middle",
 Height = 10,
 Width = 10
 }
 DuckQuad = love.graphics.newQuad(1,1,100,100,100,100)

 LeftPoint = { PosX = 50, PosY = 400 }
 MiddlePoint = { PosX = 130, PosY = 400 }
 RightPoint = { PosX = 210, PosY = 400 }
 
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
end  

function updateStory()
end  

function drawEndless()
  love.graphics.draw(bathtub, backgroundQuad, 0, 0)
  love.graphics.draw(water, waterQuad, 0, 0)
  love.graphics.draw(drain, drainQuad, 0, 0)
  
  for i,v in ipairs(Obstacles) do
    love.graphics.draw(v.Tex,bubblesQuad,v.PosX, v.PosY)
  end
  love.graphics.draw(Ducky.Tex, DuckQuad, Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height)
end

function updateEndless()
  if Ducky.Position == "left" then
    Ducky.PosX = LeftPoint.PosX
    Ducky.PosY = LeftPoint.PosY
  end
  
  if Ducky.Position == "middle" then
    Ducky.PosX = MiddlePoint.PosX
    Ducky.PosY = MiddlePoint.PosY
  end
  
  if Ducky.Position == "right" then
    Ducky.PosX = RightPoint.PosX
    Ducky.PosY = RightPoint.PosY
  end
  
  
  for i,v in ipairs(Obstacles) do
    if (upgradeState == "halfSpeed") then
      Upgrades.HalfSpeed()
    else
      v.PosY = v.PosY + speed
    end

    if v.PosY > 500 then
        v.PosY = -(i * 100)
    end
  end
  
  for i,v in ipairs(Obstacles) do
    hitTest = CheckCollision(v.PosX, v.PosY, v.Width, v.Height, Ducky.PosX, Ducky.PosY, Ducky.Width, Ducky.Height)
    if (hitTest) then
      main.gamestate = "menu"
    end  
  end
end

function keypressed(key)
  if (Ducky.Position == "middle") then
    if (key == "1") then
      Ducky.Position = "left"
    end
    
    if (key == "3") then
      Ducky.Position = "right"
    end
  end

  if (Ducky.Position == "left" or Ducky.Position == "right") then
    if (key == "2") then
      Ducky.Position = "middle"
    end
  end
end

function mousepressed(x,y,button,istouch)
  if (Ducky.Position == "left" and x > Ducky.PosX) then
    Ducky.Position = "middle"
  elseif (Ducky.Position == "right" and x < Ducky.PosX) then
    Ducky.Position = "middle"
  elseif (Ducky.Position == "middle") then
    if (x < Ducky.PosX) then
      Ducky.Position = "left"
    elseif (x > Ducky.PosX) then
      Ducky.Position = "right"
    end
  end
end

function touchpressed(id,x,y,sw,sh,pressure)
  if (Ducky.Position == "left" and x > Ducky.PosX) then
    Ducky.Position = "middle"
  elseif (Ducky.Position == "right" and x < Ducky.PosX) then
    Ducky.Position = "middle"
  elseif (Ducky.Position == "middle") then
    if (x < Ducky.PosX) then
      Ducky.Position = "left"
    elseif (x > Ducky.PosX) then
      Ducky.Position = "right"
    end
  end
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
