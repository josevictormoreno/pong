-- Game Pong
-- author:  José Victor Andrei Dalto Moreno
-- @josevictormoreno -> https://github.com/josevictormoreno

-- push is a library that will allow us to draw our game at a virtual
-- resolution, instead of however large our window is; used to provide
-- a more retro aesthetic
-- https://github.com/Ulydev/push

push = require 'push'
globais = require  'globais'
Class = require 'class'

player = require 'Player'
ball = require 'Ball'
 -- Runs in the first starts up, just once, to initialize the game
function love.load()
    
    -- used to prevent blurring of text
    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())

    textFont = love.graphics.newFont('font.ttf',8)
    scoreFont = love.graphics.newFont('font.ttf', 32)

    playerOne = 30
    playerTwo = VIRTUAL_HEIGHT - 50
    ballX = VIRTUAL_WIDTH /2 -2
    ballY = VIRTUAL_HEIGHT /2 -2

    ballDX = math.random(2) == 1 and 100 or -100
    ballDY = math.random(-50,50);

    playerOneScore = 0
    playerTwoScore = 0

    gameState = 'start'

    love.window.setTitle('Pong')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })
end

function love.update(dt)
    if love.keyboard.isDown('w') then
        playerOne = math.max(0, playerOne - 200 * dt)

    elseif love.keyboard.isDown('s') then
        playerOne = math.min(VIRTUAL_HEIGHT -20, playerOne + 200 * dt)
    end

    if love.keyboard.isDown('up') then
        playerTwo = math.max(0, playerTwo - 200 * dt)

    elseif love.keyboard.isDown('down') then
        playerTwo = math.min(VIRTUAL_HEIGHT -20, playerTwo + 200 * dt)
    end
    
    if gameState == 'play' then 
        ballX = ballX + ballDX *dt
        ballY = ballY + ballDY *dt
    end

end 

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()

    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else 
            gameState = 'start'

            ballX = VIRTUAL_WIDTH/2 -2
            ballY = VIRTUAL_HEIGHT/2 -2

            ballDX = math.random(2) == 1 and 100 or -100
            ballDY = math.random(-50, 50) * 1.5
        end
    end

end

function love.draw()
    --begin push
    push:apply('start')
    
    -- black to clean the screen
    love.graphics.clear( 0, 0, 0, 255) 

    love.graphics.setFont(textFont)
    love.graphics.setColor(0,255,0,255)
    love.graphics.printf('Hello Pong:', 0,  20, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(playerOneScore), VIRTUAL_WIDTH/2-50, VIRTUAL_HEIGHT/3)
    love.graphics.print(tostring(playerOneScore), VIRTUAL_WIDTH/2+30, VIRTUAL_HEIGHT/3)

    -- Draw the two rectangles for player one and two, and also the ball;
    love.graphics.rectangle('fill', 5, playerOne, 5, 20)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, playerTwo, 5, 20)
    --ball
    love.graphics.rectangle('fill',ballX, ballY,4,4)

    --end push
    push:apply('end')
end