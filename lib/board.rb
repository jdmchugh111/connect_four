class Board 
    attr_reader :rows, :columns, :board_map
    def initialize(rows, columns)
        @rows = rows
        @columns = columns
        @board_map = Array.new(rows) { Array.new(columns, ".") }
        # create board arr of arrs, each row is an array of columns
    end

    def print_board_map 
        puts "A B C D E F G"
        # print column identifiers
        @board_map.each do |row|
            puts row.join(" ")
        end
    end
end