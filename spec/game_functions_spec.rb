require "./spec/spec_helper"

describe GameFunctions do
    before(:each) do
        @game = GameFunctions.new(6, 7)
    end

    describe "#initialize" do
        it "creates a new instance of of a board with right size" do
            expect(@game.board.rows).to eq(6)
            expect(@game.board.columns).to eq(7)
        end
        it "creates counters for each column" do
            expect(@game.counters).to eq({"A" => 6, "B" => 6, "C" => 6, "D" => 6, "E" => 6, "F" => 6, "G" => 6})
        end
    end

    describe "#player_turn" do
        it "places a piece on the board" do
            @game.player_turn("A", "X")
            expect(@game.board.board_map[5][0]).to eq("X")
        end
        it "decreases the counter for the column" do
            @game.player_turn("A", "X")
            expect(@game.counters["A"]).to eq(5)
        end
    end

end