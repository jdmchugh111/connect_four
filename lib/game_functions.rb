class GameFunctions
    attr_reader :board

    def initialize(rows, columns)
        @board = Board.new(rows, columns)
        @turns = 0
        @a_counter = 6
        @b_counter = 6
        @c_counter = 6
        @d_counter = 6
        @e_counter = 6
        @f_counter = 6
        @g_counter = 6
        @letter_array = ["A", "B", "C", "D", "E", "F", "G"]
    end

    def take_turn
        if @turns.even?
            player_turn
        else @turns.odd?
            computer_turn
        end
        @turns += 1
    end

    def player_turn(player_input)
        row = row_index(player_input)
        column = column_index(player_input)
        @board.board_map[row][column] = "X"
    end

    def computer_turn
        computer_turn = @letter_array.sample
        row = row_index(computer_turn)
        column = column_index(computer_turn)
        @board.board_map[row][column] = "O"
        @board.print_board_map
    end

    def row_index(player_input)
        if player_input == "A"
            @a_counter -= 1
        elsif player_input == "B"
            @b_counter -= 1
        elsif player_input == "C"
            @c_counter -= 1
        elsif player_input == "D"
            @d_counter -= 1
        elsif player_input == "E"
            @e_counter -= 1
        elsif player_input == "F"
            @f_counter -= 1
        elsif player_input == "G"
            @g_counter -= 1
        else
            nil
        end
    end

    def column_index(player_input)
        if player_input == "A"
            0
        elsif player_input == "B"
            1
        elsif player_input == "C"
            2
        elsif player_input == "D"
            3
        elsif player_input == "E"
            4
        elsif player_input == "F"
            5
        elsif player_input == "G"
            6
        else
            nil
        end
    end

    def valid_column(input)
        if input == "A"
            if @a_counter > 0
                true
            end
        elsif input == "B"
            if @b_counter > 0
                true
            end
        elsif input == "C"
            if @c_counter > 0
                true
            end
        elsif input == "D"
            if @d_counter > 0
                true
            end
        elsif input == "E"
            if @e_counter > 0
                true
            end
        elsif input == "F"
            if @f_counter > 0
                true
            end
        elsif input == "G"
            if @g_counter > 0
                true
            end
        else
            false
        end
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
        @a_counter = 6
        @b_counter = 6
        @c_counter = 6
        @d_counter = 6
        @e_counter = 6
        @f_counter = 6
        @g_counter = 6
    end
end