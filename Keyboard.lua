local Keyboard = {}

local keyStates = {}

function Keyboard:update(dt)
    for k,v in pairs(keyStates) do
        keyStates[k] = nil
    end
end

function Keyboard:key(key)
    return love.keyboard.isDown(key)
end

function Keyboard:keyDown(key)
    return keyStates[key]
end

function Keyboard:keyUp(key)
    return keyStates[key] == false
end

function Keyboard:hookLoveEvents()
    function love.keypressed(key, scancode, isrepeat)
        keyStates[key] = true
    end

    function love.keyreleased(key, scancode)
        keyStates[key] = false
    end
end

return Keyboard