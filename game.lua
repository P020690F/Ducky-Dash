module("game", package.seeall)
require "main"
require "DuckDataBase"
require "storyMenu"
require "upgrades"
require "RotatePhone"
require "VsEndScreen"

function load()
  collectgarbage()
  upgrades.load()
  duckSkin = DuckDataBase.getSpriteByCurrentDuck()
  if(imagaeloader == nil) then
   endstory = love.graphics.newImage("assets/level_end_screen.png")
   water = love.graphics.newImage("assets/Water.png")
   bathtub = love.graphics.newImage("assets/Bathtub.png")
   parkImg = love.graphics.newImage("assets/Park_Level.png")
   rainbowImg = love.graphics.newImage("assets/Rainbow_Level.png")
   backgroundQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
   gameover = love.graphics.newImage("assets/GameOverScreen.png")
   retryButton = love.graphics.newImage("assets/RetryButton.png")
   mainmenuButton = love.graphics.newImage("assets/MainMenuButton.png")
   continueButton = love.graphics.newImage("assets/Continue_Button.png")
   buttonQuad = love.graphics.newQuad(1,1,150,150,150,150)
   scoreBG = love.graphics.newImage("assets/ScoreBox.png")
   scoreQuad = love.graphics.newQuad(1,1,125,100,125,100)
   gameOverTextQuad = love.graphics.newQuad(1,1,350,300,350,300)
   scoreFont = love.graphics.newFont(20) 
    overFont = love.graphics.newFont(17) 
   
   Co_OpLayout = love.graphics.newImage("assets/Co-OpLayout.png")
   Co_OpLayoutQuad = love.graphics.newQuad(1,1,750/2,1337/2,750/2,1337/2)
   
   duckFrames = {}
   duckFrames[1] = love.graphics.newQuad(0,0,100,100,duckSkin:getDimensions())
   duckFrames[2] = love.graphics.newQuad(100,0,100,100,duckSkin:getDimensions())
   duckFrames[3] = love.graphics.newQuad(200,0,100,100,duckSkin:getDimensions())
   
   waterFrames = {}
   waterFrames[1] = love.graphics.newQuad(0,0,375,669,water:getDimensions())
   waterFrames[2] = love.graphics.newQuad(375,0,375,669,water:getDimensions())
   waterFrames[3] = love.graphics.newQuad(750,0,375,669,water:getDimensions())
   waterFrames[4] = love.graphics.newQuad(1125,0,375,669,water:getDimensions())
   
   bubbles = love.graphics.newImage("assets/bubbles.png")
   shampoo = love.graphics.newImage("assets/shampoo.png")
   soap = love.graphics.newImage("assets/soap.png")
   submarine = love.graphics.newImage("assets/submarine.png")
   kids_shampoo = love.graphics.newImage("assets/kids_shampoo.png")
   bubblesQuad = love.graphics.newQuad(1,1,100,100,100,100)
    
   smallQuad = love.graphics.newQuad(1,1,50,50,50,50)
   BlankQuad = love.graphics.newQuad(0,0,0,0,0,0)
 end
 
 math.randomseed(os.time())
 
 obstacleReset = 500
 
 currentDuckFrame = 2
 currentWaterFrame = 1
 timer = 0
 storyLevel = 0
 speedMultiplier = 1
 endlessScore = 0
 localScore = 0
 speed = 2.5
 objectFound = false -- used in local co op
 clickReady = true -- used in local co op to have a timer in between placing objects
 clickReadyTimer = 5 -- used in local co op to have a timer in between placing objects (both needed)
 clickDelay = 1.6
 imagaeloader = false
 MoveToDrain = false
 SpinRotate = 0
 OriginSpin = 0
 StepRight = true
 
 startx = nil
 endx = 0
 
 Ducky = {
 Tex = duckSkin,
 PosX = 130,
 PosY = 350,
 Position = "middle",
 Height = 10,
 Width = 10
 }

 LeftPoint = { PosX = 50, PosY = 400 }
 MiddlePoint = { PosX = 130, PosY = 400 }
 RightPoint = { PosX = 210, PosY = 400 }
 
 duckHorizontalMove = "still"
 duckVerticalMove = "still"
 moverRot = math.pi
 
 duckLife = 3
 hit = false
 holdState = 0
 
 localScore = 0
 player1Score = 0
 player2Score = 0
 localRound = 1
 
 Obstacles = {}
 for i = 1, 5 do
   local tempObject = {}
  
   tempObject.Lane = math.random(1,3) --Random Number to decide which Lane the obstacle is in
   tempObject.TexNumber = math.random(1,5)
   
   if(tempObject.TexNumber == 1) then
     tempObject.Tex = bubbles
   elseif (tempObject.TexNumber == 2) then
     tempObject.Tex = shampoo
    elseif (tempObject.TexNumber == 3) then
      tempObject.Tex = soap
    elseif (tempObject.TexNumber == 4) then
      tempObject.Tex = kids_shampoo
    elseif (tempObject.TexNumber == 5) then
      tempObject.Tex = submarine
    end
   
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
   tempObject.PosY = -(i * 150)
   tempObject.Width = 50
   tempObject.Height = 50
   tempObject.Collidable = true
   table.insert(Obstacles, tempObject)
 end
