# player class will create player object with name 
# player class will have will create a class variable hash "rank" to store player win stats
# player class will have a method to increment player win stats
# player class will have the ability to read and write a JSON file
require './spec/spec_helper'

describe Player do
    before(:each) do
        @player = Player.new("Player 1")
    end

    describe "#initialize" do
        it "creates a new player object with a name" do
            expect(@player.name).to eql("Player 1")
        end
    end

    describe "#increment_mmr" do
        it "increments the player's MMR" do
            @player.increment_mmr
            expect(@player.mmr).to eql(20)
        end
    end

    describe "#decrement_mmr" do
        it "decrements the player's MMR" do
            @player.decrement_mmr
            expect(@player.mmr).to eql(10)
        end
    end

    describe "update_rank" do
        it "updates the class variable rank" do
            Player.update_rank("Player 1")
            expect(Player.rank).to eql({"Player 1" => 10})
        end
    end

    describe ".write_json" do
        it "writes to the JSON file" do
            Player.write_json(rank)
        end
    end

    describe ".read_json" do
        it "reads the JSON file" do
            
        end
    end
        
    describe ".rank" do
        it "returns the class variable rank" do
            expect(Player.rank).to eql({"Player 1" => 10})
        end
    end

end