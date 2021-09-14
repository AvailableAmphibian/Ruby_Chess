describe King do
  describe '#in_range?' do
    it '1) Going to up right' do
      test_king = King.new([2, 2], 'b')
      board = Board.new([test_king])
      expect(test_king.in_range?([1, 3], board)).to eql(true)
    end

    it '2) Going to down left' do
      test_king = King.new([2, 2], 'b')
      board = Board.new([test_king])
      expect(test_king.in_range?([3, 1], board)).to eql(true)
    end

    it '3) Going to same line' do
      test_king = King.new([2, 2], 'b')
      board = Board.new([test_king])
      expect(test_king.in_range?([2, 3], board)).to eql(true)
    end

    it '4) when castling queen side successfully' do
      test_king = King.new([0, 4], 'b')
      test_rook = Rook.new([0, 0], 'b')
      board = Board.new([test_king, test_rook])
      expect(test_king.in_range?([0, 2], board)).to eql(true)
    end

    it '5) when castling king side successfully' do
      test_king = King.new([0, 4], 'b')
      test_rook = Rook.new([0, 7], 'b')
      board = Board.new([test_king, test_rook], 8)
      expect(test_king.in_range?([0, 6], board)).to eql(true)
    end

    it '6) when castling queen side wrongly' do
      test_king = King.new([0, 4], 'b')
      test_rook = Rook.new([0, 0], 'b')
      test_bishop = Bishop.new([0, 2], 'b')
      board = Board.new([test_king, test_bishop, test_rook], 8)
      expect(test_king.in_range?([0, 22], board)).to eql(false)
    end

    it '7) when castling king side wrongly' do
      test_king = King.new([0, 4], 'b')
      test_rook = Rook.new([0, 7], 'b')
      test_bishop = Bishop.new([0, 5], 'b')
      board = Board.new([test_king, test_bishop, test_rook], 8)
      expect(test_king.in_range?([0, 6], board)).to eql(false)
    end

    it '8) when castling after moving rook' do
      test_king = King.new([0, 4], 'b')
      test_rook = Rook.new([0, 7], 'b')
      test_rook.at_initial = false
      board = Board.new([test_king, test_rook], 8)
      expect(test_king.in_range?([0, 6], board)).to eql(false)
    end

    it '9) when castling after moving king' do
      test_king = King.new([0, 4], 'b')
      test_rook = Rook.new([0, 7], 'b')
      test_king.at_initial = false
      board = Board.new([test_king, test_rook], 8)
      expect(test_king.in_range?([0, 6], board)).to eql(false)
    end

    it '10) Going far' do
      test_king = King.new([2, 2], 'b')
      board = Board.new([test_king])
      expect(test_king.in_range?([2, 4], board)).to eql(false)
    end
  end

  describe '#move' do
    it 'when castling' do
      test_king = King.new([0, 4], 'b')
      test_rook = Rook.new([0, 0], 'b')
      board = Board.new([test_king, test_rook], 8)

      test_king.move([0, 2], board)

      test_board = Board.new([test_king, test_rook], 8)
      expect(board.to_s).to eql(test_board.to_s)
    end
  end
end
