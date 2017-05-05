module("DuckDataBase", package.seeall)
require "main"


--Duck 1 = Standard_Duck
--Duck 2 = Punk_Duck
--Duck 3 = Astronaut_Duck
--Duck 4 = Cy_Duck


--Background 1 = Bath
--Background 2 = Park
--Background 1 = Rainbow
function load()
  currentDuck = "Standard_Duck"
  
  currentBackground = "Bath"
  
  numDucks = 4

  ownDuck1 = true
  ownDuck2 = false
  ownDuck3 = false
  ownDuck4 = true
  
  ownBath = true
  ownPark = false
  ownRainbow = false
  
  numLifeLine = 9
  numInvincability = 9
  numDoublePoints = 9
  numHalfSpeed = 9
  

  Standard_Duck = love.graphics.newImage("assets/Duck Skins/Standard_Duck_Front.png")
  Punk_Duck = love.graphics.newImage("assets/Duck Skins/Punk_Duck_Front.png")
  Astronaut_Duck = love.graphics.newImage("assets/Duck Skins/Astronaut_Duck_Front.png")
  Cy_Duck = love.graphics.newImage("assets/Duck Skins/Cy_Duck_Front.png")
  
  Standard_Duck_Sprite = love.graphics.newImage("assets/Duck Skins/Standard_Duck.png")
  Punk_Duck_Sprite = love.graphics.newImage("assets/Duck Skins/Punk_Duck.png")
  Astronaut_Duck_Sprite = love.graphics.newImage("assets/Duck Skins/Astronaut_Duck.png")
  Cy_Duck_Sprite = love.graphics.newImage("assets/Duck Skins/Cy_Duck.png")
end


function getDuckByNumber(number)
  if (number == 1) then
    return "Standard_Duck"
  elseif (number == 2) then
    return "Punk_Duck"
  elseif (number == 3) then
    return "Astronaut_Duck"
  elseif (number == 4) then
    return "Cy_Duck"
  end
end
function returnDuckOwnership(number)
 if (number == 1) then
    return ownDuck1
  elseif (number == 2) then
    return ownDuck2
  elseif (number == 3) then
    return ownDuck3
  elseif (number == 4) then
    return ownDuck4
  end
end
function buyDuck(number)
 if (number == 1) then
    ownDuck1 = true
  elseif (number == 2) then
    ownDuck2 = true
  elseif (number == 3) then
    ownDuck3 = true
  elseif (number == 4) then
    ownDuck4 = true
  end
end

function getImgByNum(number)
  if (number == 1) then
    return Standard_Duck
  elseif (number == 2) then
    return Punk_Duck
  elseif (number == 3) then
    return Astronaut_Duck
  elseif (number == 4) then
    return Cy_Duck
  end
end

function getSpriteByCurrentDuck()
  if (currentDuck == "Standard_Duck") then
    return Standard_Duck_Sprite
  elseif (currentDuck == "Punk_Duck") then
    return Punk_Duck_Sprite
  elseif (currentDuck == "Astronaut_Duck") then
    return Astronaut_Duck_Sprite
  elseif (currentDuck == "Cy_Duck") then
    return Cy_Duck_Sprite
  end
end
function getFrontByCurrentDuck()
  if (currentDuck == "Standard_Duck") then
    return Standard_Duck
  elseif (currentDuck == "Punk_Duck") then
    return Punk_Duck
  elseif (currentDuck == "Astronaut_Duck") then
    return Astronaut_Duck
  elseif (currentDuck == "Cy_Duck") then
    return Cy_Duck
  end
end
