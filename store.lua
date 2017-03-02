module("store", package.seeall)
require "main"

function load()
  bathtub = love.graphics.newImage("assets/Bathtub.png")
  backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
end

function drawDuckSelect()
  love.graphics.draw(bathtub, backgroundQuad, 0, 0)
end  

function drawPowerUpStore()
  love.graphics.draw(bathtub, backgroundQuad, 0, 0)
end
