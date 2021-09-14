##
# Represents a Rook
class Rook < Piece
  include MovingInLine
  BLACK = '♜'.freeze
  WHITE = '♖'.freeze

  def initialize(position, color = nil)
    super(position, color)
    @at_initial = true
  end

  def move(other, board)
    super other, board
    @at_initial = false
  end

  attr_accessor :at_initial

  ##
  # @param [Array] other_position
  # @param [Board] board
  def in_range?(other_position, board)
    check_lines?(self, other_position, board)
  end

  def to_s
    return BLACK if @color == 'b'
    return WHITE if @color == 'w'

    raise 'Not a possible color'
  end
end
