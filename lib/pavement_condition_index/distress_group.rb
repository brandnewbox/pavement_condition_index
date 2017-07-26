module PavementConditionIndex
  class DistressGroup

    attr_reader :type, :severity, :distresses
    attr_reader :size_of_sample_unit, :pavement_type

    def initialize(type:nil,severity:nil,distresses:nil,size_of_sample_unit:nil,pavement_type:nil)
      @type = type
      @severity = severity
      @distresses = distresses
      @size_of_sample_unit = size_of_sample_unit
      @pavement_type = pavement_type
    end

    def total_quantity
      @total_quantity ||= @distresses.map{|distress| distress[:quantity]}.reduce(:+)
    end

    def density
      @density ||= begin
        if @type == :joint_seal_damage 
          1.0
        else
          total_quantity/@size_of_sample_unit.to_f
        end
      end
    end

    def density_percentage
      @density_percentage ||= density * 100
    end

    def deduct_value
      @deduct_value ||= PavementConditionIndex::Lookups::DeductValues.new(pavement_type: @pavement_type, distress_type: @type, severity: @severity).call(density_percentage)
    end
  end
end