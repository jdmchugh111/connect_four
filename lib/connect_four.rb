class ConnectFour
    attr_reader :turns

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
        @letter_array = ["A", "B", "C", "D", "E", "F", "G"]
    end

    # def play_game
    #     @board.reset_board #need to create this method in board.rb resets board to empty
    #     @turns = 0
    #     loop do
    #         @board.print_board_map
    #         take_turn
    #         break if game_over?
    #     end
    # end
    #possible refactor option ^^^
    #double check if loop do is the correct loop to use

    def play_game
        puts "Welcome to Connect Four!"
        @board.print_board_map
        while !game_over?
        take_turn
        end
        restart_game
    end
    
    def game_setup
        puts "Welcome to Connect Four!"
        puts "Would you like to play a game of Connect Four?" + "\n" + "Enter 'p' to Play! or 'q' to Quit!"
        response = gets.chomp
        if response == "p"
            play_game
        elsif response == "q"
            puts "Goodbye!"
        else
            puts "Please enter a valid selection"
            game_setup
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
        while !valid_column(player_input)
            puts "Please enter a valid column selection"
            player_input = gets.chomp
        end
        row = row_index(player_input)
        column = column_index(player_input)
        @board.board_map[row][column] = "X"
    end

    def computer_turn
        computer_turn = @letter_array.sample
        while !valid_column(computer_turn)
            computer_turn = @letter_array.sample
        end
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

    # we can refactor valid_column, row_index, and column_index into one method
    # make a place piece method in board.rb that takes in a column and a piece
    # then use them in player_turn and computer_turn as helper methods on this class

    def game_over?
        if @board.win?("X")
            @board.print_board_map
            puts "Player wins!"
            return true
        elsif @board.win?("O")
            @board.print_board_map
            puts "Computer wins!"
            return true
        elsif @board.full?
            puts "It's a draw!"
            return true
        else    
            false
        end
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
        puts "Would you like to play again?" + "\n" + "Enter 'p' to Play! or 'q' to Quit!"
        response = gets.chomp
        if response == "p"
            play_game
        elsif response == "q"
            puts "Goodbye!"
        else
            puts "Please enter a valid selection"
            game_setup
        end
    end
end