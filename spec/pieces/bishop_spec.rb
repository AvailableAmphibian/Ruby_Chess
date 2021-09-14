describe Bishop do
  describe '#in_range?' do
    it '1) Going to up right' do
      test_bishop = Bishop.new([2, 2], 'b')
      board = Board.new([test_bishop])
      expect(test_bishop.in_range?([1, 3], board)).to eql(true)
    end

    it '2) Going to down left' do
      test_bishop = Bishop.new([2, 2], 'b')
      board = Board.new([test_bishop])
      expect(test_bishop.in_range?([3, 1], board)).to eql(true)
    end

    it '3) Going to same line' do
      test_bishop = Bishop.new([2, 2], 'b')
      board = Board.new([test_bishop])
      expect(test_bishop.in_range?([2, 3], board)).to eql(false)
    end
  end
end
