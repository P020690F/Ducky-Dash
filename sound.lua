module("sound", package.seeall)
require "main"

function load()
  menu = love.audio.newSource("assets/Sounds/menu.wav", "stream")
  menu:setLooping(true)
  endless = love.audio.newSource("assets/Sounds/endless.wav", "stream")
  endless:setLooping(true)
end

function play()
  if main.gamestate == "menu" then
    love.audio.stop() 
    love.audio.play(menu)
  end
  
  if main.gamestate == "endless"then
  love.audio.stop()
  love.audio.play(endless)
end
  
  if main.gamestate == "story" then
  love.audio.stop()
  love.audio.play(endless)
end

  if main.gamestate == "gameover" then
  love.audio.stop()
  love.audio.play(menu)
  end  
end
