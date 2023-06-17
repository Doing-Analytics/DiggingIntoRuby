class GameCharacter
  attr_accessor :name, :health, :strength

  def initialize(name, health, strength)
    @name = name        # self 的 @name 實例變量
    @health = health    # self 的 @health 實例變量
    @strength = strength # self 的 @strength 實例變量
  end

  def increase_strength
    @strength += 10 # 增加 self 的 @strength 實例變量
  end

  def print_status
    puts "#{name} - health: #{health}, strength: #{strength}" #  self 的 @name, @health, 和 @strength 實例變量
  end
end

hero = GameCharacter.new('Hero', 100, 50) # GameCharacter 是一個常量，hero 是我們新創建的物件， hero 就是 self
hero.increase_strength # 我們正在執行hero (self) 的 increase_strength 方法
hero.print_status # 我們正在執行 hero (self) 的 print_status 方法，會印出 "Hero - health: 100, strength: 60"
