module("upgrades", package.seeall)
require "main"

function load()
  speedState = "normalspeed"
  duckState = "vulnerable"
  pointState = "normal"
  lifeline = 0
 
  lifeLineUpgrade = love.graphics.newImage("assets/lifeline.png")
  invincibilityUpgrade = love.graphics.newImage("assets/invincibility.png")
  x2PointsUpgrade = love.graphics.newImage("assets/doublepoints.png")
  halfSpeedUpgrade = love.graphics.newImage("assets/slowdown.png")
  lifeLineQuad = love.graphics.newQuad(1,1,100,100,100,100)
  invincibilityQuad = love.graphics.newQuad(1,1,100,100,100,100)
  x2PointsQuad = love.graphics.newQuad(1,1,100,100,100,100)
  halfSpeedQuad = love.graphics.newQuad(1,1,100,100,100,100)
  
end

function DoublePoints()
  
end

function LifeLine()
  
end
function Invincibility()
  
end
function HalfSpeed()
  
  end
function SpawnUpgrade()
  upgradeDrop = love.math.random(1,4)
end