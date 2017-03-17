module("store", package.seeall)
require "main"
require "duckdatabase"

function load()
  --background placeholder
  bathtub = love.graphics.newImage("assets/Bathtub.png")
  
  leftDuck = love.graphics.newImage("assets/Duck Skins/Punk_Duck_Front.png")
  rightDuck = love.graphics.newImage("assets/Duck Skins/Punk_Duck_Front.png")
  middleDuck = love.graphics.newImage("assets/Duck Skins/Punk_Duck_Front.png")
  
  ArrowLeft = love.graphics.newImage("assets/LeftArrow.png")
  ArrowRight = love.graphics.newImage("assets/RightArrow.png")
  
  mainImg = love.graphics.newImage("assets/MainMenuButton.png")
  PowerUpImg = love.graphics.newImage("assets/Power_Ups_Button.png")
  selectImg = love.graphics.newImage("assets/Select_Button.png")
  buyImg = love.graphics.newImage("assets/Buy_Button.png")
  DuckStoreImg = love.graphics.newImage("assets/Duck_Button.png")
  DuckBillsImg = love.graphics.newImage("assets/Money.png")
  
  storeFont = love.graphics.newFont(15)
  
  mainButtonQuad = love.graphics.newQuad(1,1,250/2,250/2,250/2,250/2)
  DuckBillQuad = love.graphics.newQuad(1,1,250/2,250/2,250/2,250/2)
  ArrowQuad = love.graphics.newQuad(1,1,75,75,75,75)
  backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
  smallDuckQuad = love.graphics.newQuad(1,1,150/2,150/2,150/2,150/2)
  centreDuckQuad = love.graphics.newQuad(1,1,450/2,450/2,500/2,500/2)
  
  storeState = "Duck"

  lookingAtDuck = 1
  cycleSkins()
  
end

function updateStore()
 
end


function drawStoreHub()
  love.graphics.draw(bathtub, backgroundQuad, 0, 0)
  love.graphics.draw(mainImg, mainButtonQuad,10, 550)
  love.graphics.draw(DuckBillsImg, DuckBillQuad,250,-15)
  love.graphics.setColor(0,255,0)
  love.graphics.setFont(storeFont)
  love.graphics.print("Duck Bills: " .. _G.DuckBills, 265,70)
  love.graphics.setColor(255,255,255) 
   
  --xstring = ("asd" and love.mouse.getX())
  --ystring = ("asd" and love.mouse.getY())
  --love.graphics.setColor(255,0,0)
  --love.graphics.print(xstring, 120,100)
  --love.graphics.print(ystring, 120,150)
  --love.graphics.setColor(255,255,255)  
  
  if (storeState == "Duck") then
    drawDuckSelect()
  end
  
  if (storeState == "PowerUp") then
    drawPowerUpStore()
  end
end
function clickStoreHub(x,y,button,istouch)

  if(x > 20 and x  < 120 and y > 585 and  y < 635) then
   
    main.gamestate = "menu"
  end
  
  if(x > 20 and x  < 120 and y > 15 and  y < 65) then
    
    if (storeState == "Duck") then
      storeState = "PowerUp"
    
    elseif (storeState == "PowerUp") then
      storeState = "Duck"
    end
  end
  
if (storeState == "Duck") then
    clickDuckSelect(x,y,button,istouch)
  end
  
  if (storeState == "PowerUp") then
   clickPowerUpStore(x,y,button,istouch)
  end

end
function pressStoreHub(id,x,y,sw,sh,pressure)