end

function drawStory()
  love.graphics.draw(bathtub, backgroundQuad, 0, 0)
  love.graphics.draw(water, waterFrames[currentWaterFrame], 0, 0)
  love.graphics.setFont(scoreFont)
  
  for i,v in ipairs(Obstacles) do
    if (v.Collidable == true) then
    love.graphics.draw(v.Tex,bubblesQuad,v.PosX, v.PosY)
    elseif (v.Collidable == false) then
    love.graphics.draw(v.Tex,BlankQuad,v.PosX, v.PosY)
    end
  end
  love.graphics.draw(Ducky.Tex, duckFrames[currentDuckFrame], Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height,math.deg(SpinRotate),1,1,OriginSpin,OriginSpin)
end

function updateStory()
  if not _G.paused then
    if (storyLevel == 1 and endlessScore >= 20) then
      if (_G.storyLevel == 1) then
        _G.storyLevel = 2
      end
      main.gamestate = "finishStoryLevel"
    elseif (storyLevel == 2 and endlessScore >= 40) then
      if (_G.storyLevel == 2) then
        _G.storyLevel = 3
      end
        main.gamestate = "finishStoryLevel"
    elseif (storyLevel == 3 and endlessScore >= 60) then
      if (_G.storyLevel == 3) then
        _G.storyLevel = 4
      end
        main.gamestate = "finishStoryLevel"
    end
    if MoveToDrain then
      spinTowardsDrain()
    else
      InAllUpdateStates()
      InBothStoryAndEndlessUpdate()
      
      if(upgrades.duckState == "vulnerable" and hit == false) then
        for i,v in ipairs(Obstacles) do
          hitTest = CheckCollision(v.PosX, v.PosY, v.Width, v.Height, Ducky.PosX, Ducky.PosY, Ducky.Width, Ducky.Height)
          if (hitTest and v.Collidable == true) then
            duckLife = duckLife - 1
            if DuckDataBase.currentDuck == "Cy_Duck" then
                sound.playCy()
            else  
                sound.playSqueak()
            end
            if duckLife == 2  then
              duckVerticalMove = "down"  
              hit = true
              v.Collidable = false
            elseif duckLife == 1  then
              duckVerticalMove = "down"  
              hit = true
              v.Collidable = false
            elseif duckLife == 0 then
              holdState = 2
              MoveToDrain = true      
              sound.play()
              _G.DuckBills = _G.DuckBills + endlessScore
            end
          end  
        end
      end
    end
  end  
end

function drawEndless()
  if (DuckDataBase.currentBackground == "Bath") then
    love.graphics.draw(bathtub, backgroundQuad, 0, 0)
    love.graphics.draw(water, waterFrames[currentWaterFrame], 0, 0)
  elseif (DuckDataBase.currentBackground == "Park") then
    love.graphics.draw(parkImg, backgroundQuad, 0, 0)
  elseif (DuckDataBase.currentBackground == "Rainbow") then
    love.graphics.draw(rainbowImg, backgroundQuad, 0, 0)
  end
  love.graphics.draw(scoreBG,scoreQuad, 5, 563)
  love.graphics.setFont(scoreFont)
  love.graphics.setColor(255,0,0)
  love.graphics.print("Score: ", 10, 600)
  
   --[[ for i,v in ipairs(Obstacles) do
  love.graphics.print("Obj " .. i .. ":" .. v.PosY, 10 , 50 * i)  -- debug obstacle positions
  end --]]
  love.graphics.print(endlessScore, 80, 600)
  love.graphics.setColor(255,255,255)
  --love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 100, 10)
  
  for i,v in ipairs(Obstacles) do
    if (v.Collidable == true) then
    love.graphics.draw(v.Tex,bubblesQuad,v.PosX, v.PosY)
    elseif (v.Collidable == false) then
    love.graphics.draw(v.Tex,BlankQuad,v.PosX, v.PosY)
    end
  end
  
  love.graphics.draw(Ducky.Tex, duckFrames[currentDuckFrame], Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height,math.deg(SpinRotate),1,1,OriginSpin,OriginSpin)
  upgrades.Draw()
