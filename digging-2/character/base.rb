module Character
  class Base
    def info
      @info = {}
      instance_variables.each do |var|
        @info[var.to_s.delete('@').to_sym] = instance_variable_get(var)
      end
      @info
    end
  end
end
