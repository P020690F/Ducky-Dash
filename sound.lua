module("sound", package.seeall)
require "main"

function load()
  menu = love.audio.newSource("assets/Sounds/menu.wav", "stream")
  menu:setLooping(true)
  endless = love.audio.newSource("assets/Sounds/endless.wav", "stream")
  endless:setLooping(true)
end

function play()
  if main.gamestate == "menu" and not menu:isPlaying() then
    love.audio.stop()
    love.audio.play(menu)
  end
  
  if main.gamestate == "endless" and not endless:isPlaying() then
  love.audio.stop()
  love.audio.play(endless)
  end  
end
