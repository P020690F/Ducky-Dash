module("upgrades", package.seeall)
require "main"

function load()
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
  game.duckState = "invulnerable"
end
