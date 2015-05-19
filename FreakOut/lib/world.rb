class World < Gosu::Window

  def initialize
    super(640, 480, false)
    self.caption = "Breakout!"

    @paddle = Paddle.new
    @level = Level.new
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @paddle.left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @paddle.right
    end
  end

  def draw
    @paddle.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end
