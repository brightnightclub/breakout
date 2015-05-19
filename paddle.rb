class Paddle
  PADDLE_SPRITE = '==='

  attr_accessor :x_pos, :y_pos

  def initialize(default_x, default_y)
    @x_pos = default_x
    @y_pos = default_y
  end

  def self.move_left
    x_pos -= 1
  end

  def self.move_right
    x_pos += 1
  end
end
