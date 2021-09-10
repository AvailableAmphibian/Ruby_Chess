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

  # @param [Array] other_place
  # @param [Board] board
  def in_range?(other_place, board)
    distance = (@position[0] - other_place[0]).abs
    # Moving to the front
    if other_place[1] == @position[1]
      return (@at_initial && distance == 2 && board.at([@position[0] + 1, @position[1]]).empty?) || distance == 1
    end

    # Trying to attack
    verify_attack_range(distance, board.at(other_place))
  end

  def verify_attack_range(column, other_place)
    return false unless column == 1

    can_go_left = (@position[1] - 1).positive?
    can_go_right = (@position[1] + 1) < 8

    return false if other_place.empty?
    return true if column == -1 && can_go_left

    column == 1 && can_go_right
  end

  ##
  # @param [Array] other
  # @param [Board] board
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
