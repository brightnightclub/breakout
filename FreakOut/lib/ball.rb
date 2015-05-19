class Ball
  attr_accessor :x, :y

  WHITE = Gosu::Color.new(0xFFFFFFFF)

  def initialize(width = 5, x = 20, y = 20 )
    @width = width
    @x = x
    @y = y
  end

  def draw(window)
    ball = Gosu::Image.new(window, "ball.jpg", true)
    ball.draw(@x, @y, 1)
  end
end