end

function updateEndless()
  if not _G.paused then
    if MoveToDrain then
      spinTowardsDrain()
    else
      InAllUpdateStates()
      InBothStoryAndEndlessUpdate()
      
      if(upgrades.duckState == "vulnerable" and hit == false) then
        for i,v in ipairs(Obstacles) do
          hitTest = CheckCollision(v.PosX, v.PosY, v.Width, v.Height, Ducky.PosX, Ducky.PosY, Ducky.Width, Ducky.Height)
          if (hitTest and v.Collidable == true) then
            duckLife = duckLife - 1
             if DuckDataBase.currentDuck == "Cy_Duck" then
                sound.playCy()
            else  
                sound.playSqueak()
            end
            if duckLife == 2  then
              duckVerticalMove = "down"  
              hit = true
              v.Collidable = false
            elseif duckLife == 1  then
              duckVerticalMove = "down"  
              hit = true
              v.Collidable = false
            elseif duckLife == 0 then
              holdState = 1
              MoveToDrain = true
              sound.play()
              _G.DuckBills = _G.DuckBills + endlessScore
            end
          end    
        end
      end
    end
  end
end

function drawLocal()
  if (DuckDataBase.currentBackground == "Bath") then
    love.graphics.draw(bathtub, backgroundQuad, 0, 0)
    love.graphics.draw(water, waterFrames[currentWaterFrame], 0, 0)
  elseif (DuckDataBase.currentBackground == "Park") then
    love.graphics.draw(parkImg, backgroundQuad, 0, 0)
  elseif (DuckDataBase.currentBackground == "Rainbow") then
    love.graphics.draw(rainbowImg, backgroundQuad, 0, 0)
  end
  love.graphics.draw(Co_OpLayout,Co_OpLayoutQuad,0,0)
  love.graphics.draw(scoreBG,scoreQuad, 5, 563)
  love.graphics.setFont(scoreFont)
  love.graphics.setColor(255,0,0)
  love.graphics.print("Score: ", 10, 600)
  love.graphics.print(localScore, 80, 600)
  love.graphics.setColor(255,255,255)
  -- wanna draw the new layout for co op mode
  
 
  objectfound = false
  for i,v in ipairs(Obstacles) do
    love.graphics.draw(v.Tex,bubblesQuad,v.PosX, v.PosY)
    
        if (v.InUse == false and objectfound == false) then 
         objectfound = true
         love.graphics.draw(v.Tex,smallQuad,312, 80)
        end
  end
  love.graphics.draw(Ducky.Tex, duckFrames[currentDuckFrame], Ducky.PosX - Ducky.Width, Ducky.PosY - Ducky.Height,math.deg(SpinRotate),1,1,OriginSpin,OriginSpin)
end

