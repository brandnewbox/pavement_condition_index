module PavementConditionIndex
  module Lookups
    class ObservedDeductValues

      LOG_X_VALUES = [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0, 40.0, 100.0]
      X_VALUES = [0.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0]

      OBSERVED_VALUES = {
        asphalt: {
          alligator_cracking: {
            valid_min: 0.1,
            valid_max: 100.0,
            chart_type: :log,
            x_values: LOG_X_VALUES,
            expected_y_values: {
              low: [ 3.7, 4.0, 4.9, 10.7, 16.9, 23.7, 32.8, 40.0, 48.7, 61.7],
              medium: [6.3, 9.9, 13.8, 21.3, 27.9, 35.3, 45.8, 54.8, 64.3, 77.4],
              high: [11.9, 15.6, 20.1, 30.0, 39.9, 49.8, 61.1, 70.0, 78.9, 91.1]
            }
          },
          bleeding: {
            valid_min: 0.1,
            valid_max: 100.0,
            chart_type: :log,
            x_values: LOG_X_VALUES,
            expected_y_values: {
              low: [0.6, 0.1, 0.1, 0.7, 0.6, 1.4, 3.4, 6.5, 10.9, 20.6],
              medium: [0.6, 1.2, 1.6, 3.3, 5.3, 7.7, 13.2, 18.9, 25.9, 40.4],
              high: [2.4, 3.0, 3.8, 5.9, 8.6, 13.7, 22.3, 34.1, 49.1, 73.0]
            }
          },
          edge_cracking: {
            valid_min: 0.1,
            valid_max: 20.0,
            chart_type: :log,
            x_values: [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0],
            expected_y_values: {
              low: [ 0.0, 1.4, 2.1, 3.7, 4.9, 6.6, 11.5, 15.4],
              medium: [4.3,4.9, 5.9, 9.1, 12.5, 17.0, 24.3, 28.5],
              high: [7.2, 9.3, 11.0, 14.6, 20.5, 27.4, 40.6, 46.7]
            }
          },
          joint_reflection_cracking: {
            valid_min: 0.1,
            valid_max: 30.0,
            chart_type: :log,
            x_values: [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0,30.0],
            expected_y_values: {
              low: [0.0, 1.0, 1.6, 3.0, 4.9, 8.7, 15.6, 22.6, 27.6],
              medium: [1.3, 2.3, 4.2, 8.3, 12.7, 20.5, 35.0, 41.7, 43.7],
              high: [2.4, 5.8, 10.3, 16.3, 23.4, 38.3, 62.6, 71.7, 73.9]
            }
          },
          lane_shoulder_drop_off: {
            valid_min: 0.5,
            valid_max: 15.0,
            chart_type: :log,
            x_values: [0.5, 1.0, 2.0, 4.0, 10.0, 15.0],
            expected_y_values: {
              low: [1.6, 2.0, 3.4, 6.1, 11.7, 16.7],
              medium: [3.6, 3.9, 5.5, 9.0, 18.2, 27.6],
              high: [5.5, 6.5, 9.7, 16.1, 33.0, 43.9]
            }
          },
          patching_and_utility_cut_patching: {
            valid_min: 0.1,
            valid_max: 50.0,
            chart_type: :log,
            x_values: [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0, 40.0, 50.0],
            expected_y_values: {
              low: [0.0, 0.3, 0.5, 2.0, 4.3, 7.9, 16.1, 23.3, 31.3, 33.0],
              medium: [2.6, 3.8, 5.7, 9.4, 13.6, 19.6, 31.3, 42.0, 54.1, 57.6],
              high: [6.3, 8.6, 12.9, 19.4, 25.3, 33.7, 51.9, 67.0, 77.6, 80.2]
            }
          },
          potholes: {
            valid_min: 0.01,
            valid_max: 10.0,
            chart_type: :log,
            x_values: [0.01, 0.02, 0.04, 0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0],
            expected_y_values: {
              low: [1.8, 5.6, 10.9, 21.7, 31.6, 42.5, 58.3, 71.4, 84.0, 100.0],
              medium: [6.0, 10.7, 18.9, 34.6, 49.7, 66.0, 91.7, 111.9, 132.5, 159.1],
              high: [20.1, 27.6, 37.6, 55.4, 71.4, 87.7, 109.6, 125.6, 141.8, 162.6]
            }
          },
          rutting: {
            valid_min: 0.1,
            valid_max: 100.0,
            chart_type: :log,
            x_values: LOG_X_VALUES,
            expected_y_values: {
              low: [0.6, 0.8, 2.7, 7.2, 12.5, 18.5, 26.5, 34.8, 44.1, 49.6],
              medium: [3.5, 6.4, 9.9, 17.2, 24.2, 31.8, 43.7, 54.1, 61.1, 67.6],
              high: [5.4, 11.6, 17.9, 26.9, 35.1, 45.0, 61.1, 73.7, 83.1, 90.0]
            }
          },
          weathering: {
            valid_min: 0.1,
            valid_max: 100.0,
            chart_type: :log,
            x_values: LOG_X_VALUES,
            expected_y_values: {
              low: [0.0, 0.8, 1.6, 2.4, 2.7, 3.3, 5.2, 7.8, 11.3, 16.3],
              medium: [4.1, 5.6, 7.0, 8.7, 10.6, 12.7, 18.0, 25.0, 32.0, 44.1],
              high: [6.3, 8.8, 11.6, 16.3, 20.3, 27.2, 40.6, 54.8, 65.4, 78.0]
            }
          }


          

        }
      }

    end
  end
end