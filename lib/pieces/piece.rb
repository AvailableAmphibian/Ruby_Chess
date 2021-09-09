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
  # @param [Piece] other
  # @param [Board] board
  def move(other, board)
    move = can_move(other)
    # Exit to retry if that's an illegal move
    raise OccupiedError if move == :occupied_by_ally
    raise NotInRangeError if move == :not_in_range

    board.remove other if move == :occupied_by_opponent

    board.move_to self, other.position
    @position = other.position
  end

  # @param [Piece] _
  # @return [Boolean]
  def in_range?(_)
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
  # @param [Piece] other_place
  # @return [Symbol]  if the other place isn't in this piece range or the other place is occupied by an ally
  # @return [Symbol] not_in_range (0) if the other place isn't in this piece range or the other place is occupied by an ally
  # @return [Symbol] 1 if the other place is empty
  # @return [Symbol] 2 if the other place is occupied by an opponent piece
  def can_move(other_place)
    return :not_in_range unless in_range? other_place
    return :empty if other_place.empty?

    opponent?(other_place) ? :occupied_by_opponent : :occupied_by_ally
  end

end
