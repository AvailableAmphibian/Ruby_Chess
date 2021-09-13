require "./lib/board.rb"
require "./lib/modules/moving_in_diagonal.rb"
require "./lib/pieces/piece.rb"
require "./lib/pieces/bishop.rb"

describe Bishop do

  # -- Testing for #in_range? --
  describe "#in_range?" do
    it "1) Going to up right" do
      test_bishop = Bishop.new([2, 2], "b")
      board = Board.new([test_bishop])
      expect(test_bishop.in_range?([1, 3], board)).to eql(true)
    end

    it "2) Going to down left" do
      test_bishop = Bishop.new([2, 2], "b")
      board = Board.new([test_bishop])
      expect(test_bishop.in_range?([3, 1], board)).to eql(true)
    end

    it "3) Going to same line" do
      test_bishop = Bishop.new([2, 2], "b")
      board = Board.new([test_bishop])
      expect(test_bishop.in_range?([2, 3], board)).to eql(false)
    end
  end

  # -- End of Testing for #in_range? --
end
