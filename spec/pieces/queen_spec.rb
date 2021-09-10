require "./lib/board.rb"
require "./lib/modules/moving_in_line.rb"
require "./lib/pieces/piece.rb"
require "./lib/pieces/queen.rb"

describe Queen do

  # -- Testing for #in_range? --
  describe "#in_range?" do
    it "1) Going up" do
      test_queen = Queen.new([2, 2], "b")
      board = Board.new([test_queen])
      expect(test_queen.in_range?([0, 2], board)).to eql(true)
    end

    it "2) Going right" do
      test_queen = Queen.new([2, 2], "b")
      board = Board.new([test_queen])
      expect(test_queen.in_range?([2, 4], board)).to eql(true)
    end

    it "3) Going to same case" do
        test_queen = Queen.new([2, 2], "b")
        board = Board.new([test_queen])
        expect(test_queen.in_range?([2, 2], board)).to eql(false)
    end
    it "4) Going to diag" do
        test_queen = Queen.new([2, 2], "b")
        board = Board.new([test_queen])
        expect(test_queen.in_range?([3, 3], board)).to eql(true)
      end
      it "5) Going to impossible square" do
          test_queen = Queen.new([2, 2], "b")
          board = Board.new([test_queen])
          expect(test_queen.in_range?([3, 4], board)).to eql(false)
        end
  end

  # -- End of Testing for #in_range? --
end
