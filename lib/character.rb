class Character
  class WrongDirectionError < Exception

  end

  attr_reader :x, :y, :direction

  def initialize(x = 0 , y = 0 )
    @directions = %W|N E S W|
  end

  def next_position(cmd)

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

