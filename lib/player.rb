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

    def self.update_rank(name)
        rank[name] = 10
    end

    def self.write_json(rank)
        File.open("./lib/rank.json", "w") do |f|
            f.write(rank.to_json)
        end
    end

    def self.read_json
        JSON.parse(File.read("./lib/rank.json"))
    end
end