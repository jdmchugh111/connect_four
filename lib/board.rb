class Board 
    attr_accessor   :rows, 
                    :columns,
                    :board_map

    def initialize(rows, columns)
        @rows = rows
        @columns = columns
        @board_map = Array.new(rows) { Array.new(columns, ".") }
        # create board of arrs, each row is an array of columns
    end

    def print_board_map 
        puts "A B C D E F G"
        # print column identifiers
        @board_map.each do |row|
            puts row.join(" ")
        end
    end

    #win conditions use range

    def win?(piece)
        (0..5).each do |row|
            # so first index is always 0, so our range is 0..5 for rows [0,1,2,3,4,5]
            (0..6).each do |col|
                # meaning our range is 0..6 for columns [0,1,2,3,4,5,6]
                return true if @board_map[row][col..col + 3].all? { |cell| cell == piece } #horizontal win
                # of the row we are on, check set of four by col..col + 3 (same as saying check index 0,1,2,3), we are calling the idices cells, then all method will return true if all cells are the same as the piece
                
            end
        end

        (0..5).each do |row|
            (0..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row + i][col] == piece } #vertical win
                # same concept but now we check if the piece is the same for the four cells in the same column, we use i to represent the index of the cell we are checking and to move down the column
            end
        end

        (0..5).each do |row|
            (0..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row + i][col + i] == piece }  #diagonal down right 
                # same same but now we our i (index) again to both row and col to move diagnolly
            end
        end
        # we continue to manipulate the index +/- row and col to check for the other diagnols 
        (0..5).each do |row|
            (0..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row - i][col + i] == piece } #diagonal up right win
            end
        end

        (0..5).each do |row|
            (0..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row - i][col - i] == piece } #diagnol up left
            end
        end

        (0..5).each do |row|
            (0..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row + i][col - i] == piece } # diagnol down left
            end
        end

    end
end