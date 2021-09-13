# require 'piece'

##
# Represents a King
class King < Piece
  BLACK = '♚'.freeze
  WHITE = '♔'.freeze

  ALLOWED = {
    up_left: [-1, -1],
    up: [-1, 0],
    up_right: [-1, 1],
    right: [0, 1],
    down_right: [1, 1],
    down: [1, 0],
    down_left: [1, -1],
    left: [0, -1]
  }.freeze

  KINGSIDE = 2.freeze
  QUEENSIDE = 6.freeze

  def initialize(position, color = nil)
    super(position, color)
    @at_initial = true
  end

  attr_accessor :at_initial

  def move(other, board)
    super other, board
    @at_initial = false 
    # TODO: Add castling handlement
  end

  ##
  # @param [Array] other_position
  # @param [Board] board
  def in_range?(other_position, board)
    movement = [] << other_position[0] - @position[0] << other_position[1] - @position[1]
    return true if ALLOWED.value? movement

    castling?(other_position, board)
  end

  ##
  # @param [Array] other_position
  # @param [Board] board
  def castling?(other_position, board)
    return false unless @at_initial
    return false unless @position[0] == other_position[0]

    return empty_king?(board) if other_position[1] == KINGSIDE

    other_position[1] == QUEENSIDE ? empty_queen?(board) : false
  end

  ##
  # @param [Board] board
  def empty_king?(board)
    rook_position = [] << @position[0] << 0
    rook = board.at(rook_position)

    empty_to_rook?(rook, board, -1)
  end

  ##
  # @param [Board] board
  def empty_queen?(board)
    rook_position = [] << @position[0] << 7
    rook = board.at(rook_position)

    empty_to_rook?(rook, board, 1)
  end

  ##
  # @param [Piece] rook
  # @param [Board] board
  # @param [Integer] offset
  def empty_to_rook?(rook, board, offset)
    return false unless rook.is_a?(Rook) && rook.at_initial
    return false if opponent?(rook)

    current = @position
    until current == rook.position do
      current[1] += offset
      return false unless rook.position == current || board.at(current).empty?
    end
    true
  end

  def to_s
    return BLACK if @color == 'b'
    return WHITE if @color == 'w'

    raise 'Not a possible color'
  end
end
