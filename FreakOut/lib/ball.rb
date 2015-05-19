class Ball

  def draw(window)
    window.draw_quad(@x, World::HEIGHT - 20, WHITE, @x + @width, World::HEIGHT - 20, WHITE, @x + @width, World::HEIGHT - 5, WHITE, @x, World::HEIGHT - 5, WHITE)
  end
end
