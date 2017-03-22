module("game", package.seeall)
require "main"
require "duckdatabase"
require "storyMenu"
require "RotatePhone"
require "VsEndScreen"
function load()
 standardduck = love.graphics.newImage("assets/Duck Skins/Standard_Duck.png")
 astronautduck = love.graphics.newImage("assets/Duck Skins/Astronaut_Duck.png")
 punkduck = love.graphics.newImage("assets/Duck Skins/Punk_Duck.png")
 duckSkin = love.graphics.newImage("assets/Duck Skins/" .. duckdatabase.currentDuck .. ".png")
 storyLevel = 0
 water = love.graphics.newImage("assets/Water.png")
 waterQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 drain = love.graphics.newImage("assets/Drain.png")
 drainQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 bathtub = love.graphics.newImage("assets/Bathtub.png")
 backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 gameover = love.graphics.newImage("assets/GameOverScreen.png")
 retryButton = love.graphics.newImage("assets/RetryButton.png")
 mainmenuButton = love.graphics.newImage("assets/MainMenuButton.png")
 buttonQuad = love.graphics.newQuad(1,1,150,150,150,150)
 scoreFont = love.graphics.newFont(20) 
 
 
 Co_OpLayout = love.graphics.newImage("assets/Co-OpLayout.png")
 Co_OpLayoutQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
 
 
 speedMultiplier = 1
 endlessScore = 0
 localScore = 0
 speed = 2.5
 objectFound = false -- used in local co op
 clickReady = true -- used in local co op to have a timer in between placing objects
 clickReadyTimer = 5 -- used in local co op to have a timer in between placing objects (both needed)
 clickDelay = 1.6
 
 bubbles= love.graphics.newImage("assets/bubbles.png")
 bubblesQuad = love.graphics.newQuad(1,1,100,100,100,100)
 
 Ducky = {
 Tex = duckSkin,
 PosX = 130,
 PosY = 350,
 Position = "middle",
 Height = 10,
 Width = 10
 }
 DuckQuad = love.graphics.newQuad(1,1,100,100,100,100)

 LeftPoint = { PosX = 50, PosY = 400 }
 MiddlePoint = { PosX = 130, PosY = 400 }
 RightPoint = { PosX = 210, PosY = 400 }
 
 duckHorizontalMove = "still"
 duckVerticalMove = "still"
 moverRot = math.pi
 
 duckLife = 2
 hit = false
 holdState = 0
 
 
 localScore = 0
 player1Score = 0
 player2Score = 0
 localRound = 1
 
 Obstacles = {}
 for i = 1, 5 do
   local tempObject = {}
   tempObject.Tex = bubbles
   tempObject.Lane = math.random(1,3) --Random Number to decide which Lane the obstacle is in
   
   if (tempObject.Lane == 1) then
     tempObject.PosX = LeftPoint.PosX
   end
   
   if (tempObject.Lane == 2) then
     tempObject.PosX = MiddlePoint.PosX
   end
   
    if (tempObject.Lane == 3) then
     tempObject.PosX = RightPoint.PosX
   end
 
   tempObject.InUse = false
   tempObject.PosY = -(i * 100)
   tempObject.Width = 10
   tempObject.Height = 10
   table.insert(Obstacles, tempObject)
 end
 
end

function drawStory()
  love.graphics.draw(bathtub, backgroundQuad, 0, 0)
  love.graphics.draw(water, waterQuad, 0, 0)
  love.graphics.draw(drain, drainQuad, 0, 0)
  love.graphics.setFont(scoreFont)
  
  for i,v in ipairs(Obstacles) do
    love.graphics.draw(v.Tex,bubblesQuad,v.PosX, v.PosY)
  end
  if duckHorizontalMove == "right" then
    love.graphics.draw(Ducky.Tex, DuckQuad, Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height, math.deg(30),1,1,Ducky.Width/2,Ducky.Height/2)
  elseif duckHorizontalMove == "left" then
     love.graphics.draw(Ducky.Tex, DuckQuad, Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height, math.deg(30),1,1,Ducky.Width/2,Ducky.Height/2)
  else
   love.graphics.draw(Ducky.Tex, DuckQuad, Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height)
  end
end

function updateStory()
  if not _G.paused then
    InAllUpdateStates()
    InBothStoryAndEndlessUpdate()
    
    if(upgrades.duckState == "vulnerable" and hit == false) then
      for i,v in ipairs(Obstacles) do
        hitTest = CheckCollision(v.PosX, v.PosY, v.Width, v.Height, Ducky.PosX, Ducky.PosY, Ducky.Width, Ducky.Height)
        if (hitTest) then
          duckLife = duckLife - 1
          if duckLife == 1  then
            duckVerticalMove = "down"  
            hit = true
            v.PosY = -100
          elseif duckLife == 0 then
            holdState = 2
            main.gamestate = "gameover"
            _G.DuckBills = _G.DuckBills + endlessScore
           
          end
          
          
        end  
      end
    end
  end
