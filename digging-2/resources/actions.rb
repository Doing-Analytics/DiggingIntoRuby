module Resources
  module Acctions
    Actions = {
      go: proc do |player, location|
        if locations.include?(location)
          puts locations[location][:description]
          locations[location][:event].call(player)
        else
          puts '你不能去那裡！'
        end
      end,
      heal: proc do |player|
        if player[:inventory].include?('heart')
          player[:health] += 20
          player[:inventory].delete('heart')
          puts '你使用了治療藥劑，生命值恢復了 20 點！'
        else
          puts '你沒有治療藥劑！'
        end
      end,
      attack: proc do |player, target|
        if rand < 0.5
          target[:health] -= 10
          player[:inventory] << 'heart'
          puts "你成功攻擊了 #{target[:name]}！"
        else
          puts '你的攻擊失敗了！'
        end
      end
      # 可以添加更多的行動...
    }
    def self.get_location
      Actions
    end
  end
end
