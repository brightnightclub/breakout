require_relative 'bricks.rb'
require_relative 'paddle.rb'

module GetKey

  # Check if Win32API is accessible or not
  USE_STTY = begin
      require 'Win32API'
      KBHIT = Win32API.new('crtdll', '_kbhit', [ ], 'I')
      GETCH = Win32API.new('crtdll', '_getch', [ ], 'L')
      false
    rescue LoadError
      # Use Unix way
      true
    end

  # Return the ASCII code last key pressed, or nil if none
  #
  # Return::
  # * _Integer_: ASCII code of the last key pressed, or nil if none
  def self.getkey
    if USE_STTY
      char = nil
      begin
        system('stty raw -echo') # => Raw mode, no echo
        char = (STDIN.read_nonblock(1).ord rescue nil)
      ensure
        system('stty -raw echo') # => Reset terminal mode
      end
      return char
    else
      return KBHIT.Call.zero? ? nil : GETCH.Call
    end
  end

end

class Stage
  WIDTH = 40
  HEIGHT = 30
  DEFAULT_LIVES = 3
  DEFAULT_POINTS = 0
  PADDLE_START_X = WIDTH / 2
  PADDLE_START_Y = HEIGHT
  BLANK = ' . '

  attr_accessor :grid, :brickset, :paddle

  def initialize
    @brickset = Brickset.new.set
    @paddle = Paddle.new(PADDLE_START_X, PADDLE_START_Y)
    # @ball = Ball.new
    @lives = DEFAULT_LIVES
    @points = DEFAULT_POINTS
    @grid = make_grid
    place_bricks
    place_paddle
  end

  def display
    #loop do
  #    clear_paddle
  #    update_paddle
      # `clear`
     grid.each { |line| line.each { |element| print element }; puts }
  #  end
  end

  private

  def update_grid

  end

  def update_paddle
    k = GetKey.getkey
    if k == 97
      Paddle.move_left
    elsif k == 115
      Paddle.move_right
    end
  end

  def clear_paddle
    x = paddle.x_pos
    y = paddle.y_pos
    grid[y][x] = BLANK
  end

  def make_grid
    line = -> { Array.new(WIDTH, BLANK) }
    g = []
    HEIGHT.times { g.push(line.call.push('  |').unshift('|  ')) }
    g.unshift(Array.new(WIDTH + 2, '___'))
    g
  end

  # Initializers
  def place_bricks
    brickset.each do |brick|
      x = brick[:xcoord]
      y = brick[:ycoord]
      grid[y][x] = Brickset::BRICK_SPRITE
    end
  end

  def place_paddle
    x = paddle.x_pos
    y = paddle.y_pos
    grid[y][x] = Paddle::PADDLE_SPRITE
  end
end

Stage.new.display
