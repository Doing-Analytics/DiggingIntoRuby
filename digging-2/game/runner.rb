module Game
  class Runner
    def initialize(player:)
      @player = player
      @actions = actions
    end

    def play
      while player[:health] > 0
        puts '請選擇你要執行的行動：'
        action = gets.chomp.to_sym

        if actions.include?(action)
          # 如果行動是 'go'，那麼需要讓玩家選擇他們想去的地點
          if action == :go
            puts '你想去哪裡？'
            location = gets.chomp.to_sym
            actions[action].call(player, location)
          else
            actions[action].call(player, target) # 假設 target 是一個已經定義的對象
          end
        else
          puts '未知的行動...'
        end

        puts "你現在的狀態：生命值 #{player[:health]}, 物品 #{player[:inventory].join(', ')}"
      end
    end
  end
end
