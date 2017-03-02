module("Store", package.seeall)
require "main"

function load()
  bathtub = love.graphics.newImage("assets/Bathtub.png")
  PDFront = love.graphics.newImage("assets/Duck Skins/Punk_Duck_Front.png")
  backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)

  
  smallDuckQuad = love.graphics.newQuad(1,1,150/2,150/2,150/2,150/2)
  centreDuckQuad = love.graphics.newQuad(1,1,450/2,450/2,500/2,500/2)
  
  storeState = "Duck"


end

function drawStoreHub()
  
  if (storeState == "Duck") then
    drawDuckSelect()
  end
  
  if (storeState == "PowerUp") then
    drawPowerUpStore()
  end
end

function clickStoreHub()


end

function pressStoreHub(id,x,y,sw,sh,pressure)


end




function drawDuckSelect()
  love.graphics.draw(bathtub, backgroundQuad, 0, 0)
  love.graphics.draw(PDFront, centreDuckQuad, 125/2 ,450/2)
  
  --smaller behind ducks
  love.graphics.setColor(113,113,133)
  love.graphics.draw(PDFront, smallDuckQuad, 100/2 ,250/2)
  love.graphics.draw(PDFront, smallDuckQuad, 500/2 ,250/2)
  love.graphics.setColor(255,255,255)
  
  
end  

function drawPowerUpStore()
love.graphics.draw(bathtub, backgroundQuad, 0, 0)
end

function updateStore()

end