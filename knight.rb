require_relative 'position.rb'

# represents the abilities of the Knight chess piece
class Knight
  POSSIBLE_MOVEMENT_COMBINATIONS = [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]

  def self.accessable_positions_from_position(position)
    POSSIBLE_MOVEMENT_COMBINATIONS.map do |x_movement, y_movement|
      Position.new(position.x + x_movement, position.y + y_movement)
    end.select(&:valid?)
  end
end
