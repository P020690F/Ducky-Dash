module("Upgrades", package.seeall)
<<<<<<< HEAD
require "main"

function load()
  --scoreModifier
  --upgradeSpeed
  
  
end

=======
require "Main"
function load()
  end
>>>>>>> origin/Tom-G
function HalfSpeed()
      v.PosY = v.PosY + (speed / 2)
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