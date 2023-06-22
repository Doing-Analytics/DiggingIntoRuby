require 'byebug'
require_relative 'combatant'
require_relative 'health'

class GameCharacter
  attr_accessor :name, :health, :defense, :attack_power, :max_health, :specfic_power

  def initialize(name, health,  defense, attack_power)
    @name = name
    @max_health = health
    @health = health
    @defense = defense
    @attack_power = attack_power
    @specfic_power = ['super health']
  end

  def print_status
    puts "#{name} - health: #{health}"
  end

  def attack_model
    combatant_info = block_given? ? yield : { attack_power: 50, defense: 10 }

    return unless @defense < combatant_info[:attack_power]

    @health -= (combatant_info[:attack_power] - @defense)
  end

  def perform_action(&block)
    puts 'perform action'

    call_action(block) if block_given?
  end

  image.png

  private

  def call_action(block)
    block.call(self)
  end
end

hero = GameCharacter.new('pikachu', 100, 20, 10)
hero.print_status

# 1 yield
hero.attack_model do
  Combatant.attack
end

hero1 = GameCharacter.new('pika-1', 100, 20, 10)
hero2 = GameCharacter.new('pika-2', 100, 20, 10)
hero3 = GameCharacter.new('pika-3', 100, 20, 10)

heroes = [hero1, hero2, hero3]

heroes.each(&:attack_model)
heroes.each(&:heal)

# 3 &block

hero.perform_action do |character|
  character.health += 10
  puts "#{character.name} has breakfast and increases health by 10. Current health: #{character.health}."
end
