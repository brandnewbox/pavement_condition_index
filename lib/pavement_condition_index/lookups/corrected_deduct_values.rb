module PavementConditionIndex
  module Lookups
    class CorrectedDeductValues

      def initialize(pavement_type:nil, q:nil)
        @pavement_type = pavement_type
        @q = "q#{q}".to_sym
      end

      def call(total_deduct_value)
        coefficients = PavementConditionIndex::Lookups::CalculatedCorrectedDeductCoefficients::COEFFICIENTS[@pavement_type][:coefficients][@q]
        total_deduct_value = total_deduct_value.clamp(0.0,200.0)
        return evaluate_polynomial(*coefficients).call(total_deduct_value).clamp(0.0,100.0)
      end

      private

      def evaluate_polynomial(*coefficients)
        Proc.new {|x| coefficients.map.with_index{|c,i| c*(x**i)}.reduce(:+)}
      end
    end
  end
end