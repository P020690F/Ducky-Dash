module("sound", package.seeall)
require "main"

function load()
  menu = love.audio.newSource("assets/Sounds/menu.wav", "stream")
  menu:setLooping(true)
  endless = love.audio.newSource("assets/Sounds/endless.wav", "stream")
  endless:setLooping(true)
  cutscene = love.audio.newSource("assets/Sounds/cutscene.wav", "stream")
  cutscene:setLooping(true)
  squeak = love.audio.newSource("assets/Sounds/squeak.wav", "static")
  cySqueak = love.audio.newSource("assets/Sounds/cySqueak.wav", "static")
end

function play()
  if main.gamestate == "menu" and not menu:isPlaying() and not squeak:isPlaying() then
    love.audio.stop()
    love.audio.play(menu)
  end
  
  if main.gamestate == "endless" and not endless:isPlaying() then
    love.audio.stop()
    love.audio.play(endless)
  end
  
  if main.gamestate == "story" and not endless:isPlaying()then
    love.audio.stop()
    love.audio.play(endless)
  end

  if main.gamestate == "gameover" and not menu:isPlaying() and not squeak:isPlaying() and not cySqueak:isPlaying() then
    love.audio.stop()
    love.audio.play(menu)
  end  

  if main.gamestate == "local" and not endless:isPlaying()then
    love.audio.stop()
    love.audio.play(endless)
  end
  
    if main.gamestate == "cutscene" and not cutscene:isPlaying()then
    love.audio.stop()
    love.audio.play(cutscene)
  end
end

function updateMusic(v)
  menu:setVolume(v)
  endless:setVolume(v)
end

function updateEffect(v)
  squeak:setVolume(v)
end

function playSqueak()
  love.audio.play(squeak)
end  

function playCy()
  love.audio.play(cySqueak)
end  
