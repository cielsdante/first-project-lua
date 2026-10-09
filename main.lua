-- hello world 
message = "Lua is awesome!"
print(message)

-- number
value1 = 5
value2 = 10

-- result = value1
-- result = value1 + 1
result = value2 / 20
print(result)

value2 = value2 + 10
print(value2)


-- if, else, elseif
val = 0
condition = -5

if condition > 0 then
    val = 1
elseif condition < -10 then
    val = -1
elseif condition == -5 then
    val = "hello!"
else
    val = "no conditions met!"
end

-- if condition > 0 then
--     val = 1
-- else
--     val = -1
-- end

-- if condition <= 0 then
--     val = -1
-- end
print(val)

-- loops
i = 0
test = 0
while i < 10 do
    i = i + 1
    test = test - 5
end

print(test)
print(i)

pickle = 0

for i = 1, 3, 1 do
    pickle = pickle + 10
end

print(pickle)

-- functions
number = 0

function increaseNumber(foo)
    -- number = number + foo
    foo = foo * 2
    return foo
end

-- increaseNumber(99)
-- print(number)
funcResult = increaseNumber(10)
print(funcResult)
 
--[[
    big comment 
    learn lua
    very cool language 
    aaaaaaaaaaa
]]

-- Local / global variables
local monkey = 100 -- within same section of code

function testLocalVariable(foo)
    local var = foo
    var = var / 2
    return var
end

var = 1 -- it is not the same var

-- table
myVar = 0
myTable = { 88, 31, 10 }

testScores = {}
testScores.subject = "math"

-- testScores = { 95, 97, 98 }
testScores[1] = 95
testScores[2] = 87
testScores[3] = 98

table.insert(testScores, 95)

for index, value in ipairs(testScores) do
    myVar  = myVar + value
end

-- nil -> nothing exists right here

-- myVar = testScores[4]
print(myVar)
print(testScores.subject)


