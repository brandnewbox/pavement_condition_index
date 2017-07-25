module PavementConditionIndex
  class Distress

    attr_reader :type, :severity

    def initialize(severity:nil,type:nil,quantity:nil)
      @severity = severity
      @type = type
      @quantity = quantity
    end
    
  end
end