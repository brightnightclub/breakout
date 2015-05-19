class Paddle
  attr_accessor :width, :height, :x, :y

  def initialize(window)
    @window = window
    @width = 266
    @height = 36
    @image = Gosu::Image.new(window, "paddle.png", false)
    @x = 0
    @y = @window.yvar - 17
    @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def shift_left
    @x -= 40
  end

  def shift_right
    @x += 40
  end

  def half_height
    @height / 2
  end

  def half_width
    @width / 2
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