function updateLocal()
  if not _G.paused then
    if MoveToDrain then
      spinTowardsDrain()
    else
      InAllUpdateStates()
      
      if localScore >= 10 and localScore % 10 == 0 then
        speed = localScore / 20 + 2.5
      end
        for i,v in ipairs(Obstacles) do
          if (v.InUse == true) then
            v.PosY = v.PosY + (speed * speedMultiplier)
          end
          if v.PosY > obstacleReset then
            v.InUse = false
            
            v.TexNumber = math.random(1,5)
            if(v.TexNumber == 1) then
              v.Tex = bubbles
            elseif (v.TexNumber == 2) then
              v.Tex = shampoo
            elseif (v.TexNumber == 3) then
              v.Tex = soap
            elseif (v.TexNumber == 4) then
              v.Tex = kids_shampoo
            elseif (v.TexNumber == 5) then
              v.Tex = submarine
            end
            v.PosY = -(i * 100)
            localScore = localScore + 1
          end
        end
      
      if(upgrades.duckState == "vulnerable" and hit == false) then
        for i,v in ipairs(Obstacles) do
          hitTest = CheckCollision(v.PosX, v.PosY, v.Width, v.Height, Ducky.PosX, Ducky.PosY, Ducky.Width, Ducky.Height)
          if (hitTest) then
            duckLife = duckLife - 1
            if DuckDataBase.currentDuck == "Cy_Duck" then
                sound.playCy()
            else  
                sound.playSqueak()
            end
            if duckLife == 2  then
              duckVerticalMove = "down"  
              v.InUse = false
              hit = true
              v.PosY = -100
            elseif duckLife == 1  then
              duckVerticalMove = "down"  
              hit = true
              v.InUse = false
              v.PosY = -100
            elseif duckLife == 0 then
              MoveToDrain = true
              if(localRound == 1) then
                player1Score = localScore
                localRound = 2
                
              elseif (localRound == 2) then
                player2Score = localScore
                localRound = 3
              end
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
  love.graphics.print("Score: " .. endlessScore,200,200)
  love.graphics.draw(scoreBG,gameOverTextQuad,15,300)
  AddFact()
end  

function mousepressed(x,y,button,istouch)
  clickLocations(x,y)
  
  -- store x
  startx = x
end

function mousereleased(x,y,button, istouch)
  
  -- store x 2
  endx = x
  if not (startx == nil) then
    if (endx - startx > 50) then
      if (Ducky.Position == "left") then
        Ducky.Position = "middle"
        duckHorizontalMove = "right"
      elseif (Ducky.Position == "middle") then
        Ducky.Position = "right"
        duckHorizontalMove = "right"
      end
    elseif(endx - startx < -50 ) then
      if (Ducky.Position == "right") then
        Ducky.Position = "middle"
        duckHorizontalMove = "left"
      elseif (Ducky.Position == "middle") then
        Ducky.Position = "left"
        duckHorizontalMove = "left"
      end
    end
  end
end

function touchpressed(id,x,y,sw,sh,pressure)
  clickLocations(x,y)
  
  -- store x
  startx = x
end

function touchreleased(id,x,y,sw,sh,pressure)
    -- store x 2
  endx = x
  
  if not (startx == nil) then
    if (endx - startx > 0) then
      if (Ducky.Position == "left") then
        Ducky.Position = "middle"
        duckHorizontalMove = "right"
      elseif (Ducky.Position == "middle") then
        Ducky.Position = "right"
        duckHorizontalMove = "right"
      end
    elseif(endx - startx < 0 ) then
      if (Ducky.Position == "right") then
        Ducky.Position = "middle"
        duckHorizontalMove = "left"
      elseif (Ducky.Position == "middle") then
        Ducky.Position = "left"
        duckHorizontalMove = "left"
      end
    end
  end
end

