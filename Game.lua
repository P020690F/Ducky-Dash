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
   tempObject.PosX = 50 --Random Number Generator to determine position above screen
   tempObject.PosY = -1 * (i * 50)
   tempObject.Width = 10
   tempObject.Height = 10
   table.insert(Obstacles, tempObject)
 end
 
 
 
end

function drawStory()
end  

function drawEndless()
  
  for i,v in ipairs(Obstacles) do
    love.graphics.draw(v.Tex,bubblesQuad,v.PosX, v.PosY)
    end
  
love.graphics.draw(bathtub, backgroundQuad, 0, 0)
love.graphics.draw(Ducky.Tex, DuckQuad, Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height)

end