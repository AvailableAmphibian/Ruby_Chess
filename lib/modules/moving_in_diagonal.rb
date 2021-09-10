module MovingInDiagonal
  ##
  # @param [Piece] piece
  # @param [Array] position
  # @param [Board] board
  def check_diagonals?(piece, position, board)
    movement = [] << position[0] - piece.position[0] << position[1] - piece.position[1]
    abs_array = movement.map(&:abs)

    return false unless abs_array[0] == abs_array[1]

    if movement[0].negative?
      return check_top_left?(piece, board, position) if movement[1].negative?
      return check_top_right?(piece, board, position) if movement[1].positive?
    elsif movement[0].positive?
      return check_down_left?(piece, board, position) if movement[1].negative?
      return check_down_right?(piece, board, position) if movement[1].positive?
    end

    false
  end

  private

  ##
  # @param [Array] position
  # @param [Array] other
  def get_position(position, other)
    [] << position[0] + other[0] << position[1] + other[1]
  end

  ##
  # @param [Array] current
  # @param [Board] board
  # @yieldparam next_matcher a checking method defined below
  def check_next(current, board)
    board.at(current).empty? ? yield : false
  end

  def check_top_right?(piece, board, max_position, current = [-1, 1])
    position = get_position(piece.position, current)
    return true if position == max_position

    check_next(position, board) { check_top_right?(piece, board, max_position, get_position(current, [-1, 1])) }
  end

  def check_top_left?(piece, board, max_position, current = [-1, -1])
    position = get_position(piece.position, current)
    return true if position == max_position

    check_next(position, board) { check_top_left?(piece, board, max_position, get_position(current, [-1, -1])) }
  end

  def check_down_left?(piece, board, max_position, current = [1, -1])
    position = get_position(piece.position, current)
    return true if position == max_position

    check_next(position, board) { check_down_left?(piece, board, max_position, get_position(current, [1, -1])) }
  end

  def check_down_right?(piece, board, max_position, current = [1, 1])
    position = get_position(piece.position, current)
    return true if position == max_position

    check_next(position, board) { check_down_right?(piece, board, max_position, get_position(current, [1, 1])) }
  end
end