function clickLocations (x,y)
  --[[if ((y > 270 and main.gamestate == "local") or ((main.gamestate == "story") or (main.gamestate == "endless"))) then
    if (Ducky.Position == "left" and (x > (Ducky.PosX + Ducky.Width/2))) then
      Ducky.Position = "middle"
      duckHorizontalMove = "right"
    elseif (Ducky.Position == "right" and (x < (Ducky.PosX + Ducky.Width/2))) then
      Ducky.Position = "middle"
      duckHorizontalMove = "left"
    elseif (Ducky.Position == "middle") then
      if (x < Ducky.PosX + Ducky.Width/2) then
        Ducky.Position = "left"
        duckHorizontalMove = "left"
      elseif (x > Ducky.PosX + Ducky.Width/2) then
        Ducky.Position = "right"
        duckHorizontalMove = "right"
      end
    end
  end]]--
  if x>= 590/2 and x < 750/2 and y >= 50/2 and y < 120/2 and main.gamestate == "endless" and DuckDataBase.numInvincability > 0 then
    upgrades.isActive = true
    upgrades.purchInv()
  end
  if x>= 590/2 and x < 750/2 and y >= 250/2 and y < 320/2 and main.gamestate == "endless" and DuckDataBase.numLifeLine > 0 then
    upgrades.isActive = true
    upgrades.purchLifeLine()
  end
  if x>= 590/2 and x < 750/2 and y >= 450/2 and y < 520/2 and main.gamestate == "endless" and DuckDataBase.numDoublePoints> 0 then
    upgrades.isActive = true
    upgrades.purchX2()
  end
  if x>= 590/2 and x < 750/2 and y >= 650/2 and y < 720/2 and main.gamestate == "endless" and DuckDataBase.numHalfSpeed > 0 then
    upgrades.isActive = true
    upgrades.purchHalfSpeed()
  end
  if x>= 40 and x < 127 and y >= 1 and y < 200 and main.gamestate == "local" and clickReady == true then
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
    sound.playSqueak()
    if holdState == 1 then
      main.gamestate = "endless" 
    elseif holdState == 2 then
      main.gamestate = "story"
      
    end
    game.load()
    storyLevel = _G.holdStoryLevel
  elseif x >= 200 and x < 350 and y >= 475 and y < 625 and main.gamestate == "gameover" then
    sound.playSqueak()
    main.gamestate = "menu"
  end
  
  --pause
  if (x > 644/2 and y > 1239/2 and x < 695/2 and y < 1311 and main.gamestate ~= "gameover") then
    sound.playSqueak()
    _G.paused = true
  end
  
  if (x >= 10 and x < 160 and y >= 100 and y < 250 and main.gamestate == "finishStoryLevel") then
    storyMenu.load()
    main.gamestate = "storySelect"
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
      currentDuckFrame = 1
      Ducky.PosX = Ducky.PosX - 5       
      if Ducky.PosX == 50 then
        duckHorizontalMove = "still"  
        currentDuckFrame = 2
      end
    elseif Ducky.Position == "middle" then
      currentDuckFrame = 1
      Ducky.PosX = Ducky.PosX - 5      
      if Ducky.PosX == 130 then
        duckHorizontalMove = "still" 
        currentDuckFrame = 2
      end
    end 
  end
  
  if duckHorizontalMove == "right" then
    currentDuckFrame = 3
    if Ducky.Position == "right" then
        Ducky.PosX = Ducky.PosX + 5
      if Ducky.PosX == 210 then
        duckHorizontalMove = "still"
        currentDuckFrame = 2
      end
    elseif Ducky.Position == "middle" then
        Ducky.PosX = Ducky.PosX + 5
      if Ducky.PosX == 130 then
        duckHorizontalMove = "still"
        currentDuckFrame = 2
      end
    end 
  end
    
  if duckVerticalMove == "down" then
    if duckLife == 2 then
      Ducky.PosY =  Ducky.PosY + 5
      if Ducky.PosY == 400 then
        duckVerticalMove = "still"
        hit = false
      end
    elseif duckLife == 1 then
      Ducky.PosY =  Ducky.PosY + 5
      if Ducky.PosY == 450 then
        duckVerticalMove = "still"
        hit = false
      end
    end
  end
  if duckVerticalMove == "up" then
    if duckLife == 2 then
      Ducky.PosY =  Ducky.PosY - 5
      if Ducky.PosY == 350 then
        duckVerticalMove = "still"
        hit = false
      end
    elseif duckLife == 1 then
      Ducky.PosY =  Ducky.PosY - 5
      if Ducky.PosY == 400 then
        duckVerticalMove = "still"
        hit = false
      end
    end
  end
    
  timer = timer + 1 * love.timer.getDelta()
  if timer > 1 then
    timer = 0
    currentWaterFrame = math.random(1,4)
  end 
end


function InBothStoryAndEndlessUpdate()
  upgrades.Update()
  if endlessScore >= 5 and endlessScore % 5 == 0 then
    speed = endlessScore / 20 + 2.5
  end
      
  if (upgrades.speedState == "halfSpeed") then
    speedMultiplier = 0.5
  else
    speedMultiplier = 1
  end
  
    for i,v in ipairs(Obstacles) do
      
      v.PosY = v.PosY + (speed * speedMultiplier)
    if v.PosY > obstacleReset then
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
      
      v.TexNumber = math.random(1,5)
   
    if(v.TexNumber == 1) then
     v.Tex = bubbles
      elseif (v.TexNumber == 2) then
     v.Tex = shampoo
      elseif (v.TexNumber == 3) then
      v.Tex = soap
      elseif (v.TexNumber == 4) then
      v.Tex = kids_shampoo
      elseif (v.TexNumber == 5) then
      v.Tex = submarine
    end
         
      v.PosY = -250 -- (i * 100) -- i = 0 , -500
     
          
      if(upgrades.pointState == "normal" and v.Collidable == true) then
        endlessScore = endlessScore + 1
      elseif(upgrades.pointState == "doublePoints" and v.Collidable == true) then
        endlessScore = endlessScore + 2
      end
       v.Collidable = true
    end
  end
