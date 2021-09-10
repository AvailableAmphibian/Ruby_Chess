##
# Represents a Bishop
class Bishop < Piece
  include MovingInDiagonal
  BLACK = '♝'.freeze
  WHITE = '♗'.freeze

  ##
  # @param [Array] other_position
  # @param [Board] board
  def in_range?(other_position, board)
    check_diagonals?(self, other_position, board)
  end


  def to_s
    return BLACK if @color == 'b'
    return WHITE if @color == 'w'

    raise 'Not a possible color'
  end
end
