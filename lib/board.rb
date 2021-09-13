require 'modules/moving_in_diagonal'
require 'modules/moving_in_line'
require 'pieces/piece'
require 'pieces/rook'
require 'pieces/knight'
require 'pieces/pawn'
require 'pieces/queen'
require 'pieces/king'

##
# Represents a chess board
class Board
  LINE_LETTERS = %w[A B C D E F G H].freeze

  # @param [Array] testing_set
  def init_testing_board(testing_set, size)
    size.times { |it| @board << Board.init_empty_line(it, size) }
    testing_set.each { |testing_piece| @board[testing_piece.position[0]][testing_piece.position[1]] = testing_piece }
  end

  # @param [Array] testing_set
  def initialize(testing_set = nil, testing_board_size = 5)
    @board = []
    if testing_set.nil?
      init_board
    else
      init_testing_board(testing_set, testing_board_size)
    end
  end

  # @param [Array] position
  # @return [Piece]
  def at(position)
    @board[position[0]][position[1]]
  end

  def to_s
    line_separator = '— — — — — — — — — — — — — — — — — '
    col_separator = '| '
    result = ''

    result << line_separator << "\n"
    @board.each do |line|
      line.each { |piece| result << "#{col_separator}#{piece} " }

      result << col_separator << "\n"
      result << line_separator << "\n"
    end

    result
  end

  def display
    puts self
  end

  def init_board
    @board << Board.init_back_line(0, 'b')
    @board << Board.init_pawn_line(1, 'b')
    (2...6).each { |index| @board << Board.init_empty_line(index) }
    @board << Board.init_pawn_line(6, 'w')
    @board << Board.init_back_line(7, 'w')
  end

  def self.init_back_line(line_index, color)
    line = []
    line << Rook.new([line_index, 0], color)
    line << Knight.new([line_index, 1], color)
    line << Bishop.new([line_index, 2], color)
    line << Queen.new([line_index, 3], color)
    line << King.new([line_index, 4], color)
    line << Bishop.new([line_index, 5], color)
    line << Knight.new([line_index, 6], color)
    line << Rook.new([line_index, 7], color)

    line
  end

  def self.init_pawn_line(line_index, color)
    line = []
    8.times { |column| line << Pawn.new([line_index, column], color) }
    line
  end

  # @param [Integer] line_index
  # @param [Integer] line_size
  def self.init_empty_line(line_index, line_size = 8)
    line = []
    line_size.times { |column| line << Piece.new([line_index, column]) }
    line
  end

  # @param [Array] piece
  def remove(piece)
    @board[piece[0]][piece[1]] = Piece.create_empty([piece[0], piece[1]])
  end

  # @param [Piece] piece
  # @param [Array] other_position
  def move_to(piece, other_position)
    @board[other_position[0]][other_position[1]] = piece
    @board[piece.position[0]][piece.position[1]] = Piece.create_empty([piece.position[0], piece.position[1]])
  end
end
