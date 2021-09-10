# require 'piece'

##
# Represents a Knight
class Knight < Piece
  BLACK = '♞'.freeze
  WHITE = '♘'.freeze

  ALLOWED = {
    up2right1: [-2, 1],
    up2left1: [-2, -1],
    down2right1: [2, 1],
    down2left1: [2, -1],
    up1right2: [-1, 2],
    up1left2: [-1, -2],
    down1right2: [1, 2],
    down1left2: [1, -2]
  }.freeze

  ##
  # @param [Array] other_position
  # @param [Board] board
  def in_range?(other_position, board)
    movement = [] << other_position[0] - @position[0] << other_position[1] - @position[1]
    ALLOWED.value? movement
  end

  def to_s
    return BLACK if @color == 'b'
    return WHITE if @color == 'w'

    raise 'Not a possible color'
  end
end
