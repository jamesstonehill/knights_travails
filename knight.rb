require_relative 'position.rb'

# represents the abilities of the Knight chess piece
class Knight
  POSSIBLE_VERTICAL_MOVEMENTS = [1, 2, -1, -2]
  POSSIBLE_LATERAL_MOVEMENTS = POSSIBLE_VERTICAL_MOVEMENTS

  def self.accessable_positions_from_position(position)
    movements = POSSIBLE_LATERAL_MOVEMENTS.product(POSSIBLE_VERTICAL_MOVEMENTS)

    movements.map do |x_movement, y_movement|
      Position.new(position.x + x_movement, position.y + y_movement)
    end.select(&:valid?)
  end
end
