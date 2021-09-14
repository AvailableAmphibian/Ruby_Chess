Dir['./lib/errors/*.rb'].sort.each { |file| require file }

describe Pawn do
  describe '#move' do
    it 'Going to a place occupied by an ally' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Pawn.new([2, 2], 'b')
      board = Board.new([test_pawn, other])
      expect { test_pawn.move(other.position, board) }.to raise_error(OccupiedError)
    end

    it 'Going to a place not in our range (far)' do
      test_pawn = Pawn.new([1, 2], 'b')
      board = Board.new([test_pawn])
      expect { test_pawn.move([4, 2], board) }.to raise_error(NotInRangeError)
    end

    it 'Going to a place not in our range (same line)' do
      test_pawn = Pawn.new([1, 2], 'b')
      board = Board.new([test_pawn])
      expect { test_pawn.move([1, 3], board) }.to raise_error(NotInRangeError)
    end

    # TODO: add checks for allowed moves
    it 'Allowed move (tried with pawn)' do
      test_pawn = Pawn.new([1, 2], 'b')
      board = Board.new([test_pawn])
      test_pawn.move([2, 2], board)

      moved_pawn = test_pawn
      test_board = Board.new([moved_pawn])

      expect(board.to_s).to eql(test_board.to_s)
    end

    it 'Allowed attacking move (tried with pawn)' do
      test_pawn = Pawn.new([1, 2], 'b')
      attacked_pawn = Pawn.new([2, 3], 'w')
      board = Board.new([test_pawn, attacked_pawn])
      test_pawn.move([2, 3], board)

      moved_pawn = test_pawn
      test_board = Board.new([moved_pawn])

      expect(board.to_s).to eql(test_board.to_s)
    end
  end
end
