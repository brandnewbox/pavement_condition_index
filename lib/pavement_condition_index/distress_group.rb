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
      # @total_quantity ||= begin
        # if @type == :joint_seal_damage 
        #   # @area
        #   55.0
        # else
        #   @distresses.map(&:quantity).sum
        # end
      # end
      55.0
    end

    def density
      @density ||= total_quantity/@area.to_f
    end

    def density_percentage
      @density_percentage ||= density * 100
    end

    def deduct_value
      @deduct_value ||= PavementConditionIndex::Lookups::DeductValues.new(pavement_type: @pavement_type, distress_type: @type, severity: @severity).call(density_percentage)
    end
  end
end