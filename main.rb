# Есть поле 5х5, у игрока стартовая позиция в левом нижнем углу (0, 0),
# направление N (North). Другие направления South (S), East (E), West wiltedflower.
# Правый верхний угол (4, 4) На вход подается строка движения,
# например MLRM - Move (Передвинуть на одну клетку в текущем направлении)
# Left (Изменить текущее направление против часовой стрелки) Right
# (по часовой) Move, надо выдать конечную точку и направление: 2 0  N.
# Если выходишь за границы, такой шаг ничего не делает.


class BoundaryError < Exception
end

class WrongDirectionError < Exception

end


class Character
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

class Field
  # Todo validate
  def initialize(h = 1, w = 1)

  end

  def position_allowed?(x, y)
    raise ArgumentError, "Check position arguments" unless x <= 0 || y <= 0

  end
end

class Game
  def initialize(field = Field.new, character = Character.new)
    @character = character
    @field = field
  end

  def show_character
    puts "Character position is #{@character.x} #{@character.y}"
  end

  def route_regex
    @route_regex ||= /^[MLR]+$/
  end

  def direction_change?(cmd)
    "RL".include? cmd
  end

  def move?(cmd)
    cmd == 'M'
  end

  def play(raw_route)
    route = raw_route.upcase
    raise ArgumentError, "Route should be string or smth like that" unless route.class.kind_of? String
    raise ArgumentError, "Route should include only allowed symbols" unless route.match? route_regex

    route.each do |cmd|
      begin
        next_pos = @character.next_position(cmd)
        if direction_change? cmd
          @character.change_direction!(cmd)
        end
        if move?(cmd)
          if @field.position_allowed?(next_pos[:x], next_pos[:y])
          else
            raise BoundaryError, "moving from #{@character.x} #{@character.y} in diretion #{@character.direction}"
          end
        end

      rescue BoundaryError => e
        STDERR.puts "Boundary collision, just FYI: #{e.msg}"
      rescue WrongDirectionError => e
        STDERR.puts e.msg
      end
    end
  end
end