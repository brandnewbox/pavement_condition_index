module PavementConditionIndex
  class PCI

    attr_reader :score

    def initialize(score:nil)
      @score = score
    end

    def rating
      @rating ||= begin
        case @score.to_i
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

    def color
      @color ||= begin
        case @score.to_i
        when 85..100
          '#0f7d1d'
        when 70..85
          '#1ec734'
        when 55..70
          '#fefb4a'
        when 40..55
          '#fc2e1f'
        when 25..40
          '#a81a10'
        when 10..25
          '#690d07'
        when 0..10
          '#979797'
        else
          '#000000'
        end
      end
    end

  end
end