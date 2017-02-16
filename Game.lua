module("Game", package.seeall)
require "Main"

function load()
 standardduck = love.graphics.newImage("assets/Duck Skins/Standard_Duck.png")
 DuckQuad = love.graphics.newQuad(1,1,100,100,100,100)
 astronautduck = love.graphics.newImage("assets/Duck Skins/Astronaut_Duck.png")
 punkduck = love.graphics.newImage("assets/Duck Skins/Punk_Duck.png")
 
 bathtub = love.graphics.newImage("assets/Bathtub.png")
 backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 
 bubbles= love.graphics.newImage("assets/bubbles.png")
 bubblesQuad = love.graphics.newQuad(1,1,100,100,100,100)
 drain = love.graphics.newImage("assets/Drain.png")
 plug = love.graphics.newImage("assets/Plug.png")
 water = love.graphics.newImage("assets/Water.png")
 
 Ducky = {}
 Ducky.Tex = standardduck
 Ducky.PosX = 130
 Ducky.PosY = 550
 Ducky.Height = 10
 Ducky.Width = 10
 
 Obstacles = {}
 for i = 1, 5 do
   local tempObject = {}
   tempObject.Tex = bubbles
   tempObject.Lane = math.random(1,3) --Random Number to decide which Lane the obstacle is in
   
   if (tempObject.Lane == 1) then
     tempObject.PosX = 35
   end
   
     if (tempObject.Lane == 2) then
     tempObject.PosX = 115
     
   end
     if (tempObject.Lane == 3) then
     tempObject.PosX = 200
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
love.graphics.draw(Ducky.Tex, DuckQuad, Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height)
 for i,v in ipairs(Obstacles) do
    love.graphics.draw(v.Tex,bubblesQuad,v.PosX, v.PosY)
  end
end

function updateEndless()
  
  for i,v in ipairs(Obstacles) do
    v.PosY = v.PosY + 2.5
    if v.PosY > 500 then
      v.PosY = -(i * 50)
    end
  end
  
end