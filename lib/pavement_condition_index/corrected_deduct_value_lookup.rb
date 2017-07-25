module PavementConditionIndex
  class CorrectedDeductValueLookup

    def initialize(pavement_type:nil, q:nil)
      @pavement_type = pavement_type
      @q = "q#{q}".to_sym
    end

    CDVS = {
      asphalt: {
        q1: [0, 1, 0].reverse,
        q2: [-0.0017, 0.9193, -4.9393].reverse,
        q3: [-0.0014, 0.8395, -7.228].reverse,
        q4: [-0.0014, 0.8397, -11.9258].reverse,
        q5: [-0.0012, 0.7669, -12.6928].reverse,
        q6: [-0.0011, 0.7543, -15.4929].reverse,
        q7: [-0.0017, 0.8381, -17.9964].reverse,
        q8: [-0.002, 0.8868, -19.3734].reverse, #unofficial
        q9: [-0.0022, 0.9176, -20.1754].reverse, #unofficial
        q10: [-0.0024, 0.9424, -20.6678].reverse #unofficial
      },
      concrete: {
        q1: [0, 1, 0].reverse,
        q2: [-0.0033, 0.9085, -0.1658].reverse,
        q3: [-0.0012, 0.7534, -3.0795].reverse,
        q4: [-0.0014, 0.7484, -5.1386].reverse,
        q5: [0], #unofficial
        q6: [0.0013, 0.5147, -3.8371].reverse,
        q7: [0], #unofficial
        q8: [0], #unofficial
        q9: [0.0018, 0.392, -2.6949].reverse,
        q10: [0] #unofficial
      }
    }

    def call(total_deduct_value)
      coefficients = CDVS[@pavement_type][@q]
      value = generate_polynomial(*coefficients).call(total_deduct_value)
      # NOTE: This is a strange limits thing, because we do not
      # know what do when a distress density goes "out of bounds"
      # on those cool hand drawn charts. For example, in production
      # we are seing a Bumps and Sags HIGH at 66% density, which is 
      # "out of bounds" and returns a value of 176 using our 
      # polynomials, which then generates a negative allowable_deducts
      # value and that is kind of strange. So for now everything must land between
      # 0 and 100. Love, - Nate and Andy, July 2017
      value = 100.0 if value > 100.0
      value = 0.0 if value < 0.0
      value
    end

    private

    def generate_polynomial(*coefficients)
      Proc.new {|x| coefficients.map.with_index{|c,i| c*(x**i)}.reduce(:+)}
    end
  end
end