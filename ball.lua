Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = 20
    self.height = 20
    self.speed = 200
    self.xVel = -self.speed
    self.yVel = 0
end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end

function Ball:move(dt)
    self.x = self.x + (self.xVel)*dt
    self.y = self.y + self.yVel*dt
end

function Ball:collide()
    local bcenter = (2*self.y + self.height) / 2
    if checkCollision(self, Player) then -- Check Collission with Player
        local pcenter = (2*Player.y + Player.height) / 2
        self.xVel = -self.xVel
        local cp = bcenter - pcenter
        self.yVel = cp*5
    end

    if checkCollision(self, AI) then -- Check Collission with AI
        local pcenter = (2*AI.y + AI.height) / 2
        self.xVel = -self.xVel
        local cp = bcenter - pcenter
        self.yVel = cp*5
    end

    if (self.y < 0) then -- Based on yPos determine velocity after collission
        self.y = 0
        self.yVel = -self.yVel
    elseif (self.y + self.height > love.graphics.getHeight()) then 
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end

    if (self.x < 0) then -- Preventing Ball from going Out of Bounds
        self.xVel = -self.xVel
        self.x = 0
    elseif (self.x + self.width > love.graphics.getWidth()) then
        self.xVel = - self.xVel
        self.x = love.graphics.getWidth() - self.width
    end
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end