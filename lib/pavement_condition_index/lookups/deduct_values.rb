module PavementConditionIndex
  module Lookups
    class DeductValues

      def initialize(pavement_type:nil,severity:nil,distress_type:nil)
        @pavement_type = pavement_type
        @severity = severity
        @distress_type = distress_type
      end

      def call(value)
        deduct = PavementConditionIndex::Lookups::CalculatedDeductCoefficients::COEFFICIENTS[@pavement_type][@distress_type]
        coefficients = deduct[:coefficients][@severity]
        value = value.clamp(deduct[:valid_min],deduct[:valid_max])
        # Asphalt charts use logarithmic scale, concrete uses linear
        value = deduct[:chart_type] == :log ? Math.log10(value.to_f) : value.to_f
        return evaluate_polynomial(*coefficients).call(value).clamp(0.0,100.0)
      end

      private

      def evaluate_polynomial(*coefficients)
        Proc.new {|x| coefficients.map.with_index{|c,i| c*(x**i)}.reduce(:+)}
      end
    end
  end
end