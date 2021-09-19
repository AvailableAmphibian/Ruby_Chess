require './lib/board'
require './lib/pieces/piece'
Dir['./lib/errors/*.rb'].sort.each { |file| require file }

##
# Represents a player
class Player
    attr_reader :color

    def initialize(color = nil)
        @color = color
    end

    def play_turn(board)
        puts "Hey #{@name} ! That's your turn !"
        turn = ''
        begin
            turn = turn_content board
        rescue => exception 
            puts exception.message
            retry
        end
        turn
    end

        def turn_content
            raise NotImplementedError
        end
    
end
