module Resources
  module Locations
    Locations = {
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
    }
    def self.get_location
      Locations
    end
  end
end
