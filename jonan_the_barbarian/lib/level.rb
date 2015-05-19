class Level
  attr_accessor :map, :paddle
  def initialize(size, bricks=[])
    @size = size
    @paddle = Paddle.new(size)
    @bricks = bricks
    generate_map()
  end

  def tick(input)
    system "clear"
    @paddle.move(input)
    generate_map()
    draw()
  end

  def generate_map
    map = Array.new(@size) do
      Array.new(@size) { '.' }
    end

    # set where paddle is on map
    map = set_paddle(map)

    # set all bricks on map
    @bricks.each do |brick|
      map = set_brick(map, brick[0], brick[1])
    end

    # set ball

    @map = map
  end

  def set_paddle(map)
    x, y = @paddle.coords
    map[y][x % @size] = '<'
    map[y][(x + 1) % @size] = '='
    map[y][(x + 2) % @size] = '>'
    map
  end

  def set_brick(map, x, y)
    map[y][x] = '█'
    map
  end

  def set_ball(map, x, y)
    map[y][x] = 'o'
    map
  end

  def draw
    @map.each {|row| puts row.join}
  end
end

class Paddle
  attr_accessor :x, :y
  def initialize(map_size)
     @x = (map_size / 2) - 1
     @y = map_size - 1
  end

  def coords
    [@x, @y]
  end

  def move(input)
    if input == "left"
      @x -= 1
    elsif input == "right"
      @x += 1
    end
  end
end


bricks = [[10, 3], [7, 3], [4, 3], [4, 4] ,[6, 4],[8, 4], [10, 4]]
level = Level.new(15, bricks)
level.draw()

loop do
  system("stty raw -echo") #=> Raw mode, no echo
  char = STDIN.read_nonblock(1) rescue nil
  system("stty -raw echo") #=> Reset terminal mode

  if char == 'a'
    level.tick("left")
  elsif char == 'd'
    level.tick ("right")
  elsif char == 'q'
    break
  end

  char = nil
end
