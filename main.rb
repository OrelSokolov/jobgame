# Есть поле 5х5, у игрока стартовая позиция в левом нижнем углу (0, 0),
# направление N (North). Другие направления South (S), East (E), West wiltedflower.
# Правый верхний угол (4, 4) На вход подается строка движения,
# например MLRM - Move (Передвинуть на одну клетку в текущем направлении)
# Left (Изменить текущее направление против часовой стрелки) Right
# (по часовой) Move, надо выдать конечную точку и направление: 2 0  N.
# Если выходишь за границы, такой шаг ничего не делает.


class BoundaryError < Exception
end


class Character
  attr_reader :x, :y

  def initialize(x = 0 , y = 0 )
    @direction = :N
  end

  def next_position(cmd)

  end

  def append_route(route)

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

  def play(route)
    r_uppcase = route.upcase
    raise ArgumentError, "Route should be string or smth like that" unless r_upcase.class.kind_of? String
    raise ArgumentError, "Route should include only allowed symbols" unless r_upcase.match? route_regex

    route.each do |cmd|
      begin
        next_pos = @character.next_position(cmd)
        #@field.position_allowed?(next_pos[:x], next_pos[:y])

      rescue BoundaryError
        STDERR.puts "Invalid boundary, just FYI."
      end
    end
  end
end