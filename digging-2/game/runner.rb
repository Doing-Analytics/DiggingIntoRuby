Dir[File.expand_path('../resources/*.rb', __dir__)].each { |file| require file }

module Game
  class Runner
    include Resources::Actions
    include Resources::Locations
    include Resources::Monsters
    include Resources::Player

    attr_accessor :actions, :locations, :monsters, :player, :resources

    def initialize
      @resources = %w[Actions Locations Monsters Player]
      load_resources
    end

    def load_resources
      resources.each_with_index do |resource, index|
        puts "Loading...#{(index + 1) * 25}%"
        instance_variable_set("@#{resource.downcase}",
                              Object.const_get("Resources::#{resource}").send("get_#{resource.downcase}"))
        sleep 0.5
      end
      puts 'Loading...complete'
    end

    def play
      while player[:health] > 0
        puts '請選擇你要執行的行動：'
        actions.keys.each do |action|
          puts action
        end
        puts '選擇 ---------------'
        action = gets.chomp.to_sym
        puts '----------------'

        if actions.include?(action)
          execute_action(action)
        else
          puts '未知的行動...'
        end

        puts "你現在的狀態：生命值 #{player[:health]}, 物品 #{player[:inventory].join(', ')}"
      end
    end

    private

    def execute_action(action)
      if action == :go
        execute_go_action(action)
      else
        execute_regular_action(action)
      end
    end

    def execute_go_action(action)
      puts '你想去哪裡？'
      locations.keys.each do |location|
        puts location
      end
      puts '----------------'

      destination = gets.chomp.to_sym
      actions[action].call(player, destination, locations)
    end

    def execute_regular_action(action)
      actions[action].call(player, monsters) # 假設 target 是一個已經定義的對象
    end
  end
end

Game::Runner.new.play
