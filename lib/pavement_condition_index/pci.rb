module PavementConditionIndex
  class PCI

    attr_reader :score

    def initialize(score:nil)
      @score = score
    end

    def lookup
      @lookup ||= begin
        case @score.to_i
        when 85..100
          {rating: 'Good', color: '0f7d1d'}
        when 70..85
          {rating: 'Satisfactory', color: '1ec734'}
        when 55..70
          {rating: 'Fair', color: 'fefb4a'}
        when 40..55
          {rating: 'Poor', color: 'fc2e1f'}
        when 25..40
          {rating: 'Very Poor', color: 'a81a10'}
        when 10..25
          {rating: 'Serious', color: '690d07'}
        when 0..10
          {rating: 'Failed', color: '979797'}
        else
          {rating: 'ERROR', color: '000000'}
        end
      end
    end

    def rating
      lookup[:rating]
    end

    def color
      lookup[:color]
    end

  end
end