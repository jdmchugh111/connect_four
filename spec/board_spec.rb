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

    describe "#print_board" do
        xit "prints the board" do
            
        end
    end
end