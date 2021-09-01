
##
# Represents a Rook
class Rook < Piece
  BLACK = '♜'.freeze
  WHITE = '♖'.freeze

  def to_s
    return BLACK if @color == 'b'
    return WHITE if @color == 'w'

    raise 'Not a possible color'
  end
end
