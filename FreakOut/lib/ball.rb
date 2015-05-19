class Ball
  attr_accessor :x, :y, :width, :height

  WHITE = Gosu::Color.new(0xFFFFFFFF)

  def initialize(width = 5, x = World::WIDTH/2, y = 20 )
    @width = width
    @height = width
    @x = x
    @y = y
    @angle = 0.785
  end

  def draw(window)
    ball = Gosu::Image.new(window, "ball.jpg", true)
    ball = Gosu::Image.draw_rot(@x, @y, 1, @angle)
    ball.draw(@x, @y, 1)
  end

  def update

  end

  def bounce
    if @angle < 3
      @angle = (@angle + 0.785)
    else
      @angle = 0.785
    end
  end
end
