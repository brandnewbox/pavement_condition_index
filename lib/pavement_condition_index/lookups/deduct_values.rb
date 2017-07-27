module PavementConditionIndex
  module Lookups
    class DeductValues

      def initialize(pavement_type:nil,severity:nil,distress_type:nil)
        @pavement_type = pavement_type
        @severity = severity
        @distress_type = distress_type
      end

      DEDUCTS = {
        asphalt:{
          alligator_cracking: {
            low: [0.61, -2.3, 6.62, 16.73, 10.81].reverse,
            medium: [-0.01, -0.39, 4.73, 20.35, 21.49].reverse,
            high: [0.97, -4.05, 5.0, 28.73, 30.84].reverse,
            valid_min: 0.1,
            valid_max: 100.0
          },
          bleeding: {
            low: [0.6, 0.74, 0.77, 0.88, 0.52].reverse,
            medium: [0.3, 1.23, 3.16, 4.97, 3.24].reverse,
            high: [-0.4, 4.02, 7.08, 6.72, 5.62].reverse,
            valid_min: 0.1,
            valid_max: 100.0
          },
          block_cracking: {
            low: [-0.17, 1.57, 3.16, 2.12, 0.78].reverse,
            medium: [-0.12, 1.05, 4.89, 6.79, 3.11].reverse,
            high: [-1.13, 2.82, 9.03, 12.18, 6.94].reverse,
            valid_min: 0.1,
            valid_max: 100.0
          },
          bumps_and_sags: {
            low: [0.76, 6.5, 12.6, 12.56, 7.01].reverse,
            medium: [-3.16, 10.56, 21.84, 26.17, 23.56].reverse,
            high: [-0.73, 6.94, 8.34, 34.05, 52.77].reverse,
            valid_min: 0.1,
            valid_max: 10.0
          },
          corrugation: {
            low: [-0.99, 2.78, 5.81, 3.78, 2.6].reverse,
            medium: [0.27, -1.37, 6.98, 18.6, 15.44].reverse,
            high: [-1.85, 4.0, 3.63, 21.79, 33.64].reverse,
            valid_min: 0.1,
            valid_max: 100.0
          },
          depression: {
            low: [-3.61, 6.91, 11.47, 0.76, 2.99].reverse,
            medium: [-4.59, 6.94, 15.42, 4.22, 7.79].reverse,
            high: [-4.43, 6.06, 15.43, 9.36, 15.91].reverse,
            valid_min: 0.1,
            valid_max: 100.0
          },
          edge_cracking: {
            low: [-1.66, 2.25, 3.97, 3.41, 3.38].reverse,
            medium: [-1.32, -0.08, 6.59, 9.75, 8.75].reverse,
            high: [-2.47, 0.37, 10.68, 15.06, 14.93].reverse,
            valid_min: 0.1,
            valid_max: 20.0
          },
          joint_reflection_cracking: {
            low: [-1.85, 2.75, 7.53, 4.79, 2.24].reverse,
            medium: [-2.99, 1.19, 11.62, 14.53, 8.26].reverse,
            high: [-4.81, 1.34, 18.47, 25.96, 16.16].reverse,
            valid_min: 0.1,
            valid_max: 30.0
          },
          lane_shoulder_drop_off: {
            low: [-2.36, 4.05, 7.42, 2.0, 1.66].reverse,
            medium: [-3.82, 8.29, 12.34, 1.14, 3.55].reverse,
            high: [-5.25, 7.89, 18.07, 6.87, 5.74].reverse,
            valid_min: 0.4,
            valid_max: 20.0
          },
          longitudinal_transverse_cracking: {
            low: [-0.57, 1.19, 6.78, 7.22, 2.32].reverse,
            medium: [-1.29, 0.36, 8.54, 15.38, 8.25].reverse,
            high: [-5.02, 4.02, 19.92, 24.98, 17.68].reverse,
            valid_min: 0.1,
            valid_max: 30.0
          },
          patching_and_utility_cut_patching: {
            low: [-0.96, 1.96, 6.83, 5.78, 1.87].reverse,
            medium: [-0.85, 2.55, 8.02, 11.51, 9.25].reverse,
            high: [-4.48, 5.64, 15.01, 17.39, 17.57].reverse,
            valid_min: 0.1,
            valid_max: 50.0
          },
          polished_aggregate: {
            low: [0.55, 0.95, 0.69, 0.62, 0.36].reverse,
            medium: [0.55, 0.95, 0.69, 0.62, 0.36].reverse,
            high: [0.55, 0.95, 0.69, 0.62, 0.36].reverse,
            valid_min: 0.1,
            valid_max: 100.0
          },
          potholes: {
            low: [0.12, -1.51, 3.16, 40.99, 57.59].reverse,
            medium: [-0.14, -2.4, 8.02, 66.92, 90.31].reverse,
            high: [0.83, -0.38, 2.06, 56.79, 108.73].reverse,
            valid_min: 0.01,
            valid_max: 100.0,
            chart_type: 'logarithmic',
            chart_min: 0.01,
            chart_max: 10.0
          },
          railroad_crossing: {
            low: [-2.19, 3.07, 6.54, 2.39, 1.02].reverse,
            medium: [-2.71, -0.54, 14.74, 17.28, 6.15].reverse,
            high: [-3.54, -2.46, 20.45, 27.53, 20.87].reverse,
            valid_min: 1.0,
            valid_max: 40.0
          },
          raveling: {
            low: [0.01, 1.00, 0.76, 1.60, 2.17].reverse,
            medium: [-0.37, 2.49, 2.93, 4.69, 8.86].reverse,
            high: [-3.34, 5.98, 11.16, 11.58, 15.57].reverse,
            valid_min: 0.1,
            valid_max: 100.0
          },
          rutting: {
            low: [-0.94, 0.37, 7.28, 13.15, 7.05].reverse,
            medium: [-1.26, 0.15, 7.28, 20.22, 17.27].reverse,
            high: [-3.05, 3.13, 9.54, 24.45, 26.39].reverse,
            valid_min: 0.1,
            valid_max: 100.0
          },
          shoving: {
            low: [-1.43, 0.93, 7.66, 9.84, 4.42].reverse,
            medium: [-2.52, 2.7, 13.59, 14.24, 8.81].reverse,
            high: [-2.48, 1.82, 14.06, 20.52, 18.2].reverse,
            valid_min: 0.1,
            valid_max: 50.0
          },
          slippage_cracking: {
            low: [-1.12, 0.13, 10.11, 12.8, 4.17].reverse,
            medium: [-1.96, -0.4, 12.82, 20.6, 11.11].reverse,
            high: [-2.22, -3.43, 16.72, 33.21, 19.82].reverse,
            valid_min: 0.1,
            valid_max: 100.0
          },
          swell: {
            low: [-0.09, 0.23, 4.09, 5.47, 1.75].reverse,
            medium: [0.23, -0.72, 6.09, 17.86, 10.96].reverse,
            high: [-0.85, 2.46, 9.96, 7.46, 33.63].reverse,
            valid_min: 1.0,
            valid_max: 30.0
          },
          weathering: {
            low: [0.01, 1.00, 0.76, 1.60, 2.17].reverse,
            medium: [-0.37, 2.49, 2.93, 4.69, 8.86].reverse,
            high: [-3.34, 5.98, 11.16, 11.58, 15.57].reverse,
            valid_min: 0.1,
            valid_max: 100.0
          }
        },
        concrete: {
          blow_ups: {
            low: [-0.0002, 0.0042, 0.7952, -0.0078].reverse,
            medium: [-0.011, 1.9214, 0.0894].reverse,
            high: [0.0013, -0.1104, 4.4413, 19.0275].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          corner_break: {
            low: [0.0007, 0.8779, 0.0389].reverse,
            medium: [-0.0131, 1.6944, 0.0207].reverse,
            high: [0.0004, -0.0452, 2.788, 0.3587].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          divided_slab: {
            low: [-0.0032, 1.0373, -0.1269].reverse,
            medium: [0.0004, -0.0419, 2.3905, 0.2461].reverse,
            high: [0.0007, -0.0741, 3.6957, 0.452].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          durability_cracking: {
            low: [-0.0014, 0.3673, 0.0971].reverse,
            medium: [-0.0087, 1.0597, 0.057].reverse,
            high: [0.0004, -0.0472, 2.7205, 0.1412].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          faulting: {
            low: [-0.0003, 0.017, 0.1602, -0.2642].reverse,
            medium: [-0.0003, 0.0137, 0.5965, 0.1981].reverse,
            high: [-0.0086, 1.6102, 0.1839].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          joint_seal_damage: {
            low: [2.0],
            medium: [4.0],
            high: [8.0],
            valid_min: 0.0,
            valid_max: 100.0
          },
          lane_shoulder_drop_off: {
            low: [-0.0022, 0.1348, -0.0078].reverse,
            medium: [-0.0089, 0.6067, -0.0155].reverse,
            high: [-0.0113, 0.93, -0.0181].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          linear_cracking: {
            low: [-0.0048, 0.6151, -0.0363].reverse,
            medium: [-0.0112, 0.9263, -0.0466].reverse,
            high: [0.0005, -0.0455, 2.177, 0.4209].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          patching_large_and_utility_cuts: {
            low: [-0.0002, 0.0112, 0.1965, -0.2979].reverse,
            medium: [-0.0002, 0.0139, 0.4502, -0.0738].reverse,
            high: [0.0002, -0.0229, 1.8598, -0.0155].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          patching_small: {
            low: [0.0048, -0.016, -0.0945].reverse,
            medium: [0.0055, 0.1313, 0.0298].reverse,
            high: [-0.0054, 0.5558, -0.022].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          polished_aggregate: {
            low: [-0.0013, 0.2251, -0.0259].reverse,
            medium: [-0.0013, 0.2251, -0.0259].reverse,
            high: [-0.0013, 0.2251, -0.0259].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          popouts: {
            low: [-0.0002, 0.1967, 0.0945].reverse,
            medium: [-0.0002, 0.1967, 0.0945].reverse,
            high: [-0.0002, 0.1967, 0.0945].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          pumping: {
            low: [-0.0006, 0.6211, -0.0635].reverse,
            medium: [-0.0006, 0.6211, -0.0635].reverse,
            high: [-0.0006, 0.6211, -0.0635].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          punchouts: {
            low: [0.0002, -0.0225, 1.7159, 0.0466].reverse,
            medium: [0.0004, -0.0445, 2.6045, 0.1399].reverse,
            high: [0.0007, -0.0725, 3.5601, 0.4934].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          railroad_crossing: {
            low: [0.0002, -0.0175, 1.0867, -0.0032].reverse,
            medium: [0.0009, -0.0632, 2.432, -0.0597].reverse,
            high: [0.0058, -0.318, 7.9948, 0.3211].reverse,
            valid_min: 0.0,
            valid_max: 60.0
          },
          scaling_map_cracking_crazing: {
            low: [0.0033, 0.1646, 0.0376].reverse,
            medium: [-0.0148, 0.9407, 0.0285].reverse,
            high: [0.0004, -0.0408, 2.0622, 0.3768].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          shrinkage_cracks: {
            low: [0.0063, -0.0835, 0.0596].reverse,
            medium: [0.0063, -0.0835, 0.0596].reverse,
            high: [0.0063, -0.0835, 0.0596].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          spalling_corner: {
            low: [0.0063, 0.074, -0.123].reverse,
            medium: [0.0044, 0.2576, -0.0557].reverse,
            high: [-0.0101, 0.7972, 0.0026].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          },
          spalling_joint: {
            low: [-0.0011, 0.2552, 0.0013].reverse,
            medium: [-0.0005, 0.4821, -0.1153].reverse,
            high: [0.0003, -0.0324, 1.7875, 0.1904].reverse,
            valid_min: 0.0,
            valid_max: 100.0
          }
        }
      }

      def call(value)
        valid_max_value = DEDUCTS[@pavement_type][@distress_type][:valid_max]
        valid_min_value = DEDUCTS[@pavement_type][@distress_type][:valid_min]
        value = valid_max_value if value > valid_max_value
        value = valid_min_value if value < valid_min_value
        # Asphalt charts use logarithmic scale, concrete uses linear
        value = @pavement_type == :asphalt ? Math.log10(value.to_f) : value.to_f

        coefficients = DEDUCTS[@pavement_type][@distress_type][@severity]

        generate_polynomial(*coefficients).call(value).clamp(0.0,100.0)
      end

      private

      def generate_polynomial(*coefficients)
        Proc.new {|x| coefficients.map.with_index{|c,i| c*(x**i)}.reduce(:+)}
      end
    end
  end
end