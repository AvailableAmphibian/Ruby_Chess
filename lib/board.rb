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

  def initialize
    @board = [
      [Rook.new('b'), Knight.new('b'), Bishop.new('b'), Queen.new('b'), King.new('b'), Bishop.new('b'), Knight.new('b'), Rook.new('b')],
      [Pawn.new('b'), Pawn.new('b'), Pawn.new('b'), Pawn.new('b'), Pawn.new('b'), Pawn.new('b'), Pawn.new('b'), Pawn.new('b')],
      [Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY],
      [Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY],
      [Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY],
      [Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY, Piece::EMPTY],
      [Pawn.new('w'), Pawn.new('w'), Pawn.new('w'), Pawn.new('w'), Pawn.new('w'), Pawn.new('w'), Pawn.new('w'), Pawn.new('w')],
      [Rook.new('w'), Knight.new('w'), Bishop.new('w'), Queen.new('w'), King.new('w'), Bishop.new('w'), Knight.new('w'), Rook.new('w')]
    ]
  end

  def to_s
    line_separator = '— — — — — — — — — — — — — — — — — '
    col_separator = '| '
    result = ''

    result << line_separator << "\n"
    @board.each do |line|
      line.each { |piece| result << "#{col_separator}#{piece.to_s} " }

      result << col_separator << "\n"
      result << line_separator << "\n"
    end

    result
  end

  def display
    line_separator = '  — — — — — — — — — — — — — — — — — '
    col_separator = ' | '

    puts '    1   2   3   4   5   6   7   8'
    puts line_separator
    @board.each_with_index do |line, index|
      print LINE_LETTERS[index]
      line.each { |piece| print "#{col_separator}#{piece.to_s}" }

      puts col_separator
      puts line_separator
    end
  end
end
