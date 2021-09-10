require './lib/board'
Dir['./lib/pieces/*.rb'].sort.each { |file| require file }
Dir['./lib/errors/*.rb'].sort.each { |file| require file }

describe Knight do

  # -- Testing for #in_range? --
  describe '#in_range?' do
    it '1) Going to up right' do
      test_knight = Knight.new([2, 2], 'b')
      board = Board.new([test_knight])
      expect(test_knight.in_range?([0, 3], board)).to eql(true)
    end

    it '2) Going to down left' do
      test_knight = Knight.new([2, 2], 'b')
      board = Board.new([test_knight])
      expect(test_knight.in_range?([3, 0], board)).to eql(true)
    end

    it '3) Going to same case' do
      test_knight = Knight.new([2, 2], 'b')
      board = Board.new([test_knight])
      expect(test_knight.in_range?([2,2], board)).to eql(false)
    end
  end


  # -- End of Testing for #in_range? --
end
