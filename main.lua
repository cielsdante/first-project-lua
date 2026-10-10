local love = require 'love'
local Player = require 'Player/Player'

function love.load()

    camera = require 'libraries/camera'
    cam = camera()

    anim8 = require 'libraries/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest")

    player = Player()

    background = love.graphics.newImage('sprites/background.png')
    
end

function love.update(dt)

    local isMoving = false

    -- can add wasd keys if necessary
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
        player.anim = player.animations.right
        isMoving = true
    end
    
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
        player.anim = player.animations.left
        isMoving = true
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
        player.anim = player.animations.down
        isMoving = true
    end

    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
        player.anim = player.animations.up
        isMoving = true
    end

    if isMoving == false then
        player.anim:gotoFrame(2)
    end

    player.anim:update(dt)

    cam:lookAt(player.x, player.y)
end

function love.draw()
    cam:attach()
        love.graphics.draw(background, 0, 0)
        player.anim:draw(player.spriteSheet, player.x, player.y, nil, 10, nil, 6, 9)
    cam:detach()
end