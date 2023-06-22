module Combatant
  COMBATANT_ATTACK_WAY = {
    cute_attack: proc {
      { defense: 10 }.tap do |info|
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
      { defense: 10 }.tap do |info|
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

  def self.default_combatant
    {
      attack_power: 40,
      defense: 20
    }
  end

  def self.attack
    attack_way = COMBATANT_ATTACK_WAY.keys.sample
    default_combatant.merge(
      COMBATANT_ATTACK_WAY[attack_way].call
    )
  end
end
