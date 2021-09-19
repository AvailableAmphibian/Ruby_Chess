require "board"
require "pieces/king"
require "pieces/queen"
require "pieces/bishop"
require "pieces/pawn"
require "pieces/knight"

require "players/human_player"

##
# Represents a game, script below
class Game
    WIN_POSSIBILITIES = {
        draw: '',
        black: 'Black',
        white: 'White'
    }

  def initialize(players = nil)
    @board = Board.new
    if players.nil?
      @current_player_index = 0
      @players = [HumanPlayer.new("Black"), HumanPlayer.new("White")]
    else
      @players = players
    end
  end

  def start
    puts 'Select a name for each players'
    @players.each do |player| 
      puts "Please, select a name for #{player.color} :"
      player.name = gets.chomp if player.name.nil?
    end

    winner = play

    if winner == :draw
      draw
    else
      winner_is winner
    end
  end

  def play
    until @board.check_mate?
      @board.display
      turn = current_player.play_turn @board

      return :draw if turn == 'draw' 
    end

    winner_return
  end

  def winner_return
    WIN_POSSIBILITIES.key current_player.color
  end

  def current_player
    @current_player_index += 1

    @players[@current_player_index % 2]
  end

  def draw
    puts "That's a draw ! It's kinda sad having neither a winner nor a whiner"
  end

  def winner_is(color)
    winning_color = WIN_POSSIBILITIES[:color]
    winner = @players.find { |player| color == player.color}
    whinner = @players.find { |player| winner != player}

    puts "The winner is #{winner.name} ! #{whinner} can whine about it... D:"
  end
end

game = Game.new
game.start