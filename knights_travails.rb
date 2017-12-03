require_relative 'position.rb'
require_relative 'knight.rb'

# calculates the shortest path a knight can take to get from one chess position
# to another. Returns nil if there is no valid path.
class KnightsTravails
  def initialize(starting_position, ending_position, forbidden_positions = [])
    @starting_position = starting_position
    @ending_position = ending_position
    @forbidden_positions = forbidden_positions
  end

  def shortest_path
    @shortest_path ||= find_shortest_path([starting_path])
  end

  private

  def find_shortest_path(traveled_paths)
    traveled_paths.each do |path|
      return path if path.last == @ending_position
      @forbidden_positions << path.last
    end

    new_paths = traveled_paths.flat_map do |path|
      possible_paths_from_path(path)
    end

    return nil if new_paths.empty?

    find_shortest_path(new_paths)
  end

  def possible_paths_from_path(path)
    valid_next_moves = Knight.accessable_positions_from_position(path.last)

    permitted_valid_next_moves = valid_next_moves.select do |position|
      position_permitted?(position)
    end

    permitted_valid_next_moves.map do |next_move|
      path + [next_move]
    end
  end

  def position_permitted?(position)
    !@forbidden_positions.include?(position)
  end

  def starting_path
    [@starting_position]
  end
end
