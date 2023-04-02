Player = {}

function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight() / 2
    self.width = 20
    self.height = 100
    self.speed = 500
end

function Player:update(dt)
    if love.keyboard.isDown("w") then
        if self.y >= 0 then -- CHECK BOUNDARY
            self.y = self.y - self.speed*dt
        end
    elseif love.keyboard.isDown("s") then
        if self.y <= (love.graphics.getHeight() - self.height) then -- CHECK BOUNDARY
            self.y = self.y + self.speed*dt
        end
    end
end

function Player:draw()
    love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end