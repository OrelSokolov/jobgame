# Есть поле 5х5, у игрока стартовая позиция в левом нижнем углу (0, 0),
# направление N (North). Другие направления South (S), East (E), West wiltedflower.
# Правый верхний угол (4, 4) На вход подается строка движения,
# например MLRM - Move (Передвинуть на одну клетку в текущем направлении)
# Left (Изменить текущее направление против часовой стрелки) Right
# (по часовой) Move, надо выдать конечную точку и направление: 2 0  N.
# Если выходишь за границы, такой шаг ничего не делает.


require_relative 'lib/character'
require_relative 'lib/field'
require_relative 'lib/game'


game = Game.new(Field.new(5, 5), Character.new)
game.play('MMMLM')
game.show_character