--need to create functions
end
function drawDuckSelect()
  love.graphics.setColor(255,0,0)
  love.graphics.print(duckdatabase.currentDuck, 135, 445)
  love.graphics.setColor(255,255,255)
  
  love.graphics.draw(middleDuck, centreDuckQuad, 125/2 ,225)
  love.graphics.draw(PowerUpImg, mainButtonQuad, 10 ,-20)
  
  if(duckdatabase.returnDuckOwnership(lookingAtDuck)) then
  
    if (duckdatabase.getDuckByNumber(lookingAtDuck) == duckdatabase.currentDuck) then
      love.graphics.setColor(111,111,111)
    end
    love.graphics.draw(selectImg, mainButtonQuad, 125 ,430)
    love.graphics.setColor(255,255,255)
  else
    love.graphics.draw(buyImg, mainButtonQuad, 125 ,430)
    love.graphics.setColor(0,255,0)
    love.graphics.print("500",175,520)
    love.graphics.setColor(255,255,255)
  end
  
  --smaller behind ducks
  love.graphics.setColor(113,113,133)
  love.graphics.draw(leftDuck, smallDuckQuad, 100/2 ,250/2)
  love.graphics.draw(rightDuck, smallDuckQuad, 500/2 ,250/2)
  love.graphics.setColor(255,255,255)
  
  love.graphics.draw(ArrowLeft, ArrowQuad, 20,900/2)
  love.graphics.draw(ArrowRight, ArrowQuad, (750-100)/2 -45,900/2)
  
end  
function drawPowerUpStore()
  love.graphics.draw(DuckStoreImg, mainButtonQuad, 10 ,-20)
  
  
end



function clickDuckSelect(x,y,button,istouch)
  --duck arrows
  if(x > 20 and x  < 95 and y > 450 and  y < 525) then
    lookingAtDuck = lookingAtDuck + 1
   
    if (lookingAtDuck > duckdatabase.numDucks) then
      lookingAtDuck = 1
    end
    
   cycleSkins()
  end  
  if(x > 280 and x  < 355 and y > 450 and  y < 525) then
   lookingAtDuck = lookingAtDuck - 1
   
    if (lookingAtDuck == 0) then
      lookingAtDuck = duckdatabase.numDucks
    end
   
    cycleSkins()
  end 
  
  if(x > 135 and x  < 235 and y > 463 and  y < 510) then
    --grey out duck select button when selected
    --output message if not have enough duck bills
    if(duckdatabase.returnDuckOwnership(lookingAtDuck)) then
      --select current duck
      duckdatabase.currentDuck = duckdatabase.getDuckByNumber(lookingAtDuck)
    elseif not (duckdatabase.returnDuckOwnership(lookingAtDuck)) then
      --buy duck
      --need to decide if ducks cost different amounts
      --if(duckdatabase.duckBills >= duckdatabase.duckCost(lookingAtDuck)) then
      if(_G.DuckBills >= 500) then
        --duckdatabase.duckBills = duckdatabase.duckBills - duckdatabase.duckCost(lookingAtDuck)
        _G.DuckBills = _G.DuckBills - 500
        duckdatabase.buyDuck(lookingAtDuck)
        duckdatabase.currentDuck = duckdatabase.getDuckByNumber(lookingAtDuck)
      end
    end
    
  end
  
end
function clickPowerUpStore(x,y,button,istouch)
 
end
function cycleSkins()
  numDuckLeft = lookingAtDuck - 1
  numDuckRight = lookingAtDuck + 1
  if (numDuckLeft == 0) then
    numDuckLeft = duckdatabase.numDucks
  end
  if (numDuckRight > duckdatabase.numDucks) then
    numDuckRight = 1
  end
    leftDuck = null
    rightDuck = null
    middleDuck = null
    collectgarbage()
  leftDuck = love.graphics.newImage("assets/Duck Skins/" .. duckdatabase.getDuckByNumber(numDuckLeft) .. "_Front.png")
  middleDuck = love.graphics.newImage("assets/Duck Skins/" .. duckdatabase.getDuckByNumber(lookingAtDuck) .. "_Front.png")
  rightDuck = love.graphics.newImage("assets/Duck Skins/" .. duckdatabase.getDuckByNumber(numDuckRight) .. "_Front.png")
end
