module("Menu", package.seeall)
require "Main"

function load()
  mainMenuPreStory = love.graphics.newImage("assets/MainMenuGreyEndless.png")
  mainMenuPostStory = love.graphics.newImage("assets/MainMenuAllYellow.png")
  backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
end

function draw()
  if ( _G.completedStory == true ) then
  love.graphics.draw(mainMenuPostStory, backgroundQuad, 0, 0)
  else
  love.graphics.draw(mainMenuPreStory, backgroundQuad, 0, 0)
  end
  
  
end  

