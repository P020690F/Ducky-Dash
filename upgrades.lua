module("upgrades", package.seeall)
require "main"

function load()
  speedState = "normalspeed"
  duckState = "vulnerable"
  pointState = "normal"
  lifeline = 0
  isActive = false
  isSpawned = false
  upgradeType = "none"
  lifeLineUpgrade = love.graphics.newImage("assets/lifeline.png")
  invincibilityUpgrade = love.graphics.newImage("assets/invincibility.png")
  x2PointsUpgrade = love.graphics.newImage("assets/doublepoints.png")
  halfSpeedUpgrade = love.graphics.newImage("assets/slowdown.png")
  lifeLineQuad = love.graphics.newQuad(1,1,100,100,100,100)
  invincibilityQuad = love.graphics.newQuad(1,1,100,100,100,100)
  x2PointsQuad = love.graphics.newQuad(1,1,100,100,100,100)
  halfSpeedQuad = love.graphics.newQuad(1,1,100,100,100,100)
  
  upgradeY = 0
end

function Update()
  if (isSpawned == false) then
    if (isActive == false) then
      SpawnUpgrade()
    end
  elseif (isSpawned == true) then
    if(isActive == false) then
      if (upgradeY < 500) then
        upgradeY = upgradeY + 10
      else
        upgradeY = 0
        isSpawned = false
      end
  
end
end
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
if (upgradeDrop == 1) then
  upgradeType = "LifeLine"
  upgradeLane = love.math.random(1,3)
  if(upgradeLane == 1) then 
    love.graphics.draw(lifeLineUpgrade,lifeLineQuad,game.LeftPoint.X, upgradeY)
  elseif(upgradeLane == 2) then
    love.graphics.draw(lifeLineUpgrade,lifeLineQuad,game.MiddlePoint.X, upgradeY)
  elseif(upgradeLane == 3) then
    love.graphics.draw(lifeLineUpgrade,lifeLineQuad,game.RightPoint.X, upgradeY)
  end
elseif(upgradeDrop == 2) then
    upgradeLane = love.math.random(1,3)
    upgradeType = "Invincibility"
  if(upgradeLane == 1) then 
    love.graphics.draw(invincibilityUpgrade,invincibilityQuad,game.LeftPoint.X, upgradeY)
  elseif(upgradeLane == 2) then
    love.graphics.draw(invincibilityUpgrade,invincibilityQuad,game.MiddlePoint.X, upgradeY)
  elseif(upgradeLane == 3) then
    love.graphics.draw(invincibilityUpgrade,invincibilityQuad,game.RightPoint.X, upgradeY)
  end
elseif(upgradeDrop == 3) then
    upgradeLane = love.math.random(1,3)
    upgradeType = "x2Points"
  if(upgradeLane == 1) then 
    love.graphics.draw(x2PointsUpgrade,x2PointsQuad,game.LeftPoint.X, upgradeY)
  elseif(upgradeLane == 2) then
    love.graphics.draw(x2PointsUpgrade,x2PointsQuad,game.MiddlePoint.X, upgradeY)
  elseif(upgradeLane == 3) then
    love.graphics.draw(x2PointsUpgrade,x2PointsQuad,game.RightPoint.X, upgradeY)
  end
else
  upgradeLane = love.math.random(1,3)
  upgradeType = "HalfSpeed"
  if(upgradeLane == 1) then 
    love.graphics.draw(halfSpeedUpgrade,halfSpeedQuad,game.LeftPoint.X, upgradeY)
  elseif(upgradeLane == 2) then
    love.graphics.draw(halfSpeedUpgrade,halfSpeedQuad,game.MiddlePoint.X, upgradeY)
  elseif(upgradeLane == 3) then
    love.graphics.draw(halfSpeedUpgrade,halfSpeedQuad,game.RightPoint.X, upgradeY)
  end
end
isSpawned = true
end