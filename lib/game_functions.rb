class GameFunctions
    attr_reader :board

    def initialize(rows, columns)
        @board = Board.new(rows, columns)
        @turns = 0
        @counters = Hash[("A".."G").map { |letter| [letter, 6] }]
    end

    def take_turn
        if @turns.even?
            player_turn
        else 
            computer_turn
        end
        @turns += 1
    end

    def player_turn(player_input, piece)
        column = column_index(player_input)
        if column && valid_column?(player_input)
            row = @counters[player_input] -= 1
            @board.board_map[row][column] = piece
        end
    end

    def computer_turn
        computer_choice = @counters.keys.sample
        player_turn(computer_choice, "O")
        @board.print_board_map
        #leverage player_turn method to place computer piece
    end

    def column_index(player_input)
        columns = {"A" => 0, "B" => 1, "C" => 2, "D" => 3, "E" => 4, "F" => 5, "G" => 6}
        columns[player_input]
    end

    def valid_column?(input)
        @counters[input] && @counters[input] > 0
        # prevents nil > 0 error
    end

    def game_over?
        return :player_won if @board.win?("X")
        return :computer_won if @board.win?("O")
        return :draw if @board.full?
        false
    end

    def restart_game
        @board.reset_board
        @turns = 0
        reset_counters
    end

    def reset_counters
        @counters = Hash[("A".."G").map { |letter| [letter, 6] }]
    end
end