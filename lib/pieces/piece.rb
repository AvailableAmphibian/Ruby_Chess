##
# Represents a casual chess piece
class Piece
  EMPTY = Piece.new.freeze

  attr_reader :color

  def initialize(color = nil)
    @color = color
  end

  def to_s
    ' '
  end

  def move; end
end
