module PavementConditionIndex
  class Distress

    attr_reader :type, :severity, :quantity

    def initialize(type:nil,severity:nil,quantity:nil)
      @severity = severity
      @type = type
      @quantity = quantity
    end
  end
end