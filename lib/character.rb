class Character
  class WrongDirectionError < Exception

  end

  attr_reader :x, :y, :direction

  def initialize(x = 0 , y = 0 )
    @directions = %W|N E S W|
    @x = x
    @y = y
  end

  def move!
    n_pos = next_position
    @x = n_pos[:x]
    @y = n_pos[:y]
  end

  def next_position
    case @directions.first
    when 'N'
      { x: @x, y: @y+1}
    when 'E'
      { x: @x+1, y: @y}
    when "S"
      { x: @x-1, y: @y}
    when "S"
      { x: @x, y: @y-1}
    end
  end

  def change_direction!(direction_cmd)
    case direction_cmd
    when 'L'
      d = -1
      @directions = @direction.rotate(d)
    when 'R'
      d = 1
      @directions = @direction.rotate(d)
    else
      raise WrongDirectionError, "Wrong direction command"
    end
  end

end

