module PavementConditionIndex
  class RatingLookup
    
    attr_accessor :rating

    def initialize(pci: nil)
      @rating = case pci.to_i
      when 85..100
        'Good'
      when 70..85
        'Satisfactory'
      when 55..70
        'Fair'
      when 40..55
        'Poor'
      when 25..40
        'Very Poor'
      when 10..25
        'Serious'
      when 0..10
        'Failed'
      else
        "ERROR"
      end
    end
  end
end