require 'gosu'
require_relative 'paddle'
require_relative 'ball'

class GameWindow < Gosu::Window
  attr_accessor :yvar, :xvar

  def initialize
    @yvar = 480
    @xvar = 640
    super @xvar, @yvar, false
    @paddle = Paddle.new(self)
    @ball = Ball.new(self)
    self.caption = "Gosu Tutorial Game"
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @paddle.shift_left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @paddle.shift_right
    end
  end

  def draw
    @paddle.draw
    @ball.turn_right
    @ball.move
    @ball.draw
  end

  def collidables
    [@paddle]  
  end
end

window = GameWindow.new
window.show
