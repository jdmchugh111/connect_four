class GameFunctions
    attr_reader :board

    def initialize(rows, columns)
        @board = Board.new(rows, columns)
        @turns = 0
        # @a_counter = 6
        # @b_counter = 6
        # @c_counter = 6
        # @d_counter = 6
        # @e_counter = 6
        # @f_counter = 6
        # @g_counter = 6
        # @letter_array = ["A", "B", "C", "D", "E", "F", "G"]
        counters = Hash[("A".."G").map { |letter| [letter, 6] }]
    end

    def take_turn
        if @turns.even?
            player_turn
        else 
            computer_turn
        end
        @turns += 1
    end

    def player_turn(player_input)
        column = column_index(player_input)
        if column && valid_column?(player_input)
            row = @counters[player_input] -= 1
            @board.board_map[row][column] = "X"
        end
    end


    # def player_turn(player_input)
    #     row = row_index(player_input)
    #     column = column_index(player_input)
    #     @board.board_map[row][column] = "X"
    # end

    def computer_turn
        computer_choice = @counters.keys.sample
        player_turn(computer_choice)
        #leverage player_turn method to place computer piece
    end

    # def computer_turn
    #     computer_turn = @letter_array.sample
    #     row = row_index(computer_turn)
    #     column = column_index(computer_turn)
    #     @board.board_map[row][column] = "O"
    #     @board.print_board_map
    # end

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