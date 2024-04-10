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

    describe "#computer_turn" do
        it "places a piece on the board" do
            @game.computer_turn
            expect(@game.board.board_map.flatten.include?("O")).to eq(true)
        end
        it "decreases the counter for the column" do
            @game.computer_turn
            expect(@game.counters.values.sum).to eq(41)
        end
    end

    describe "#column_index" do
        it "returns the column index" do
            expect(@game.column_index("A")).to eq(0)
        end
    end

    describe "#valid_column?" do
        it "returns true if the column is valid" do
            expect(@game.valid_column?("A")).to eq(true)
        end
        it "returns false if the column is invalid" do
            expect(@game.valid_column?("H")).to eq(false)
        end
        it "returns false if the column is full" do
            @game.counters["A"] = 0
            expect(@game.valid_column?("A")).to eq(false)
        end
    end

    describe "#game_over?" do
        it "returns :player_won if player has won" do
            @game.board.board_map[0][0] = "X"
            @game.board.board_map[0][1] = "X"
            @game.board.board_map[0][2] = "X"
            @game.board.board_map[0][3] = "X"
            expect(@game.game_over?).to eq(:player_won)
        end
        it "returns :computer_won if computer has won" do
            @game.board.board_map[0][0] = "O"
            @game.board.board_map[0][1] = "O"
            @game.board.board_map[0][2] = "O"
            @game.board.board_map[0][3] = "O"
            expect(@game.game_over?).to eq(:computer_won)
        end
        it "returns :draw if the board is full" do
            @game.board.board_map = Array.new(6) { Array.new(7, "Z") }
            expect(@game.game_over?).to eq(:draw)
        end
        it "returns false if the game is not over" do
            expect(@game.game_over?).to eq(false)
        end
    end

    describe "#restart_game" do
        it "resets the board" do
            @game.board.board_map[0][0] = "X"
            @game.restart_game
            expect(@game.board.board_map.flatten.all? { |cell| cell == "." }).to eq(true)
        end
        it "resets the turns" do
            @game.restart_game
            expect(@game.turns).to eq(0)
        end
        it "resets the counters" do
            @game.restart_game
            expect(@game.counters).to eq({"A" => 6, "B" => 6, "C" => 6, "D" => 6, "E" => 6, "F" => 6, "G" => 6})
        end
    end

end