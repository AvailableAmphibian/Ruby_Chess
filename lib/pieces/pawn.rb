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

  ##
  # @param [Array] other_place
  # @param [Board] board
  def in_range?(other_place, board)
    distance = other_place[0] - @position[0]

    return false unless correct? distance

    abs_dist = distance.abs

    # Moving to the front
    return going_to_same_column?(abs_dist, board) if other_place[1] == @position[1]

    # Trying to attack
    return false if abs_dist != 1

    verify_attack_range?(other_place[1] - @position[1], board.at(other_place))
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

  private

  def going_to_same_column?(abs_dist, board)
    return true if abs_dist == 1

    between = color == 'w' ? -1 : 1
    (@at_initial && abs_dist == 2 && board.at([@position[0] + between, @position[1]]).empty?)
  end

  def correct?(distance)
    (distance.negative? && color == 'w') || (distance.positive? && color == 'b')
  end

  def verify_attack_range?(column, other_place)
    can_go_left = (@position[1] - 1).positive?
    can_go_right = (@position[1] + 1) < 8

    return false if other_place.empty?
    return true if column == -1 && can_go_left

    column == 1 && can_go_right
  end

end
