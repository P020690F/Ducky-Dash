module("Upgrades", package.seeall)
require "Main"

function load()
  scoreModifier
  upgradeSpeed
  
  
end

function HalfSpeed()
 
end

function DoublePoints()
  
  
end
function LifeLine()
  if (duckColumn > 2) then
    duckColumn = duckColumn
  else
    duckColumn = duckColumn + 2
  end
end

function Invincibility()
  
end