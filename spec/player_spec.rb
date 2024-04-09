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
            @player.increment_mmr
            @player.decrement_mmr
            expect(@player.mmr).to eql(10)
        end
    end

    describe "update_rank" do
        it "updates the class variable rank" do
            @player.increment_mmr
            Player.update_rank(@player.name, @player.mmr)
            expect(Player.rank).to eql({"Player 1" => 20})
        end
    end

    describe ".write_json" do
        it "writes to the JSON file" do
            @player.increment_mmr
            Player.update_rank(@player.name, @player.mmr)
            Player.write_json(Player.rank)
            expect(File.exist?("./lib/rank.json")).to eql(true)
            expect(Player.read_json).to eql({"Player 1" => 20})
        end
    end
        
    describe ".rank" do
        it "returns the class variable rank" do
            @player.increment_mmr
            Player.update_rank(@player.name, @player.mmr)
            Player.write_json(Player.rank)
            expect(Player.rank).to eql({"Player 1" => 20})
        end
    end

end