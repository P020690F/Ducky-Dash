module("Sound", package.seeall)
require "Main"

function load()
  menu = love.audio.newSource("assets/menu.wav", "stream")
  menu:setLooping(true)
  endless = love.audio.newSource("assets/endless.wav", "stream")
  endless:setLooping(true)
end

function play()
  if Main.gamestate == "menu" then
    love.audio.stop() 
    love.audio.play(menu)
  end
  
  if Main.gamestate == "endless" then
  love.audio.stop()
  love.audio.play(endless)
  end  
end
