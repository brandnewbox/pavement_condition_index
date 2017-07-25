module PavementConditionIndex
  class CdvIteration

    attr_reader :deduct_values, :q

    def initialize(deduct_values:nil)
      @deduct_values = deduct_values.clone
      @q = @deduct_values.select {|dv| dv > 2.0}.length
    end

    def total_deduct_value
      @total_deduct_value ||= deduct_values.sum
    end

    def corrected_deduct_value
      @corrected_deduct_value ||= 10
    end

    # return deduct_values with [lowest value greater than 2.0] changed to 2.0
    # return nil if there are no more iterations left
    def next_iteration
      return nil if @q == 1

      deduct_values = @deduct_values
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