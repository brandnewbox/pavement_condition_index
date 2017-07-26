module PavementConditionIndex
  class CdvIteration

    attr_reader :deduct_values, :q

    def initialize(deduct_values:nil,pavement_type:nil)
      @deduct_values = deduct_values.clone.sort {|x,y| y <=> x}
      @q = @deduct_values.select {|dv| dv > 2.0}.length
      @pavement_type = pavement_type
    end

    def total_deduct_value
      @total_deduct_value ||= @deduct_values.inject(0){|sum,x| sum + x }
    end

    def corrected_deduct_value
      @corrected_deduct_value ||= PavementConditionIndex::Lookups::CorrectedDeductValues.new(pavement_type: @pavement_type, q: @q).call(total_deduct_value)
    end

    # return deduct_values with <lowest value greater than 2.0> changed to 2.0
    # if there are no more iterations left, return nil
    def next_iteration_deduct_values
      return nil if @q == 1

      deduct_values = @deduct_values.clone
      dv_to_change = deduct_values.select{|dv| dv > 2}.to_a.min
      unless dv_to_change.nil?
        dv_index = deduct_values.rindex(dv_to_change)
        deduct_values[dv_index] = 2.0
        deduct_values
      else
        nil
      end
    end
  end
end