# require 'piece'

##
# Represents a King
class King < Piece
  BLACK = '♚'.freeze
  WHITE = '♔'.freeze

  def to_s
    return BLACK if @color == 'b'
    return WHITE if @color == 'w'

    raise 'Not a possible color'
  end
end
