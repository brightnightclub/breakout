class Paddle
  attr_accessor :x

  def initialize(width = 40, x = 300)
    @width = width
    @x = x
  end

  def right
    @x += 1 if @x < World::WIDTH - @width
  end

  def left
    @x -= 1 if @x > 0
  end
end
