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

    describe "#win?" do
        it "returns false if there is no win" do
            @board.instance_variable_set(:@board_map, [
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."]
            ])
            expect(@board.win?("X")).to eq(false)
            expect(@board.win?("O")).to eq(false)
        end

        it "returns true if there are four in a row horizontally" do
            @board.instance_variable_set(:@board_map, [
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                ["X", "X", "X", "X", ".", ".", "."]
            ])
            expect(@board.win?("X")).to eq(true)
        end

        it "returns true if there are four in a row vertically" do
            @board.instance_variable_set(:@board_map, [
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                ["X", ".", ".", ".", ".", ".", "."],
                ["X", ".", ".", ".", ".", ".", "."],
                ["X", ".", ".", ".", ".", ".", "."],
                ["X", ".", ".", ".", ".", ".", "."]
            ])
            expect(@board.win?("X")).to eq(true)
        end

        it "returns true if there are four in a row diagonally left" do
            @board.instance_variable_set(:@board_map, [
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                ["X", ".", ".", ".", ".", ".", "."],
                [".", "X", ".", ".", ".", ".", "."],
                [".", ".", "X", ".", ".", ".", "."],
                [".", ".", ".", "X", ".", ".", "."]
            ])
            expect(@board.win?("X")).to eq(true)
        end

        it "returns true if there are four in a row diagonally right" do
            @board.instance_variable_set(:@board_map, [
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "X"],
                [".", ".", ".", ".", ".", "X", "."],
                [".", ".", ".", ".", "X", ".", "."],
                [".", ".", ".", "X", ".", ".", "."]
            ])
            expect(@board.win?("X")).to eq(true)
        end
    end

    describe "#full?" do
        it "returns false when board is not full" do
            @board.instance_variable_set(:@board_map, [
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."]
            ])
        
            expect(@board.full?).to eq(false)
        end

        it "returns true when board is full" do
            @board.instance_variable_set(:@board_map,[
                ["X", "X", "X", "X", "X", "X", "X"],
                ["X", "X", "X", "X", "X", "X", "X"],
                ["X", "X", "X", "X", "X", "X", "X"],
                ["X", "X", "X", "X", "X", "X", "X"],
                ["X", "X", "X", "X", "X", "X", "X"],
                ["X", "X", "X", "X", "X", "X", "X"]])
                expect(@board.full?).to eq(true)
        end
    end

    describe "#reset_board" do
        it "resets to an empty board" do
            @board.instance_variable_set(:@board_map,[
                ["X", "X", "X", "X", "X", "X", "X"],
                ["X", "X", "X", "X", "X", "X", "X"],
                ["X", "X", "X", "X", "X", "X", "X"],
                ["X", "X", "X", "X", "X", "X", "X"],
                ["X", "X", "X", "X", "X", "X", "X"],
                ["X", "X", "X", "X", "X", "X", "X"]])
            @board.reset_board
            empty_board = [[".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."]]
            expect(@board.board_map).to eq(empty_board)
        end
    end

    

    #use runner to test terminal output

    
end