# require 'piece'

##
# Represents a Knight
class Knight < Piece
  BLACK = '♞'.freeze
  WHITE = '♘'.freeze

  def to_s
    return BLACK if @color == 'b'
    return WHITE if @color == 'w'

    raise 'Not a possible color'
  end
end
