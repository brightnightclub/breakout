class Level
  attr_accessor :map, :paddle
  def initialize(size, bricks=[])
    @size = size
    @paddle = Paddle.new(size)
    generate_map()
  end

  def generate_map
    map = Array.new(@size) do
      Array.new(@size) { '.' }
    end

    # set where paddle is on map
    map = set_paddle(map)

    # set all bricks on map
    # set ball

    @map = map
  end

  def set_paddle(map)
    x, y = @paddle.coords
    map[y][x] = '<'
    map[y][x + 1] = '='
    map[y][x + 2] = '>'
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
    else
      @x += 1
    end
  end
end


level = Level.new(15)
level.draw()
sleep(2)
level.paddle.move("left")
level.generate_map()
level.draw()
sleep(2)
level.paddle.move("left")
level.generate_map()
level.draw()
