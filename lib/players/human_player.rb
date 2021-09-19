require './lib/players/player'

##
# Represents a human player
class HumanPlayer < Player
    def initialize(color = nil, name = nil)
        super color
        @name = name
    end

    attr_accessor :name

    def turn_content(board)
        taken_positions = take_position
        return taken_positions if taken_positions == 'draw'
        positions = convert_to_valid taken_positions

        piece = board.at(positions[0])

        raise NotValidPositionError unless piece.color == @color

        piece.move(positions[1], board)
    end

    def take_position
        puts "Input valid starting position and ending position (e.g. : \"a1b2\", \"e8c7\")"
        position = gets.chomp
        return position if position == 'draw'
        /^([a-h|A-H][1-8]){2}$/.match?(position) ? position : take_position
    end

    def convert_to_valid(to_convert)
        codes = to_convert.codepoints
        [] << ([] << convert(codes[0]) << convert(codes[1])) << ([] << convert(codes[2]) << convert(codes[3]))
    end

    def convert(codepoint)
        return codepoint - 97 if codepoint >= 97
        return codepoint - 65 if codepoint >= 65
        
        codepoint - 49
    end
end
