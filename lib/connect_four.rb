class ConnectFour

    def initialize
        @game = GameFunctions.new(6,7)
    end

    def play_game
        puts "Welcome to Connect Four!"
        @game.board.print_board_map
        while !@game.game_over?
            take_turn_terminal
        end
        game_over_output
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

    def take_turn_terminal
        column_input = player_input
        if @game.player_turn(column_input, "X")
            @game.computer_turn
        else
            puts "Please enter a valid column selection"
        end
    end

    def player_input
        puts "Select a column A-G"
        gets.chomp.upcase
    end

    def game_over_output
        if @game.game_over? == :player_won
            puts "Player wins!"
        elsif @game.game_over? == :computer_won
            puts "Computer wins!"
        elsif @game.game_over? == :draw
            puts "It's a draw!"
        end
        new_game
    end

    def new_game
        puts "Would you like to play again?" + "\n" + "Enter 'p' to Play! or 'q' to Quit!"
        response = gets.chomp
        if response == "p"
            @game.restart_game
            play_game
        elsif response == "q"
            puts "Goodbye!"
        else
            puts "Please enter a valid selection"
            new_game
        end
    end
end