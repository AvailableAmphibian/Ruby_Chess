require './lib/board'
Dir['./lib/pieces/*.rb'].sort.each { |file| require file }
Dir['./lib/errors/*.rb'].sort.each { |file| require file }

describe Pawn do

  # -- Testing for #in_range? --

  describe '#in_range? (1)' do
    it 'Going to the next place same line' do
      test_pawn = Pawn.new([1, 2], 'b')
      board = Board.new([test_pawn])
      expect(test_pawn.in_range?([1, 3], board)).to eql(false)
    end
  end

  describe '#in_range? (2)' do
    it 'Going to the next place in the same column' do
      test_pawn = Pawn.new([1, 2], 'b')
      board = Board.new([test_pawn])
      expect(test_pawn.in_range?([2, 2], board)).to eql(true)
    end
  end

  describe '#in_range? (3)' do
    it 'When trying to go far in the same column' do
      test_pawn = Pawn.new([1, 2], 'b')
      board = Board.new([test_pawn])
      expect(test_pawn.in_range?([5,2], board)).to eql(false)
    end
  end

  describe '#in_range? (4)' do
    it 'When going to occupied left  diag' do
      test_pawn = Pawn.new([1, 2], 'b')
      board = Board.new([test_pawn])
      expect(test_pawn.in_range?([2, 1], board)).to eql(false)
    end
  end

  describe '#in_range? (5)' do
    it 'When going to occupied left diag' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Pawn.new([2, 1], 'w')
      board = Board.new([test_pawn, other])
      expect(test_pawn.in_range?(other.position, board)).to eql(true)
    end
  end

  describe '#in_range? (6)' do
    it 'When going to unoccupied right diag' do
      test_pawn = Pawn.new([1, 2], 'b')
      board = Board.new([test_pawn])
      expect(test_pawn.in_range?([2, 1], board)).to eql(false)
    end
  end

  describe '#in_range? (7)' do
    it 'When going to occupied right diag' do
      test_pawn = Pawn.new([1, 2], 'b')
      other = Pawn.new([2, 3], 'w')
      board = Board.new([test_pawn, other])
      expect(test_pawn.in_range?(other.position, board)).to eql(true)
    end
  end

  describe '#in_range? (8)' do
    it 'When trying to leap at initial place' do
      test_pawn = Pawn.new([1, 2], 'b')
      board = Board.new([test_pawn])
      expect(test_pawn.in_range?([3, 2], board)).to eql(true)
    end
  end

  describe '#in_range? (9)' do
    it "When trying to leap at initial place but there's an opponent" do
      test_pawn = Pawn.new([1, 2], 'b')
      other_pawn = Pawn.new([2, 2], 'b')
      board = Board.new([test_pawn,other_pawn])
      expect(test_pawn.in_range?([3, 2], board)).to eql(false)
    end
  end

  describe '#in_range? (10)' do
    it 'When trying to leap after leaving initial place' do
      test_pawn = Pawn.new([2, 2], 'b')
      test_pawn.at_initial = false
      board = Board.new([test_pawn])
      expect(test_pawn.in_range?([4, 2], board)).to eql(false)
    end
  end

  describe '#in_range? (11)' do
    it 'When trying to to go to the same place' do
      test_pawn = Pawn.new([2, 2], 'b')
      test_pawn.at_initial = false
      other = Pawn.new([2, 2], 'b')
      board = Board.new([test_pawn, other])
      expect(test_pawn.in_range?(other.position,board)).to eql(false)
    end
  end

  # -- End of Testing for #in_range? --
end