end

function drawEndless()
  love.graphics.draw(bathtub, backgroundQuad, 0, 0)
  love.graphics.draw(water, waterQuad, 0, 0)
  love.graphics.draw(drain, drainQuad, 0, 0)
  love.graphics.setFont(scoreFont)
  love.graphics.setColor(255,0,0)
  love.graphics.print("Score: ", 10, 600)
  love.graphics.print(endlessScore, 80, 600)
  love.graphics.setColor(255,255,255)
  
  for i,v in ipairs(Obstacles) do
    love.graphics.draw(v.Tex,bubblesQuad,v.PosX, v.PosY)
  end
  love.graphics.draw(Ducky.Tex, DuckQuad, Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height)
end

function updateEndless()
  if not _G.paused then
    
    InAllUpdateStates()
    InBothStoryAndEndlessUpdate()
    

    if(upgrades.duckState == "vulnerable" and hit == false) then
      for i,v in ipairs(Obstacles) do
        hitTest = CheckCollision(v.PosX, v.PosY, v.Width, v.Height, Ducky.PosX, Ducky.PosY, Ducky.Width, Ducky.Height)
        if (hitTest) then
          duckLife = duckLife - 1
          if duckLife == 1  then
            duckVerticalMove = "down"  
            hit = true
            v.PosY = -100
          elseif duckLife == 0 then
            holdState = 1
            main.gamestate = "gameover"
            _G.DuckBills = _G.DuckBills + endlessScore
            
          end
        
        end  
      end
    end
  end
end

function drawLocal()
  love.graphics.draw(bathtub, backgroundQuad, 0, 0)
  love.graphics.draw(water, waterQuad, 0, 0)
  love.graphics.draw(drain, drainQuad, 0, 0)
  love.graphics.draw(Co_OpLayout,Co_OpLayoutQuad,0,0)
  love.graphics.setFont(scoreFont)
  love.graphics.setColor(255,0,0)
  love.graphics.print("Score: ", 10, 600)
  love.graphics.print(localScore, 80, 600)
  love.graphics.setColor(255,255,255)
  -- wanna draw the new layout for co op mode
  
  for i,v in ipairs(Obstacles) do
    love.graphics.draw(v.Tex,bubblesQuad,v.PosX, v.PosY)
  end
  love.graphics.draw(Ducky.Tex, DuckQuad, Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height)
end

function updateLocal()
  if not _G.paused then
    
    upgrades.Update()
    InAllUpdateStates()
    if localScore >= 10 and localScore % 10 == 0 then
      speed = localScore / 20 + 2.5
    end
    
    for i,v in ipairs(Obstacles) do
      if (v.InUse == true) then
        v.PosY = v.PosY + (speed * speedMultiplier)
      end
      if v.PosY > 500 then
        v.InUse = false
        v.PosY = -(i * 100)
        localScore = localScore + 1
      end
    end
    
    if(upgrades.duckState == "vulnerable" and hit == false) then
      for i,v in ipairs(Obstacles) do
        hitTest = CheckCollision(v.PosX, v.PosY, v.Width, v.Height, Ducky.PosX, Ducky.PosY, Ducky.Width, Ducky.Height)
        if (hitTest) then
          duckLife = duckLife - 1
          if duckLife == 1  then
            duckVerticalMove = "down"  
            hit = true
            v.PosY = -100
          elseif duckLife == 0 then
            if(localRound == 1) then
              player1Score = localScore
              localRound = 2
              
            elseif (localRound == 2) then
              player2Score = localScore
              localRound = 3
          end
          if (localRound == 2) then
            RotatePhone.load()
            main.gamestate = "localSwitch" -- LocalIntermidiateStage
            VsEndScreen.player1Score = player1Score
            
          elseif (localRound == 3) then
            main.gamestate = "coopend" 
            VsEndScreen.player2Score = player2Score
          end
          end         
        end  
      end
    end
  end
end

function drawGameOver()
  love.graphics.draw(gameover, backgroundQuad, 0, 0)
  love.graphics.draw(retryButton, buttonQuad, 30, 475)
  love.graphics.draw(mainmenuButton, buttonQuad, 200, 475)
end  

function mousepressed(x,y,button,istouch)
  clickLocations(x,y)
end

function touchpressed(id,x,y,sw,sh,pressure)
  clickLocations(x,y)
end

