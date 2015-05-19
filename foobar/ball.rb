require 'pry'

class Ball
  attr_accessor :width, :height, :y, :x

  def initialize(window)
    @width = 50
    @height = 50
    @window = window
    @image = Gosu::Image.new(window, "ball.png", false)
    @x = @window.xvar / 2
    @y = @window.yvar / 2
    @vel_x = @vel_y = 3
    @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def half_height
    @height / 2
  end

  def half_width
    @width / 2
  end

  def move
    if @x == 590 || @x == 50
      @vel_x *= -1
    end
    if @y == 50
      @vel_y *= -1
    end

    @window.collidables.each do |i|


      x_range = ((i.x - i.half_width)..(i.x + i.half_width))
      y_range = ((i.y - i.half_width)..(i.y + i.half_width))

      #binding.pry
      if y_range.include?(@y) && x_range.include?(@x)
        @vel_y *= -1
      end
    end

    @x += @vel_x
    @y += @vel_y



    @x %= 640
    @y %= 480

    # @vel_x *= 0.95
    # @vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
