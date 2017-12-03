# A position on a chess board
class Position
  attr_reader :x, :y

  Y_AXES = [nil] + %w(a b c d e f g h) # 1-indexed
  BOARD = 1..8

  def initialize(x, y)
    y = Y_AXES.find_index(y.downcase) if y.is_a? String

    @x = x
    @y = y
  end

  def to_s
    x.to_s + human_y
  end

  def inspect
    to_s
  end

  def ==(other)
    other.x == x && other.y == y
  end

  def valid?
    BOARD.include?(x) && BOARD.include?(y)
  end

  private

  def human_y
    Y_AXES[y]
  end
end
