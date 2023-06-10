require_relative 'base'

module Character
  class Monster < Base
    def initialize(name:, health: nil)
      @name = name
      @health = health || default_health
    end

    def default_health
      30
    end
  end
end
