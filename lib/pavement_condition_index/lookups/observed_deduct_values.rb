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
          block_cracking: {
            valid_min: 0.1,
            valid_max: 100.0,
            chart_type: :log,
            x_values: LOG_X_VALUES,
            expected_y_values: {
              low: [0.0, 0.0, 0.1, 0.2, 1.3, 3.7, 7.4, 12.2, 17.6, 27.2],
              medium: [0.0, 0.0, 0.1, 2.2, 5.4, 9.1, 15.0, 21.9, 30.2, 42.6],
              high: [0.0, 1.3, 2.7, 6.3, 11.7, 17.4, 28.0, 40.2, 53.7, 71.5]
            }
          },
          bumps_and_sags: {
            valid_min: 0.1,
            valid_max: 10.0,
            chart_type: :log,
            x_values: [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0],
            expected_y_values: {
              low: [1.5, 2.4, 3.5, 8.0, 13.0, 20.4, 39.1],
              medium: [6.5, 10.7, 16.1, 24.8, 34.4, 46.3, 78.1],
              high: [20.6, 30.0, 40.1, 53.7, 65.6, 77.6, 98.9]
            }
          },
          corrugation: {
            valid_min: 0.1,
            valid_max: 100.0,
            chart_type: :log,
            x_values: LOG_X_VALUES,
            expected_y_values: {
              low: [1.3, 1.1, 1.6, 2.8, 4.6, 7.4, 13.7, 20.6, 28.5, 40.0],
              medium: [5.2, 6.7, 9.2, 15.0, 22.0, 28.7, 40.2, 49.3, 58.7, 73.9],
              high: [10.0, 17.8, 25.3, 33.7, 40.4, 48.1, 61.1, 71.7, 82.0, 94.3]
            }
          },
          depression: {
            valid_min: 0.1,
            valid_max: 100.0,
            chart_type: :log,
            x_values: LOG_X_VALUES,
            expected_y_values: {
              low: [3.7, 3.9, 4.0, 4.4, 5.4, 8.1, 16.7, 28.7, 38.9, 47.8],
              medium: [7.6, 7.8, 7.9, 8.7, 10.9, 15.6, 28.7, 41.9, 53.0, 59.4],
              high: [11.9, 13.1, 14.4, 16.9, 20.0, 27.0, 42.8, 55.7, 65.9, 74.3]
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
          longitudinal_transverse_cracking: {
            valid_min: 0.1,
            valid_max: 30.0,
            chart_type: :log,
            x_values: [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0,30.0],
            expected_y_values: {
              low: [0.0, 0.0, 0.3, 2.0, 5.2, 9.3, 16.7, 23.9, 28.5],
              medium: [0.0, 0.7, 3.3, 8.7, 14.1, 20.0, 30.4, 39.8, 44.4],
              high: [3.9, 6.7, 10.9, 18.3, 27.0, 38.9, 60.9, 79.1, 86.9]
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
          polished_aggregate: {
            valid_min: 0.1,
            valid_max: 100.0,
            chart_type: :log,
            x_values: LOG_X_VALUES,
            expected_y_values: {
              low: [0.0, 0.0, 0.1, 0.2, 0.4, 1.1, 3.5, 6.5, 10.2, 20.6],
              medium: [0.0, 0.0, 0.1, 0.2, 0.4, 1.1, 3.5, 6.5, 10.2, 20.6],
              high: [0.0, 0.0, 0.1, 0.2, 0.4, 1.1, 3.5, 6.5, 10.2, 20.6]
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
          railroad_crossing: {
            valid_min: 1.0,
            valid_max: 40.0,
            chart_type: :log,
            x_values: [1.0, 2.0, 4.0, 10.0, 20.0, 40.0],
            expected_y_values: {
              low: [1.3, 1.9, 4.1, 11.1, 16.1, 18.9],
              medium: [5.2, 11.9, 21.3, 37.6, 45.2, 49.4],
              high: [19.3, 29.3, 43.3, 66.3, 75.9, 79.8]
            }
          },
          raveling: {
            valid_min: 0.1,
            valid_max: 100.0,
            chart_type: :log,
            x_values: LOG_X_VALUES,
            expected_y_values: {
              low: [0.0, 0.8, 1.6, 2.4, 2.7, 3.3, 5.2, 7.8, 11.3, 16.3],
              medium: [4.1, 5.6, 7.0, 8.7, 10.6, 12.7, 18.0, 25.0, 32.0, 44.1],
              high: [6.3, 8.8, 11.6, 16.3, 20.3, 27.2, 40.6, 54.8, 65.4, 78.0]
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
          shoving: {
            valid_min: 0.1,
            valid_max: 50.0,
            chart_type: :log,
            x_values: [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0, 40.0, 50.0],
            expected_y_values: {
              low: [0.4, 0.2, 0.5, 4.1, 8.1, 12.4, 20.2, 27.8, 34.8, 36.5],
              medium: [3.1, 3.3, 4.2, 10.0, 15.0, 21.7, 34.8, 49.3, 61.7, 64.8],
              high: [7.6, 9.8, 11.6, 18.9, 25.6, 33.9, 52.2, 66.5, 77.0, 80.0]
            }
          },
          slippage_cracking: {
            valid_min: 0.1,
            valid_max: 100.0,
            chart_type: :log,
            x_values: LOG_X_VALUES,
            expected_y_values: {
              low: [0.0, 0.4, 1.3, 3.5, 8.1, 15.7, 26.7, 35.0, 42.8, 53.3],
              medium: [1.5, 3.3, 5.5, 10.0, 17.0, 27.8, 43.5, 53.3, 60.9, 69.8],
              high: [3.3, 6.7, 10.3, 18.3, 29.3, 45.0, 67.0, 78.0, 84.3, 90.7]
            }
          },
          swell: {
            valid_min: 1.0,
            valid_max: 30.0,
            chart_type: :log,
            x_values: [1.0, 2.0, 4.0, 10.0, 20.0, 30.0],
            expected_y_values: {
              low: [1.5, 3.5, 6.5, 11.9, 15.9, 19.4],
              medium: [10.9, 17.6, 23.9, 34.8, 43.7, 49.4],
              high: [33.1, 36.9, 41.9, 53.3, 63.5, 69.6]
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
        },
        concrete: {
          blow_ups: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 8.1, 16.3, 23.5, 30.6, 34.6, 38.1, 40.4, 42.0, 43.3, 45.0],
              medium: [1.7, 18.7, 34.3, 47.0, 57.8, 66.3, 72.6, 77.0, 80.2, 82.0, 83.3],
              high: [16.3, 58.9, 71.5, 81.1, 87.8, 93.7, 99.8, 105.6, 110.7, 115.9, 120.2]
            }
          },
          durability_cracking: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 3.5, 7.0, 9.8, 12.8, 15.7, 18.1, 20.2, 21.5, 22.2, 22.2],
              medium: [0.0, 9.8, 18.0, 24.4, 29.6, 33.9, 37.0, 38.9, 40.9, 42.4, 43.5],
              high: [0.0, 23.0, 38.5, 48.5, 55.4, 60.0, 63.1, 65.6, 67.4, 68.9, 70.0]
            }
          },
          corner_break: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 8.7, 17.0, 24.8, 31.5, 36.9, 41.7, 45.2, 47.4, 49.3, 50.6],
              medium: [0.0, 15.6, 28.5, 38.9, 46.7, 52.8, 56.3, 58.9, 60.7, 62.4, 64.1],
              high: [0.0, 24.6, 40.9, 52.2, 60.2, 67.0, 71.9, 75.2, 76.7, 78.5, 79.4]
            }
          },
          faulting: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 2.0, 6.9, 13.3, 18.9, 21.5, 24.1, 25.9, 27.4, 28.9, 30.0],
              medium: [0.0, 8.0, 15.7, 23.7, 32.2, 39.4, 44.8, 48.5, 50.9, 52.8, 53.9],
              high: [0.0, 15.6, 29.3, 40.4, 50.7, 60.4, 68.1, 73.9, 78.1, 81.3, 83.1]
            }
          },
          divided_slab: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 9.6, 18.9, 27.2, 33.9, 38.9, 43.3, 46.5, 48.3, 49.8, 50.2],
              medium: [0.0, 20.7, 34.4, 43.7, 50.7, 56.9, 62.0, 66.5, 70.0, 73.0, 75.4],
              high: [0.0, 31.7, 50.4, 61.7, 68.7, 74.6, 79.1, 82.8, 86.1, 89.1, 92.2]
            }
          },
          joint_seal_damage: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0],
              medium: [4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0, 4.0],
              high: [8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0]
            }
          },
          lane_shoulder_drop_off: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 1.1, 2.0, 2.6, 3.3, 3.9, 4.4, 5.0, 5.4, 5.2, 5.2],
              medium: [0.0, 5.2, 9.1, 11.9, 14.1, 15.4, 16.7, 17.6, 18.3, 18.9, 19.1],
              high: [0.0, 8.3, 14.8, 19.4, 23.3, 25.4, 27.6, 29.3, 30.2, 31.5, 32.2]
            }
          },
          patching_small: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 0.0, 0.9, 2.0, 3.0, 3.5, 3.7, 4.1, 4.3, 4.3, 4.3],
              medium: [0.0, 2.2, 4.4, 7.0, 9.4, 11.9, 13.7, 15.0, 15.4, 15.9, 15.7],
              high: [0.0, 4.8, 9.1, 12.8, 16.1, 18.5, 21.3, 23.5, 24.8, 25.2, 25.4]
            }
          },
          linear_cracking: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 5.6, 10.4, 14.6, 17.4, 19.8, 21.1, 22.2, 23.0, 23.3, 23.5],
              medium: [0.0, 8.1, 14.8, 20.0, 24.1, 27.2, 29.8, 32.2, 34.8, 36.9, 38.5],
              high: [0.0, 18.9, 29.6, 36.1, 41.1, 45.9, 50.0, 54.1, 57.6, 61.3, 65.4]
            }
          },
          polished_aggregate: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 2.0, 3.7, 5.4, 6.3, 7.4, 8.1, 8.7, 9.1, 9.8, 9.8],
              medium: [0.0, 2.0, 3.7, 5.4, 6.3, 7.4, 8.1, 8.7, 9.1, 9.8, 9.8],
              high: [0.0, 2.0, 3.7, 5.4, 6.3, 7.4, 8.1, 8.7, 9.1, 9.8, 9.8]
            }
          },
          patching_large_and_utility_cuts: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 2.0, 6.7, 11.7, 15.6, 18.7, 21.3, 23.5, 25.4, 26.9, 28.1],
              medium: [0.0, 5.6, 12.4, 20.0, 27.6, 33.3, 37.6, 41.1, 44.1, 46.9, 48.7],
              high: [0.0, 16.3, 29.1, 38.9, 46.7, 52.6, 57.6, 62.0, 65.9, 69.4, 72.6]
            }
          },
          popouts: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 2.2, 4.1, 5.9, 7.8, 9.8, 12.0, 13.7, 14.6, 15.2, 15.4],
              medium: [0.0, 2.2, 4.1, 5.9, 7.8, 9.8, 12.0, 13.7, 14.6, 15.2, 15.4],
              high: [0.0, 2.2, 4.1, 5.9, 7.8, 9.8, 12.0, 13.7, 14.6, 15.2, 15.4]
            }
          },
          pumping: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 6.1, 11.9, 17.2, 21.9, 26.1, 29.6, 32.8, 35.0, 36.7, 37.8],
              medium: [0.0, 6.1, 11.9, 17.2, 21.9, 26.1, 29.6, 32.8, 35.0, 36.7, 37.8],
              high: [0.0, 6.1, 11.9, 17.2, 21.9, 26.1, 29.6, 32.8, 35.0, 36.7, 37.8]
            }
          },
          punchouts: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 14.6, 26.5, 35.2, 41.3, 46.3, 50.0, 52.6, 53.9, 54.4, 54.6],
              medium: [0.0, 22.2, 38.0, 48.0, 55.0, 60.9, 65.4, 68.5, 70.9, 71.5, 71.3],
              high: [0.0, 30.2, 48.1, 58.7, 66.1, 71.9, 76.1, 80.0, 83.0, 85.4, 87.0]
            }
          },
          railroad_crossing: {
            valid_min: 0.0,
            valid_max: 60.0,
            chart_type: :linear,
            x_values: [0.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0],
            expected_y_values: {
              low: [0.0, 9.4, 15.9, 20.6, 24.1, 27.0, 29.6],
              medium: [0.0, 18.3, 30.0, 35.7, 40.6, 45.4, 50.2],
              high: [0.0, 55.2, 71.1, 79.4, 85.9, 90.7, 95.2]
            }
          },
          scaling_map_cracking_crazing: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 2.2, 4.3, 6.1, 7.8, 9.4, 10.2, 10.6, 11.1, 11.5, 11.7],
              medium: [0.0, 8.3, 14.1, 18.3, 21.1, 23.5, 25.6, 27.4, 28.9, 29.8, 30.6],
              high: [0.0, 18.0, 28.7, 35.4, 40.6, 45.2, 49.4, 53.5, 57.4, 61.3, 65.0]
            }
          },
          shrinkage_cracks: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 0.0, 0.0, 0.9, 2.0, 2.8, 3.1, 3.3, 3.7, 3.7, 3.7],
              medium: [0.0, 0.0, 0.0, 0.9, 2.0, 2.8, 3.1, 3.3, 3.7, 3.7, 3.7],
              high: [0.0, 0.0, 0.0, 0.9, 2.0, 2.8, 3.1, 3.3, 3.7, 3.7, 3.7]
            }
          },
          spalling_corner: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 1.1, 3.1, 5.6, 8.1, 10.2, 11.1, 12.4, 13.7, 14.6, 15.0],
              medium: [0.0, 2.6, 6.3, 9.8, 13.3, 16.1, 18.5, 20.6, 21.7, 22.2, 22.4],
              high: [0.0, 7.0, 12.6, 16.9, 20.4, 23.1, 25.2, 27.6, 29.1, 30.0, 30.6]
            }
          },
          spalling_joint: {
            valid_min: 0.0,
            valid_max: 100.0,
            chart_type: :linear,
            x_values: X_VALUES,
            expected_y_values: {
              low: [0.0, 2.4, 4.6, 6.7, 8.5, 10.2, 11.3, 12.2, 12.8, 12.8, 12.2],
              medium: [0.0, 4.4, 8.9, 13.1, 16.9, 19.1, 20.9, 22.8, 24.1, 25.0, 25.6],
              high: [0.0, 15.4, 25.2, 32.4, 37.4, 41.3, 45.2, 48.5, 51.3, 53.9, 56.1]
            }
          }
        }
      }

    end
  end
end