require './lib/board'
Dir['./lib/pieces/*.rb'].sort.each { |file| require file }
Dir['./lib/errors/*.rb'].sort.each { |file| require file }

describe Pawn do

  # -- Testing for #move --

  describe '#move (1)' do
    it 'Going to a place occupied by an ally' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Pawn.new([2, 2], 'b')
      board = Board.new([test_pawn, other])
      expect { test_pawn.move(other.position, board) }.to raise_error(OccupiedError)
    end
  end

  describe '#move (2)' do
    it 'Going to a place not in our range (far)' do
      test_pawn = Pawn.new([1, 2], 'b')
      board = Board.new([test_pawn])
      expect { test_pawn.move([4, 2], board) }.to raise_error(NotInRangeError)
    end
  end

  describe '#move (3)' do
    it 'Going to a place not in our range (same line)' do
      test_pawn = Pawn.new([1, 2], 'b')
      board = Board.new([test_pawn])
      expect { test_pawn.move([1, 3], board) }.to raise_error(NotInRangeError)
    end
  end

  # -- End of Testing for #move --
end