require "./spec/spec_helper"

RSpec.describe Board do
    before(:each) do
        @board = Board.new(6,7)
    end
    describe "#initialize" do
        it "exists" do
            expect(@board).to be_a(Board)
        end

        it "creates a 6x7 board" do
            expect(@board.rows).to eq(6)
            expect(@board.columns).to eq(7)
        end

        it "creates an empty board" do
            expect(@board.board_map).to eq(Array.new(6) { Array.new(7, ".") })
        end
    end

    #use runner to test terminal output

    #win conditions use range

    def win?(piece)
        (0..5).each do |row|
            # so first index is always 0, so our range is 0..5 for rows [0,1,2,3,4,5]
            (0..6).each do |col|
                # meaning our range is 0..6 for columns [0,1,2,3,4,5,6]
                return true if @board_map[row][col..col + 3].all? { |cell| cell == piece } #horizontal win
                
            end
        end

        (0..5).each do |row|
            (0..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row + i][col] == piece } #vertical win
            end
        end

        (0..5).each do |row|
            (0..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row + i][col + i] == piece }  
                #diagonal down right 
            end
        end

        (0..5).each do |row|
            (0..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row - i][col + i] == piece } #diagonal up right win
            end
        end

        #diagnol up left
        (0..5).each do |row|
            (0..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row - i][col - i] == piece }
            end
        end

        # diagnol down left
        (0..5).each do |row|
            (0..6).each do |col|
                return true if (0..3).all? { |i| @board_map[row + i][col - i] == piece }
            end
        end

    end
end