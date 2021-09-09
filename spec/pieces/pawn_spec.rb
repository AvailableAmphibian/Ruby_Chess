require './lib/board'
Dir['./lib/pieces/*.rb'].sort.each { |file| require file }
Dir['./lib/errors/*.rb'].sort.each { |file| require file }

describe Pawn do

  # -- Testing for #in_range? --

  describe '#in_range? (1)' do
    it 'Going to the next place same line' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Piece.create_empty [1, 3]
      expect(test_pawn.in_range?(other)).to eql(false)
    end
  end

  describe '#in_range? (2)' do
    it 'Going to the next place in the same column' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Piece.create_empty [2, 2]
      expect(test_pawn.in_range?(other)).to eql(true)
    end
  end

  describe '#in_range? (3)' do
    it 'When trying to go far in the same column' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Piece.create_empty [5, 2]
      expect(test_pawn.in_range?(other)).to eql(false)
    end
  end

  describe '#in_range? (4)' do
    it 'When going to occupied left  diag' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Piece.create_empty [2, 1]
      expect(test_pawn.in_range?(other)).to eql(false)
    end
  end

  describe '#in_range? (5)' do
    it 'When going to occupied left diag' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Pawn.new([2, 1], 'w')
      expect(test_pawn.in_range?(other)).to eql(true)
    end
  end

  describe '#in_range? (6)' do
    it 'When going to unoccupied right diag' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Piece.create_empty [2, 1]
      expect(test_pawn.in_range?(other)).to eql(false)
    end
  end

  describe '#in_range? (7)' do
    it 'When going to occupied right diag' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Pawn.new([2, 3], 'w')
      expect(test_pawn.in_range?(other)).to eql(true)
    end
  end

  describe '#in_range? (8)' do
    it 'When trying to leap at initial place' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Piece.create_empty [3, 2]
      expect(test_pawn.in_range?(other)).to eql(true)
    end
  end

  describe '#in_range? (9)' do
    it 'When trying to leap after leaving initial place' do
      test_pawn = Pawn.new([2, 2], 'b')
      test_pawn.at_initial = false
      other = Piece.create_empty [4, 2]
      expect(test_pawn.in_range?(other)).to eql(false)
    end
  end

  describe '#in_range? (10)' do
    it 'When trying to to go to the same place' do
      test_pawn = Pawn.new([2, 2], 'b')
      test_pawn.at_initial = false
      other = Pawn.new([2, 2], 'b')
      expect(test_pawn.in_range?(other)).to eql(false)
    end
  end

  # -- End of Testing for #in_range? --

  # -- Testing for #move --

  describe '#move (1)' do
    it 'Going to a place occupied by an ally' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Pawn.new([2, 2], 'b')
      board = Board.new([test_pawn, other])
      expect { test_pawn.move(other, board) }.to raise_error(OccupiedError)
    end
  end

  describe '#move (2)' do
    it 'Going to a place not in our range (far)' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Piece.create_empty [4, 2]
      board = Board.new([test_pawn])
      expect { test_pawn.move(other, board) }.to raise_error(NotInRangeError)
    end
  end

  describe '#move (3)' do
    it 'Going to a place not in our range (same line)' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Piece.create_empty [1, 3]
      board = Board.new([test_pawn])
      expect { test_pawn.move(other, board) }.to raise_error(NotInRangeError)
    end
  end

  # -- End of Testing for #move --

end