end


function spinTowardsDrain()
  if (StepRight) then
    Ducky.PosX= Ducky.PosX + 50
    StepRight = false
  end
  
  if (Ducky.PosY < 550) then
    
    Ducky.PosY = Ducky.PosY + 2
    SpinRotate = SpinRotate + 0.01
    OriginSpin = 50
    
    if (Ducky.Position == "left") then
      Ducky.PosX = Ducky.PosX + 1
    
    elseif (Ducky.Position == "right") then
      Ducky.PosX = Ducky.PosX - 1
    end
  else 
    if (main.gamestate == "local") then
      if (localRound == 2) then
          RotatePhone.load()
          main.gamestate = "localSwitch" -- LocalIntermidiateStage
          VsEndScreen.player1Score = player1Score
        elseif (localRound == 3) then
          main.gamestate = "coopend" 
          VsEndScreen.player2Score = player2Score
      end
       
    else
      main.gamestate = "gameover" 
      factNum = love.math.random(1,10)
    end
  end

end


function AddFact()
  love.graphics.setColor(0,0,255)
  love.graphics.setFont(overFont)
  
  if (factNum == 1) then
    love.graphics.print("The original rubber duck was solid",45 ,420)
    love.graphics.print("rubber and was meant to be used as",35 ,435)
    love.graphics.print("a chew toy.",135 ,450)
  elseif (factNum == 2) then
    love.graphics.print("The first appearance of the rubber ",45 ,410)
    love.graphics.print("duck we all know and love was around ",30 ,425)
    love.graphics.print("the 1940s and was created",85 ,440)
    love.graphics.print("by Peter Ganine.",125 ,455)
  elseif (factNum == 3) then
    love.graphics.print("The rubber duck was in-duck-ted ",45 ,420)
    love.graphics.print("into the Toy Hall of Fame in 2013.",45 ,440)
  elseif (factNum == 4) then
    love.graphics.print("The biggest rubber duck in the world",30 ,420)
    love.graphics.print("is 19m tall, somehow I doubt that ",65 ,435)
    love.graphics.print("would fit in a bathtub.",85 ,450)
  elseif (factNum == 5) then
    love.graphics.print("In 1992 a cargo ship carrying 29",45 ,405)
    love.graphics.print("29,000 rubber ducks spilled its",47,420)
    love.graphics.print("shipment into the ocean, even now",45 ,435)
    love.graphics.print("rubber ducks are still being washed",40 ,450)
    love.graphics.print("ashore all over the world.",75 ,465)
  elseif (factNum == 6) then
    love.graphics.print("People around the world hold rubber ",45 ,405)
    love.graphics.print("duck races by dumping thousands of ",47 ,420)
    love.graphics.print("ducks into waterways and seeing",50 ,435)
    love.graphics.print("which duck comes first.",85 ,450)
  elseif (factNum == 7) then
    love.graphics.print("Charlotte Lee is the proud owner of",45 ,410)
    love.graphics.print("5,631 unique rubber ducks, that’s the",35 ,430)
    love.graphics.print("world record number of ducks",55 ,450)
    love.graphics.print("owned by one person.",85 ,470)
  elseif (factNum == 8) then
    love.graphics.print("January 13th is National Rubber",55 ,410)
    love.graphics.print("Duck Day, make sure to take a long",40 ,430)
    love.graphics.print("bath with your favorite ducky friend.",35 ,450)
  
  elseif (factNum == 9) then
    love.graphics.print("The queen of England has a",65 ,410)
    love.graphics.print("one-of-a-kind rubber duck that ",55 ,430)
    love.graphics.print("wears its own crown.",95 ,450)

  elseif (factNum == 10) then
    love.graphics.print("100% of people that see a squeaky duck",20 ,420)
    love.graphics.print(" feel nothing but the urge to squeak it.",25 ,440)
  end
  love.graphics.setColor(255,255,255)
end


function finishStoryLevel()
  love.graphics.draw(endstory,backgroundQuad,0,0)
  love.graphics.draw(continueButton,buttonQuad,10,100)
end