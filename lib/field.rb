class Field
  attr_reader :x, :y
  # Todo validate
  def initialize(x = 1, y = 1)
    @x = x
    @y = y
  end

  def position_allowed?(x, y)
    x < @x && y < @y && x >= 0 && y >= 0
  end
end

