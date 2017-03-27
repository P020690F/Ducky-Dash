module("settingspage", package.seeall)
require "main"
require "game"
require "sound"

function load()
  settingsFont = love.graphics.newFont(20)
  settingsImg = love.graphics.newImage("assets/Settings_Button.png")
  mainImg = love.graphics.newImage("assets/Close_Button.png")
  
  sliderBaseImg = love.graphics.newImage("assets/SliderBase.png")
  sliderImg = love.graphics.newImage("assets/Slider.png")
  
  buttonQuad = love.graphics.newQuad(1,1,500/2,500/2,500/2,500/2)
  baseQuad = love.graphics.newQuad(1,1,295,60,295,60)
  sliderQuad = love.graphics.newQuad(1,1,40,40,40,40)
  
  sliderXPos = (263) --min 70 max 263
  effectSliderXPos = 263
end

function draw()  
  love.graphics.draw(settingsImg, buttonQuad, 125/2 ,-20)
  love.graphics.draw(mainImg, buttonQuad, 125/2 ,750/2)
  
  love.graphics.setFont(settingsFont)
  love.graphics.print("Music", 150 , 180)
  love.graphics.draw(sliderBaseImg, baseQuad,40,200)
  love.graphics.print("SFX", 150 , 330)
  love.graphics.draw(sliderBaseImg, baseQuad,40,350)
  
  love.graphics.draw(sliderImg, sliderQuad,effectSliderXPos, 360)
  love.graphics.draw(sliderImg, sliderQuad,sliderXPos, 210)
  
end

function mousepressed(x,y,button, istouch)
  clickLocations(x,y) 
end

function touchpressed(id,x,y,sw,sh,pressure)
  clickLocations(x,y)
end

function clickLocations(x,y)
  if (x > 85 and x < 288 and y > 446 and y < 552) then
      --close settings
      sound.playSqueak()
      _G.settings = false  
  end
  
  --Music Volume
  if (x > 40 and x < 335 and y > 199 and y < 260) then
      --close settings
    sliderXPos = x
    if (x < 90) then
      sliderXPos = 70
    end
    if (x > 284) then
      sliderXPos = 263
    end
    
    _G.musicVolume = ((sliderXPos - 70) / (263-70))
    sound.updateMusic(_G.musicVolume)
    
  end
  --Effect Volume
  if (x > 40 and x < 335 and y > 349 and y < 410) then
      --close settings
    effectSliderXPos = x
    if (x < 90) then
      effectSliderXPos = 70
    end
    if (x > 284) then
      effectSliderXPos = 263
    end
    
    _G.musicVolume = ((effectSliderXPos - 70) / (263-70))
    sound.updateEffect(_G.musicVolume)    
  end
end