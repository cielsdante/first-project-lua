local anim8 = require 'libraries/anim8'
local love = require 'love'

local function Player(world)
    local player = {}

    player.x = 400
    player.y = 200
    player.speed = 500
    player.spriteSheet = love.graphics.newImage('sprites/player-sheet.png')
    player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    player.animations = {}
    player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2 )
    player.animations.left = anim8.newAnimation( player.grid('1-4', 2), 0.2 )
    player.animations.right = anim8.newAnimation( player.grid('1-4', 3), 0.2 )
    player.animations.up = anim8.newAnimation( player.grid('1-4', 4), 0.2 )

    player.anim = player.animations.down

    player.tag = "player"
    player.w = 12
    player.h = 18
    player.body = love.physics.newBody(world, player.x, player.y, "dynamic")
    player.shape = love.physics.newRectangleShape(player.w / 2, player.h / 2, player.w, player.y)
    player.fixture = love.physics.newFixture(player.body, player.shape)
    player.body:setFixedRotation(true)

    return player
end

return Player