function clickLocations (x,y)
  if (Ducky.Position == "left" and x > Ducky.PosX and y > 270) then
    Ducky.Position = "middle"
    duckHorizontalMove = "right"
  elseif (Ducky.Position == "right" and x < Ducky.PosX and y > 270) then
    Ducky.Position = "middle"
    duckHorizontalMove = "left"
  elseif (Ducky.Position == "middle") then
    if (x < Ducky.PosX  and y > 270) then
      Ducky.Position = "left"
      duckHorizontalMove = "left"
    elseif (x > Ducky.PosX and y > 270) then
      Ducky.Position = "right"
      duckHorizontalMove = "right"
    end
  end

  if x>= 40 and x < 127 and y >= 1 and y < 200 and main.gamestate == "local" and        clickReady == true then
    -- place object in position left
    objectfound = false
    for i,v in ipairs(Obstacles) do
      if (v.InUse == false and objectfound == false) then 
        v.Lane = 1
        v.PosY = -20
        v.InUse = true
        objectfound = true
        clickReady = false
        clickReadyTimer = 5
      end
    end
  end

  if x>= 128 and x < 220 and y >= 1 and y < 200 and main.gamestate == "local" and clickReady == true then
    -- place object in position middle
    objectfound = false
    for i,v in ipairs(Obstacles) do
      if (v.InUse == false and objectfound == false) then
        v.Lane = 2
        v.PosY = -20
        v.InUse = true
        objectfound = true
        clickReady = false
        clickReadyTimer = 5
      end
    end
  end
  
    if x>= 220 and x < 301 and y >= 1 and y < 200 and main.gamestate == "local" and clickReady == true then
      -- place object in position right
      objectfound = false
      for i,v in ipairs(Obstacles) do
        if (v.InUse == false and objectfound == false) then
          v.Lane = 3
          v.PosY = -20
          v.InUse = true
          objectfound = true
          clickReady = false
        clickReadyTimer = 5
        end
      end
    end

  objectFound = false

  if (clickReady == false) then
    clickReadyTimer = clickReadyTimer - clickDelay
  end
  
  if (clickReadyTimer <= 0) then
   -- main.gamestate = "endless"
       clickReady = true
  end  

  for i,v in ipairs(Obstacles) do
      if (v.Lane == 1) then
         v.PosX = LeftPoint.PosX
      end
       
      if (v.Lane == 2) then
         v.PosX = MiddlePoint.PosX
      end
       
      if (v.Lane == 3) then
         v.PosX = RightPoint.PosX
      end
  end 
  -- end of local co op code }
  
  --game over
  if x >= 30 and x < 180 and y >= 475 and y < 625 and main.gamestate == "gameover" then
    
    if holdState == 1 then
      main.gamestate = "endless" 
    elseif holdState == 2 then
      main.gamestate = "story"
    end
    game.load()
  elseif x >= 200 and x < 350 and y >= 475 and y < 625 and main.gamestate == "gameover" then
    main.gamestate = "menu"
  end
  
  --pause
  if (x > 644/2 and y > 1239/2 and x < 695/2 and y < 1311 and main.gamestate ~= "gameover") then
    _G.paused = true
  end
end


function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function InAllUpdateStates()
  if duckHorizontalMove == "left" then
    if Ducky.Position == "left" then
      Ducky.PosX = Ducky.PosX - 5       
      if Ducky.PosX == 50 then
        duckHorizontalMove = "still"          
      end
    elseif Ducky.Position == "middle" then
      Ducky.PosX = Ducky.PosX - 5      
      if Ducky.PosX == 130 then
        duckHorizontalMove = "still"        
      end
    end 
  end
  if duckHorizontalMove == "right" then
    if Ducky.Position == "right" then
        Ducky.PosX = Ducky.PosX + 5
      if Ducky.PosX == 210 then
        duckHorizontalMove = "still"
      end
    elseif Ducky.Position == "middle" then
        Ducky.PosX = Ducky.PosX + 5
        
      if Ducky.PosX == 130 then
        duckHorizontalMove = "still"
      end
    end 
  end
    
    if duckVerticalMove == "down" then
      if duckLife == 1 then
        Ducky.PosY =  Ducky.PosY + 5
        if Ducky.PosY == 400 then
          duckVerticalMove = "still"
          hit = false
        end
      end
    end
    if duckVerticalMove == "up" then     
      Ducky.PosY =  Ducky.PosY - 5
      if Ducky.PosY == 350 then
        duckVerticalMove = "still"
      end
    end
end

function InBothStoryAndEndlessUpdate()
  if endlessScore >= 5 and endlessScore % 5 == 0 then
          speed = endlessScore / 20 + 2.5
          upgrades.SpawnUpgrade()
      end
      
      if (upgrades.speedState == "halfSpeed") then
        speedMultiplier = 0.5
      else
        speedMultiplier = 1
      end
    
  for i,v in ipairs(Obstacles) do
      v.PosY = v.PosY + (speed * speedMultiplier)
        
    if v.PosY > 500 then
         v.Lane = math.random(1,3)
      if (v.Lane == 1) then
        v.PosX = LeftPoint.PosX
      end
      if (v.Lane == 2) then
        v.PosX = MiddlePoint.PosX
      end
      if (v.Lane == 3) then
        v.PosX = RightPoint.PosX
      end
         
         v.PosY = -(i * 100)
          
          endlessScore = endlessScore + 1
    end
  end
end