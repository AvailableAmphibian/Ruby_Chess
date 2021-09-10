# TODO: Add modules for moving

##
# Represents a Queen
class Queen < Piece
  include MovingInDiagonal
  include MovingInLine

  BLACK = '♛'.freeze
  WHITE = '♕'.freeze

  def in_range?(other_position, board)
    check_diagonals?(self, other_position, board) || check_lines?(self, other_position, board)
  end

  def to_s
    return BLACK if @color == 'b'
    return WHITE if @color == 'w'

    raise 'Not a possible color'
    end
end
