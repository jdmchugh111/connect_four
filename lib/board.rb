class Board 
    attr_accessor   :rows, 
                    :columns,
                    :board_map

    def initialize(rows, columns)
        @rows = rows
        @columns = columns
        @board_map = Array.new(rows) { Array.new(columns, ".") }
    end

    def print_board_map 
        puts "A B C D E F G"
        @board_map.each do |row|
            puts row.join(" ")
        end
    end


    def win?(piece)

        (0..5).each do |row|
            (0..3).each do |col|
                return true if @board_map[row][col..col + 3].all? { |cell| cell == piece } #horizontal win
            end
        end

        (0..2).each do |row|
            (0..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row + i][col] == piece } #vertical win
            end
        end

        (0..2).each do |row|
            (0..3).each do |col|
                return true if (0..3).all? { |i| @board_map[row + i][col + i] == piece }  #diagonal down right 
            end
        end

        (0..2).each do |row|
            (3..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row + i][col - i] == piece } # diagonal down left
            end
        end

        false

    end

    def full?
        @board_map.all? { |row| row.none? { |cell| cell == "." } }
    end

    def reset_board
        @board_map = Array.new(@rows) { Array.new(@columns, ".") }
    end
end