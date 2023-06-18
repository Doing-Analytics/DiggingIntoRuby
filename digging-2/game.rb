class GameCharacter
  attr_accessor :name, :health, :strength, :defense, :attack_power, :combatant_info

  def initialize(name, health, strength, defense, attack_power)
    @name = name        # self 的 @name 實例變量
    @health = health    # self 的 @health 實例變量
    @strength = strength # self 的 @strength 實例變量
    @defense = defense
    @attack_power = attack_power
    @combatant_info = {}
  end

  def increase_strength
    @strength += 10 # 增加 self 的 @strength 實例變量
  end

  def print_status
    puts "#{name} - health: #{health}, strength: #{strength}" #  self 的 @name, @health, 和 @strength 實例變量
  end

  def attack_model
    default_combatant = {
      attack_power: 40,
      defense: 20
    }
    @combatant_info = block_given? ? yield(default_combatant) : default_combatant

    return unless @defense < @combatant_info[:attack_power]

    @health -= (@combatant_info[:attack_power] - @defense)
    print_status
  end
end

hero = GameCharacter.new('pikachu', 100, 50, 20, 10) # GameCharacter 是一個常量，hero 是我們新創建的物件， hero 就是 self
hero.increase_strength # 我們正在執行hero (self) 的 increase_strength 方法
hero.print_status # 我們正在執行 hero (self) 的 print_status 方法，會印出 "Hero - health: 100, strength: 60"

COMBATANT_ATTACK_WAY = {
  cute_attack: proc {
    combatant_info = { defense: 10 }.tap do |info|
      if rand < 0.7
        p '可愛攻擊！'
        info[:attack_power] = 70
      else
        p '對方更可愛，攻擊減弱'
        info[:attack_power] = 30
      end
    end
  },
  thunder_bolt: proc {
    combatant_info = { defense: 10 }.tap do |info|
      if rand < 0.7
        p '十萬伏特'
        info[:attack_power] = 40
      else
        p '超弱十萬伏特'
        info[:attack_power] = 10
      end
    end
  }
}

@combatant_info = {
  attack_power: '111',
  defense: '222'
}

hero.attack_model do |default_combatant|
  default_combatant.merge(
    COMBATANT_ATTACK_WAY[:cute_attack].call
  )
end

hero.attack_model
