require './lib/board'
Dir['./lib/pieces/*.rb'].sort.each { |file| require file }

describe Board do
  describe '#init_back_line (black)' do
    it 'creates a back line for chess pieces' do
      back_line = Board.init_back_line(0, 'b')

      expected = [] << Rook.new([0, 0], 'b')
      expected << Knight.new([0, 1], 'b')
      expected << Bishop.new([0, 2], 'b')
      expected << Queen.new([0, 3], 'b')
      expected << King.new([0, 4], 'b')
      expected << Bishop.new([0, 5], 'b')
      expected << Knight.new([0, 6], 'b')
      expected << Rook.new([0, 7], 'b')

      expect(back_line).to eql(expected)
    end
  end

  describe '#init_back_line (white)' do
    it 'creates a back line for chess pieces' do
      back_line = Board.init_back_line(7, 'w')

      expected = [] << Rook.new([7, 0], 'w')
      expected << Knight.new([7, 1], 'w')
      expected << Bishop.new([7, 2], 'w')
      expected << Queen.new([7, 3], 'w')
      expected << King.new([7, 4], 'w')
      expected << Bishop.new([7, 5], 'w')
      expected << Knight.new([7, 6], 'w')
      expected << Rook.new([7, 7], 'w')

      expect(back_line).to eql(expected)
    end
  end
  describe '#init_pawn_line (white)' do
    it 'creates a pawn line for chess pieces' do
      back_line = Board.init_pawn_line(6, 'w')

      expected = [] << Pawn.new([6, 0], 'w')
      expected << Pawn.new([6, 1], 'w')
      expected << Pawn.new([6, 2], 'w')
      expected << Pawn.new([6, 3], 'w')
      expected << Pawn.new([6, 4], 'w')
      expected << Pawn.new([6, 5], 'w')
      expected << Pawn.new([6, 6], 'w')
      expected << Pawn.new([6, 7], 'w')

      expect(back_line).to eql(expected)
    end
  end
  describe '#init_empty_line' do
    it 'creates a pawn line for chess pieces' do
      empty_line = Board.init_empty_line(4)

      expected = [] << Piece.new([4, 0])
      expected << Piece.new([4, 1])
      expected << Piece.new([4, 2])
      expected << Piece.new([4, 3])
      expected << Piece.new([4, 4])
      expected << Piece.new([4, 5])
      expected << Piece.new([4, 6])
      expected << Piece.new([4, 7])

      expect(empty_line).to eql(expected)
    end
  end
end
