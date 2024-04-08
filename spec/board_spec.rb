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
        it "returns true if there are four in a row horizontally" do
            @board.instance_variable_set(:@board_map, [
                ["X", "X", "X", "X", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."]
            ])
            expect(@board.win?("X")).to eq(true)
        end

        it "returns true if there are four in a row vertically" do
            @board.instance_variable_set(:@board_map, [
                ["X", ".", ".", ".", ".", ".", "."],
                ["X", ".", ".", ".", ".", ".", "."],
                ["X", ".", ".", ".", ".", ".", "."],
                ["X", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."],
                [".", ".", ".", ".", ".", ".", "."]
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

    #use runner to test terminal output

    
end