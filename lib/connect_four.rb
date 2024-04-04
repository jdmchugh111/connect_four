class ConnectFour
    #class for runner file
    def initialize
        @board = Board.new(6,7)
    end

    def play_game
        puts "Welcome to Connect Four!"
        @board.print_board_map
    end
end