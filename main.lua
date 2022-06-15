-- Game Pong
-- author:  José Victor Andrei Dalto Moreno
-- @josevictormoreno -> https://github.com/josevictormoreno

-- push is a library that will allow us to draw our game at a virtual
-- resolution, instead of however large our window is; used to provide
-- a more retro aesthetic
-- https://github.com/Ulydev/push

push = require 'push'
globais = require  'globais'

function love.load()
    
    -- used to prevent blurring of text
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })
end

function love.draw()
    --begin push
    push:apply('start')

    love.graphics.printf('Hello Pong:', 0, VIRTUAL_HEIGHT/2 -6, VIRTUAL_WIDTH, 'center')

    --end push
    push:apply('end')
end