module Resources
  module Locations
    Locations = {
      forest: {
        description: '你來到了一片深沉的森林。',
        event: lambda { |player|
          if rand < 0.5
            puts '你被野獸攻擊！'
            player[:health] -= 10
          else
            puts '你在森林中找到了一個寶藏箱！'
            player[:inventory] << '寶藏'
          end
        }
      },
      boss_battle: {
        description: '竟然敢闖入boss房間！',
        event: lambda { |player|
          if rand < 0.7
            puts 'boss 普通攻擊，並退出房間'
            player[:health] -= 20
          elsif rand < 0.2
            puts 'boss 全力攻擊，並退出房間'
            player[:health] -= 50
          else
            pusts 'boss 送你一個寶藏，並當你朋友'
            player[:inventory] << '寶藏'
          end
        }
      }
    }
    def self.get_locations
      Locations
    end
  end
end
