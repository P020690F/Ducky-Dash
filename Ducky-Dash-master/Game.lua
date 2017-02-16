module("Game", package.seeall)
require "Main"

function load()
 standardduck = love.graphics.newImage("assets/Duck Skins/Standard_Duck.png")
 astronautduck = love.graphics.newImage("assets/Duck Skins/Astronaut_Duck.png")
 punkduck = love.graphics.newImage("assets/Duck Skins/Punk_Duck.png")
 
 bathtub = love.graphics.newImage("assets/Bathtub.png")
 backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 bubbles= love.graphics.newImage("assets/bubbles.png")
 drain = love.graphics.newImage("assets/Drain.png")
 plug = love.graphics.newImage("assets/Plug.png")
 water = love.graphics.newImage("assets/Water.png")
end

function drawStory()
end  

function drawEndless()
love.graphics.draw(bathtub, backgroundQuad, 0, 0)
end