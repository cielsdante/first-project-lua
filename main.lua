local love = require 'love'
local Player = require 'Player/Player'

local world = love.physics.newWorld(0, 0)

walls = {}

message = ""
function OnCollisionEnter(a, b, contact)
    local o1, o2 = a:getUserData(), b:getUserData()

    if o1 and o2 then
        message = o1.tag .. " collided with " .. o2.tag
    end 
end

function OnCollisionExit(a, b, contact)
    message = ""
end

world:setCallbacks(OnCollisionEnter, OnCollisionExit)

function NewWall (x, y, w, h)
    local w ={
        x = x,
        y = y,
        w = w,
        h = h,
        tag = "wall",
        body = love.physics.newBody(world, x, y, "static"),
        shape = love.physics.newRectangleShape(w/2, h/2, w, h)
    }

    w.fixture = love.physics.newFixture(w.body, w.shape)
    w.uData = w.fixture:setUserData(w)
    table.insert(walls, w)
end

function love.load()

    camera = require 'libraries/camera'
    cam = camera()

    anim8 = require 'libraries/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest")

    player = Player(world)
    player.fixture:setUserData(player)

    background = love.graphics.newImage('sprites/background.png')
    
    -- blocks
    NewWall(200, 600, 100, 100)
    NewWall(600, 450, 100, 100)
end

function love.update(dt)

    world:update(dt)

    local isMoving = false
    local dx, dy = 0, 0

    -- can add wasd keys if necessary
    if love.keyboard.isDown("right") then
        dx = player.speed
        player.anim = player.animations.right
        isMoving = true
    end
    
    if love.keyboard.isDown("left") then
        dx = - player.speed
        player.anim = player.animations.left
        isMoving = true
    end

    if love.keyboard.isDown("down") then
        dy = player.speed
        player.anim = player.animations.down
        isMoving = true
    end

    if love.keyboard.isDown("up") then
        dy = - player.speed
        player.anim = player.animations.up
        isMoving = true
    end

    if isMoving == false then
        player.anim:gotoFrame(2)
    end

    player.anim:update(dt)
    player.body:setLinearVelocity(dx, dy)
    player.x, player.y = player.body:getPosition()

    cam:lookAt(player.x, player.y)
end

function love.draw()
    cam:attach()
        love.graphics.draw(background, 0, 0)
        for i = 1, #walls do
            local w = walls[i]
            love.graphics.rectangle("line", w.x, w.y, w.w, w.h)
        end

        
        player.anim:draw(player.spriteSheet, player.x, player.y, nil, 10, nil, 6, 9)
    cam:detach()
    love.graphics.print(message, 50, 50)
end