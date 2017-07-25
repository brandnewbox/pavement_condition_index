module PavementConditionIndex
  class DistressGroup

    attr_reader :type, :severity

    def initialize(distresses:nil)
      @distresses = distresses
    end
    
  end
end