class World < Gosu::Window

  WIDTH = 640
  HEIGHT = 480

  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "Breakout!"

    @ball = Ball.new
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
    @paddle.draw(self)
    @ball.draw(self)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end
