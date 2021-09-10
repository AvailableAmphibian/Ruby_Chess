require "./lib/board.rb"
require "./lib/modules/moving_in_line.rb"
require "./lib/pieces/piece.rb"
require "./lib/pieces/rook.rb"

describe Rook do

  # -- Testing for #in_range? --
  describe "#in_range?" do
    it "1) Going up" do
      test_rook = Rook.new([2, 2], "b")
      board = Board.new([test_rook])
      expect(test_rook.in_range?([0, 2], board)).to eql(true)
    end

    it "2) Going  right" do
      test_rook = Rook.new([2, 2], "b")
      board = Board.new([test_rook])
      expect(test_rook.in_range?([2, 4], board)).to eql(true)
    end

    it "3) Going to same case" do
        test_rook = Rook.new([2, 2], "b")
        board = Board.new([test_rook])
        expect(test_rook.in_range?([2, 2], board)).to eql(false)
    end
    it "4) Going to diag" do
        test_rook = Rook.new([2, 2], "b")
        board = Board.new([test_rook])
        expect(test_rook.in_range?([3, 3], board)).to eql(false)
      end
  end

  # -- End of Testing for #in_range? --
end
