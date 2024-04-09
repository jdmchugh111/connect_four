require 'json'

class Player
    @@rank = {}

    attr_reader :name, :mmr

    def initialize(name)
        @name = name
        @mmr = 0
    end

    def increment_mmr
        @mmr += 20
    end

    def decrement_mmr
        @mmr -= 10
    end

    def self.update_rank(name, mmr)
        @@rank[name] = mmr
    end

    def self.write_json(rank)
        File.open("./lib/rank.json", "w") do |f|
            f.write(JSON.generate(rank))
        end
    end

    def self.rank
        @@rank
    end

    def self.read_json
        JSON.parse(File.read("./lib/rank.json"))
    end

    def self.generate_player(name)
        new_player = Player.new(name)
        update_rank(name, new_player.mmr)
        new_player
    end

    # def player_won
    #     increment_mmr
    #     Player.update_rank(player.name, player.mmr)
    #     Player.write_json(Player.rank)
    # end

    # def player_lost
    #     decrement_mmr
    #     Player.update_rank(player.name, player.mmr)
    #     Player.write_json(Player.rank)
    # end

end