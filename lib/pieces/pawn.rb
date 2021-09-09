##
# Represents a Pawn
class Pawn < Piece
  BLACK = '♟'.freeze
  WHITE = '♙'.freeze

  def initialize(position, color = nil)
    super(position, color)
    @at_initial = true
  end

  attr_writer :at_initial

  # @param [Piece] other_place
  def in_range?(other_place)
    distance = (@position[0] - other_place.position[0]).abs
    # Moving to the front
    return (@at_initial && distance == 2) || distance == 1 if other_place.position[1] == @position[1]

    # Trying to attack
    return false unless distance == 1

    can_go_left = (@position[1] - 1).positive?
    can_go_right = (@position[1] + 1) < 8
    column = @position[0] - other_place.position[0]

    return false if other_place.empty?
    return true if column == -1 && can_go_left

    column == 1 && can_go_right
  end

  def move(other, board)
    super other, board
    @at_initial = false
  end

  def to_s
    return BLACK if @color == 'b'
    return WHITE if @color == 'w'

    raise 'Not a possible color'
  end
end
