## Knight's Travails

#### Instructions
> Given a standard 8 x 8 chessboard where each position is indicated in algebraic notation (with the lower left corner being a1), design a script that accepts two or more arguments.
>
> The first argument indicates the starting position of the knight. The second argument indicates the ending position of the knight. Any additional arguments indicate positions that are forbidden to the knight.
>
> Return an array indicating the shortest path that the knight must travel to get to the end position without landing on one of the forbidden squares. If there is no valid path to the destination return nil.

### Examples

```ruby
starting_position = Position.new(3, 'a')
ending_position = Position.new(6, 'c')

travails = KnightsTravails.new(starting_position, ending_position)
solution = travails.shortest_path

solution
=> [3a, 4b, 6c] # array of Position objects
```

```ruby
starting_position = Position.new(8, 'a')
ending_position = Position.new(6, 'g')

travails = KnightsTravails.new(starting_position, ending_position)
solution = travails.shortest_path

solution
=> [8a, 7c, 8e, 6g] # array of Position objects
```

```ruby
starting_position = Position.new(8, 'a')
ending_position = Position.new(6, 'g')
forbidden_positions = [Position.new(6, 'b'), Position.new(7, 'c')]

travails = KnightsTravails.new(starting_position, ending_position, forbidden_positions)
solution = travails.shortest_path

solution
=> nil
```
