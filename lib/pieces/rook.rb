##
# Represents a Rook
class Rook < Piece
  include MovingInLine
  BLACK = '♜'.freeze
  WHITE = '♖'.freeze

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
