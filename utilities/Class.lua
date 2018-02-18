local Class   = {}
Class.__index = Class

function Class:new() end

function Class:derive(type)
    local class   = {}
    class.__index = class
    class.type    = type
    class.super   = self

    setmetatable(class, self)

    return class
end

function Class:__call(...)
    local instance = setmetatable({}, self)

    instance:new(...)

    return instance
end

function Class:getType()
    return self.type
end

return Class