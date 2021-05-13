require 'pry'

class Game
  class BoundaryError < Exception
  end

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
    raise ArgumentError, "Route should be string or smth like that" unless route.kind_of? String
    raise ArgumentError, "Route should include only allowed symbols" unless route_regex.match? route

    route.split("").each do |cmd|
      begin
        next_pos = @character.next_position
        if direction_change? cmd
          @character.change_direction!(cmd)
        end
        if move?(cmd)
          if @field.position_allowed?(next_pos[:x], next_pos[:y])
            @character.move!
          else
            raise Game::BoundaryError, "moving from #{@character.x} #{@character.y} in diretion #{@character.direction}"
          end
        end

      rescue Game::BoundaryError => e
        STDERR.puts "Boundary collision, just FYI: #{e.msg}"
      rescue Character::WrongDirectionError => e
        STDERR.puts e.msg
      end
    end
  end
end
