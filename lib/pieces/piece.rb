Dir['../errors/*.rb'].sort.each { |file| require file }


##
# Represents a casual chess piece
class Piece
  attr_reader :position, :color


  CAN_MOVE_RETURN_CODES = {
    occupied_by_ally: -1,
    not_in_range: 0,
    empty: 1,
    occupied_by_opponent: 2
  }.freeze

  def initialize(position, color = nil)
    @position = position
    @color = color
  end

  def ==(other)
    other.instance_of?(self.class) && @color == other.color && @position == other.position
  end

  alias eql? ==

  def self.create_empty(position)
    Piece.new(position)
  end

  def to_s
    ' '
  end

  ##
  # @param [Array] other_position
  # @param [Board] board
  def move(other_position, board)
    move = can_move(other_position, board)
    # Exit to retry if that's an illegal move
    raise OccupiedError if move == :occupied_by_ally
    raise NotInRangeError if move == :not_in_range

    board.remove other_position if move == :occupied_by_opponent

    board.move_to self, other_position.position
    @position = other_position.position
  end

  # @param [Array] _other_position
  # @param [Board] _board
  # @return [Boolean]
  def in_range?(_other_position, _board)
    raise NotImplementedError 'Not implemented or empty piece'
  end

  def empty?
    @color.nil?
  end

  # @param [Piece] other_place
  # @return [Boolean] true if the color field is different
  def opponent?(other_place)
    @color != other_place.color
  end

  ##
  # Used to know if this piece can move to the other_place.
  # @param [Array] other_place
  # @param [Board] board
  # @return [Symbol]  if the other place isn't in this piece range or the other place is occupied by an ally
  # @return [Symbol] not_in_range (0) if the other place isn't in this piece range or the other place is occupied by an ally
  # @return [Symbol] 1 if the other place is empty
  # @return [Symbol] 2 if the other place is occupied by an opponent piece
  def can_move(other_place, board)
    return :not_in_range unless in_range?(other_place, board)
    return :empty if other_place.empty?

    opponent?(board.at(other_place)) ? :occupied_by_opponent : :occupied_by_ally
  end

end
