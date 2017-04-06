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
  upgradeQuad = love.graphics.newQuad(1,1,100,100,100,100)
  upgradeTex = "assets/Invincibility.png"
  lifeLineUpgrade = love.graphics.newImage("assets/lifeline.png")
  invincibilityUpgrade = love.graphics.newImage("assets/Invincibility.png")
  x2PointsUpgrade = love.graphics.newImage("assets/double_points.png")
  halfSpeedUpgrade = love.graphics.newImage("assets/Slow_down.png")
  lifeLineQuad = love.graphics.newQuad(1,1,100,100,100,100)
  invincibilityQuad = love.graphics.newQuad(1,1,100,100,100,100)
  x2PointsQuad = love.graphics.newQuad(1,1,100,100,100,100)
  halfSpeedQuad = love.graphics.newQuad(1,1,100,100,100,100)
  upgradeX = 60
  upgradeY = -100
  upgradeDrop = love.math.random(1,4)
  upgradeLane = love.math.random(1,3)
  
  upgradeSpTimer = 0
  upgradeAcTimer = 0
  timerStep = love.math.random(10,30)
end

function Update()
  upgradeSpTimer = upgradeSpTimer + 1 * love.timer.getDelta()
  if (isSpawned == false) then
    if (isActive == false) then
      if(main.gamestate == "endless") then
        if (upgradeSpTimer > timerStep) then
          SpawnUpgrade()
          timerStep = love.math.random(5,10)
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
        upgradeSpTimer = 0
        timerStep = love.math.random(10,30)
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
        if (game.duckLife == 1) then
        LifeLine()
        end
      elseif (upgradeType == "x2Points") then
      DoublePoints()
    else
      HalfSpeed()
      end
    end
  end
end  
function DoublePoints()
  if (upgradeAcTimer > timerStep) then
    pointState = "normal"
    isActive = false
    upgradeAcTimer = 0
    upgradeSpTimer = 0
    timerStep = love.math.random(10,30)
  else
    upgradeAcTimer = upgradeAcTimer + 1 * love.timer.getDelta()
    pointState = "doublePoints"
  end

end

function LifeLine()
  if (game.duckLife == 1 or game.duckLife == 2) then
  game.duckLife = game.duckLife + 1 
  game.duckVerticalMove = "up"  
  game.hit = false
  upgradeAcTimer = 0
  upgradeSpTimer = 0
  timerStep = love.math.random(10,30)
  isActive = false
end

end
function Invincibility()
  if (upgradeAcTimer > timerStep) then
    duckState = "vulnerable"
    upgradeAcTimer = 0
    upgradeSpTimer = 0
    timerStep = love.math.random(10,30)
    isActive = false
  else
    upgradeAcTimer = upgradeAcTimer + 1 * love.timer.getDelta()
    duckState = "invulnerable"
  end
end
function HalfSpeed()
  if (upgradeAcTimer > timerStep) then
    speedState = "normal"
    upgradeAcTimer = 0
    upgradeSpTimer = 0
    timerStep = love.math.random(10,30)
    isActive = false
  else
    upgradeAcTimer = upgradeAcTimer + 1 * love.timer.getDelta()
    speedState = "halfSpeed"
  end
end

function SpawnUpgrade()
  upgradeDrop = love.math.random(1,4)
  upgradeLane = love.math.random(1,3)
  if(upgradeLane == 1) then
    upgradeX = LeftPoint
  else if(upgradeLane == 2) then
    upgradeX = MiddlePoint
  elseif(upgradeLane == 3) then
    upgradeX = RightPoint
  end
  if (upgradeDrop == 1 and not (game.duckLife == 3)) then
    upgradeType = "LifeLine"
    upgradeTex = lifeLineUpgrade
    upgradeQuad = lifeLineQuad
  end
  if (upgradeDrop == 1 and game.duckLife == 3) then 
    upgradeDrop = love.math.random(2,4)
  end
  if (upgradeDrop == 2) then
    upgradeType = "Invincibility"
    upgradeTex = invincibilityUpgrade
    upgradeQuad = invincibilityQuad
  end
  if(upgradeDrop == 3) then
    upgradeType = "x2Points"
    upgradeTex = x2PointsUpgrade
    upgradeQuad = x2PointsQuad
  end
  if(upgradeDrop == 4) then
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