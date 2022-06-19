Player = Class{}

--Contructor in lua ->
function Player:init(x, y, w, h)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.position = 0
end

function Player:update(dt)
    if self.position < 0 then
        self.y = math.max(0, self.y + self.position * dt)

    else
        self.y = math.min(VIRTUAL_HEIGHT - self.h, self.y + self.position *dt)
    end
end

function Player:render()
    love.graphics.rectangle('fill', self.x, self.y, self.h)
end