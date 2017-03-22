module("DuckDataBase", package.seeall)
require "main"


--Duck 1 = Standard_Duck
--Duck 2 = Punk_Duck
--Duck 3 = Astronaut_Duck
--Duck 4 = Cy_Duck
function load()
currentDuck = "Standard_Duck"
numDucks = 4

ownDuck1 = true
ownDuck2 = false
ownDuck3 = true
ownDuck4 = false
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
