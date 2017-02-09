module("Main", package.seeall)
require "Game"
require "Menu"
require "Sound"

function love.load()
   gamestate = "endless"
  Sound.load()
  Sound.play()
  
  screenWidth = 720/2
  screenHeight = 1280/2

  if love.system.getOS() == "Android" then
    local x,y = love.graphics.getDimensions()
    scalex = (x/screenWidth)
    scaley = (y/screenHeight)
  else
    scalex = 1
    scaley = 1
  end
  love.window.setMode(screenWidth * scalex, screenHeight * scaley)
  end

function love.draw()
  love.graphics.scale(scalex, scaley)
end

