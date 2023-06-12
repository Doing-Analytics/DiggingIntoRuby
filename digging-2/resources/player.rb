module Resources
  module Player
    Player = {
      name: '冒險者',
      health: 100,
      inventory: []
    }

    def self.get_player
      Player
    end
  end
end
