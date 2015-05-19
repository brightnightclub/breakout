class Paddle
  attr_accessor :x

  WHITE = Gosu::Color.new(0xFFFFFFFF)

  def initialize(width = 80, x = 300)
    @width = width
    @x = x
  end

  def right
    @x += 6 if @x < World::WIDTH - @width
  end

  def left
    @x -= 6 if @x > 0
  end

  def draw(window)
    window.draw_quad(@x, World::HEIGHT - 20, WHITE, @x + @width, World::HEIGHT - 20, WHITE, @x + @width, World::HEIGHT - 5, WHITE, @x, World::HEIGHT - 5, WHITE)
  end
end
