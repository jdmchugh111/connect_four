require 'json'

class Player
    @@rank = {}

    attr_reader :name, :mmr

    def initialize(name, mmr)
        @name = name
        @mmr = mmr
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

    def self.write_json
        players_data = read_json
        updated_data = players_data.merge(@@rank)

        File.open("./lib/rank.json", "w") do |file|
            file.write(JSON.generate(updated_data))
        end
    end

    def self.rank
        @@rank
    end

    def self.read_json
        JSON.parse(File.read("./lib/rank.json"))
    end

    def self.generate_player(name)
        mmr = last_updated_rank(name)
        new_player = Player.new(name, mmr)
        update_rank(name, mmr)
        new_player
    end

    def self.last_updated_rank(name)
        players_data = read_json
        mmr = players_data[name] || 0
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