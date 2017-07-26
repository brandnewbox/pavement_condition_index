module PavementConditionIndex
  class DistressGroup

    attr_reader :type, :severity, :distresses
    attr_reader :area, :pavement_type

    def initialize(type:nil,severity:nil,distresses:nil,area:nil,pavement_type:nil)
      @type = type
      @severity = severity
      @distresses = distresses
      @area = area
      @pavement_type = pavement_type
    end

    def total_quantity
      @total_quantity ||= @distresses.map(&:quantity).sum
    end

    def density
      @density ||= begin
        if @type == :joint_seal_damage 
          1.0
        else
          total_quantity/@area.to_f
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