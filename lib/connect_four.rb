class ConnectFour
    #class for runner file
    def initialize
        @board = Board.new(6,7)
    end

    def play_game
        puts "Welcome to Connect Four!"
        @board.print_board_map
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
end