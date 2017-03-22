module("upgrades", package.seeall)
require "main"

function load()

  LeftPoint = 50
  MiddlePoint = 130
  RightPoint = 210
  speedState = "normalspeed"
  duckState = "vulnerable"
  pointState = "normal"
  lifeline = 0
  isActive = false
  isSpawned = false
  upgradeType = "none"
  upgradeTex = love.graphics.newImage("assets/lifeline.png")
  upgradeQuad = love.graphics.newQuad(1,1,100,100,100,100)
  lifeLineUpgrade = love.graphics.newImage("assets/lifeline.png")
  invincibilityUpgrade = love.graphics.newImage("assets/invincibility.png")
  x2PointsUpgrade = love.graphics.newImage("assets/doublepoints.png")
  halfSpeedUpgrade = love.graphics.newImage("assets/slowdown.png")
  lifeLineQuad = love.graphics.newQuad(1,1,100,100,100,100)
  invincibilityQuad = love.graphics.newQuad(1,1,100,100,100,100)
  x2PointsQuad = love.graphics.newQuad(1,1,100,100,100,100)
  halfSpeedQuad = love.graphics.newQuad(1,1,100,100,100,100)
  upgradeX = 60
  upgradeY = -100
  upgradeDrop = love.math.random(1,4)
  upgradeLane = love.math.random(1,3)
end

function Update()
  if (isSpawned == false) then
    if (isActive == false) then
      if(main.gamestate == "endless") then
        if (game.endlessScore >= 10 and game.endlessScore % 10 == 0) then
          SpawnUpgrade()
        end
      end
    end
  elseif (isSpawned == true) then
    if(isActive == false) then
      if (upgradeY < 500) then
        upgradeY = upgradeY + 3
      else
        upgradeY = 0
        isSpawned = false
      end
    end
  end
  hitTest = CheckCollision(upgradeX, upgradeY, 50, 100, game.Ducky.PosX, game.Ducky.PosY, game.Ducky.Width, game.Ducky.Height)
  if (hitTest) then
    upgradeY = 700
    isSpawned = false
    isActive = true
  end
  if (isSpawned == false) then
    if (isActive == true) then
      if (upgradeType == "Invincibility") then
      Invincibility()
      elseif (upgradeType == "LifeLine") then
      LifeLine()
      elseif (upgradeType == "x2Points") then
      DoublePoints()
      else
      HalfSpeed()
      end
    end
  end
end  
function DoublePoints()
  if (game.endlessScore >= 20 and game.endlessScore % 20 == 0) then
    pointState = "normal"
    isActive = false
  else
    pointState = "doublePoints"
  end
end

function LifeLine()
  isActive = false
end
function Invincibility()
  if (game.endlessScore >= 10 and game.endlessScore % 10 == 0) then
    duckState = "vulnerable"
    isActive = false
  else
    duckState = "invulnerable"
  end
end
function HalfSpeed()
  if (game.endlessScore >= 10 and game.endlessScore % 10 == 0) then
    speedState = "normal"
    isActive = false
  else
    speedState = "halfSpeed"
  end
end

function SpawnUpgrade()
  upgradeDrop = love.math.random(1,3)
  upgradeLane = love.math.random(1,3)
  if(upgradeLane == 1) then
    upgradeX = LeftPoint
  else if(upgradeLane == 2) then
    upgradeX = MiddlePoint
  elseif(upgradeLane == 3) then
    upgradeX = RightPoint
  end
  if (upgradeDrop == 1) then
    upgradeType = "LifeLine"
    upgradeTex = lifeLineUpgrade
    upgradeQuad = lifeLineQuad
  elseif (upgradeDrop == 2) then
    upgradeType = "Invincibility"
    upgradeTex = invincibilityUpgrade
    upgradeQuad = invincibilityQuad
  elseif(upgradeDrop == 3) then
    upgradeType = "x2Points"
    upgradeTex = x2PointsUpgrade
    upgradeQuad = x2PointsQuad
  else
    upgradeType = "HalfSpeed"
    upgradeTex = halfSpeedUpgrade
    upgradeQuad = halfSpeedQuad
  end
end
isSpawned = true
end
function Draw()
  if(isSpawned == true) then
  love.graphics.draw(upgradeTex,upgradeQuad,upgradeX, upgradeY)
  end
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end