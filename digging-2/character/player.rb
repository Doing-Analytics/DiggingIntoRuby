module Character
  class Player
    def initialize(name:, )
      @name = name
      @health = health 
      @inventory = default_inventory
    end

    def info
      {
        name: @name,
        health: @health,
        inventory: @inventory
      }
    end

    private
    def default_health
      health_sample = [100 , 130, 150]
      health_sample.sample
    end
    
    def default_inventory
      [heart, heart]
    end
  end
end
