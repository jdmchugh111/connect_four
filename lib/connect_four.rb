class ConnectFour
    #class for runner file
    def initialize
        @board = Board.new(6,7)
        @turns = 0
        @a_counter = 6
        @b_counter = 6
        @c_counter = 6
        @d_counter = 6
        @e_counter = 6
        @f_counter = 6
        @g_counter = 6
    end

    def play_game
        puts "Welcome to Connect Four!"
        @board.print_board_map
        while !game_over?
        take_turn
        end
        puts "Game Over!"
    end

    def game_setup
        puts "Would you like to play a game of Connect Four? (p/q)"
        puts "enter 'p' to Play! or 'q' to Quit!"
        response = gets.chomp
        if response == "p"
            play_game
        else response == "q"
            puts "Goodbye!"
        end
    end

    def take_turn
        if @turns.even?
            player_turn
        else @turns.odd?
            computer_turn
        end
        @turns += 1
    end

    def player_turn
        puts "Select a column A-G"
        player_input = gets.chomp
        row = row_index(player_input)
        column = column_index(player_input)
        @board.board_map[row][column] = "X"
        puts "The current board is:"
        @board.print_board_map
    end

    def computer_turn
        letter_array = ["A", "B", "C", "D", "E", "F", "G"]
        computer_turn = letter_array.sample
        row = row_index(computer_turn)
        column = column_index(computer_turn)
        @board.board_map[row][column] = "O"
        puts "The current board is:"
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

    def game_over?
        full_board = @board.board_map.find do |row|
            row.include? "."
        end
        if full_board == nil
            true
        end
    end

end