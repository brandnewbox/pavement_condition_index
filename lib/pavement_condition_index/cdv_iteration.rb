module PavementConditionIndex
  class CdvIteration

    attr_reader :deduct_values, :q

    def initialize(deduct_values: ,pavement_type: ,q: )
      @deduct_values = deduct_values
      @q = q
      @pavement_type = pavement_type
    end

    def adjusted_deduct_values
      @adjusted_deduct_values ||= begin
        c = @deduct_values.clone
        a = c.shift(@q)
        a += c.map {|dv| [dv,2.0].min }
        a
      end
    end

    def total_deduct_value
      @total_deduct_value ||= adjusted_deduct_values.reduce(:+)
    end

    def corrected_deduct_value
      @corrected_deduct_value ||= PavementConditionIndex::Lookups::CorrectedDeductValues.new(pavement_type: @pavement_type, q: @q).call(total_deduct_value)
    end

  end
end