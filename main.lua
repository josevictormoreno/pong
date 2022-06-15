-- Game Pong
-- author:  José Victor Andrei Dalto Moreno
-- @josevictormoreno -> https://github.com/josevictormoreno

-- push is a library that will allow us to draw our game at a virtual
-- resolution, instead of however large our window is; used to provide
-- a more retro aesthetic
-- https://github.com/Ulydev/push

push = require 'push'
globais = require  'globais'

 -- Runs in the first starts up, just once, to initialize the game
function love.load()
    
    -- used to prevent blurring of text
    love.graphics.setDefaultFilter('nearest', 'nearest')

    textFont = love.graphics.newFont('font.ttf',8)
    scoreFont = love.graphics.newFont('font.ttf', 32)
    
    love.graphics.setFont(textFont)

    playerOne = 30
    playerTwo = VIRTUAL_HEIGHT - 50

    playerOneScore = 0
    playerTwoScore = 0

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })
end

function love.update(dt)
    if love.keyboard.isDown('w') then
        playerOne = playerOne - 200 * dt

    elseif love.keyboard.isDown('s') then
        playerOne = playerOne + 200 * dt
    end

    if love.keyboard.isDown('up') then
        playerTwo = playerTwo - 200 * dt

    elseif love.keyboard.isDown('down') then
        playerTwo = playerTwo + 200 * dt
    end 

end 

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end 

end

function love.draw()
    --begin push
    push:apply('start')
    
    -- black to clean the screen
    love.graphics.clear( 0, 0, 0, 255) 

    love.graphics.setFont(textFont)
    love.graphics.printf('Hello Pong:', 0,  20, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(playerOneScore), VIRTUAL_WIDTH/2-50, VIRTUAL_HEIGHT/3)
    love.graphics.print(tostring(playerOneScore), VIRTUAL_WIDTH/2+30, VIRTUAL_HEIGHT/3)

    -- Draw the two rectangles for player one and two, and also the ball;
    love.graphics.rectangle('fill', 10, playerOne, 5, 20)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, playerTwo, 5, 20)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH /2 -2, VIRTUAL_HEIGHT/2 -2,4,4)

    --end push
    push:apply('end')
end