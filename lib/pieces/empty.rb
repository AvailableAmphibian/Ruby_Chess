class Empty < Piece
    def initialize(position)
        super position, ' '
    end

    ##
    # @param [Array] other_position
    # @param [Board] board
    def in_range?(other_position, board)
      false
    end
  
    def to_s
      return @color
    end
  end