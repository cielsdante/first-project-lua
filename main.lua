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

