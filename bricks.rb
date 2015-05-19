class Brickset
  BRICK_SPRITE = '***'
  INITIAL_STATE = false
  INITIAL_Y = 2

  attr_reader :set

  def initialize
    @set = [{
              xcoord: 10,
              ycoord: INITIAL_Y,
              broken: INITIAL_STATE
            },
            {
              xcoord: 20,
              ycoord: INITIAL_Y,
              broken: INITIAL_STATE
            },
            {
              xcoord: 30,
              ycoord: INITIAL_Y,
              broken: INITIAL_STATE
            }]
  end


  def random_position
    # todo
  end
end
