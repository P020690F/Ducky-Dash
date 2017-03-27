module("RotatePhone", package.seeall)
require "main"
require "game"

function load()
  story4 = love.graphics.newImage("assets/level_select_4.png") 
  backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
  
  asdf = love.graphics.newImage("assets/Continue_button.png")
  buttonQuad = love.graphics.newQuad(1,1,200,200,200,200)
  
  phoneImg = love.graphics.newImage("assets/Phone.png")
  phoneQuad = love.graphics.newQuad(1,1,200,300,200,300)
  
  rotate = 0
  turnTick = 0
end

function draw()
    --what background do we want
   -- love.graphics.draw(story4, backgroundQuad, 0, 0)
    --placeholder button
    love.graphics.draw(asdf, buttonQuad,100,500)
    
    --text for both player, need to rotate text for top of screen
    love.graphics.print("rotate phone to swap roles",60,100,math.rad(180),1,1,266,5)
    love.graphics.print("rotate phone to swap roles",60,500)
 
    love.graphics.draw(phoneImg, phoneQuad,200,300,math.rad(rotate),1,1,100,150)
end  
function update()
  if rotate < 180 then
    rotate = rotate + 1
  else
    turnTick = turnTick + 1
  end
  if turnTick >= 100 then
    rotate = 0
    turnTick = 0
  end
  
end
function mousepressed(x,y,button,istouch)
    clickLocations(x,y)
end
function touchpressed(id,x,y,sw,sh,pressure)
  clickLocations(x,y) 
end

function clickLocations(x,y)
  
  if (x > 117 and x < 276 and y > 558 and y < 636) then
    game.load()
    main.gamestate = "local"
    game.localRound = 2
  end
  
 
end