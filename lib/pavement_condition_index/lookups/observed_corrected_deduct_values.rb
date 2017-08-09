module PavementConditionIndex
  module Lookups
    class ObservedCorrectedDeductValues

      X_VALUES = [30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0, 110.0, 120.0, 130.0, 140.0, 150.0, 160.0, 170.0, 180.0, 190.0, 200.0]

      # The reference charts do not actually include these lines,
      #   so this is what we think they would be.
      # How the interpolated values were determined [concrete: q5, q7, q8]:
      #   Average (or weighted average) of the lines surrounding it.
      #   This should be a good estimate.
      # How the extrapolated values were determined [asphalt: q8, q9, q10; concrete: q10]:
      #   Took the difference between the last two known, observed q-value arrays, and added that difference
      #   to the last known q-value array. (Asphalt Ex: q8 = q7 + (q7 - q6), q9 = q7 + 2(q7 - q6), etc.)
      #   This estimate may be less accurate.
      ESTIMATED_VALUES = {
        asphalt: {
          q8: [6.1, 13.1, 19.8, 25.6, 31.7, 37.6, 43.0, 48.1, 53.3, 58.7, 63.1, 66.8, 69.8, 72.4, 73.1, 74.2, 74.6, 74.2],
          q9: [6.1, 13.1, 19.8, 25.6, 31.7, 37.6, 43.0, 48.1, 53.3, 58.7, 63.1, 66.2, 68.3, 70.0, 69.0, 69.0, 68.1, 66.2],
          q10: [6.1, 13.1, 19.8, 25.6, 31.7, 37.6, 43.0, 48.1, 53.3, 58.7, 63.1, 65.6, 66.8, 67.6, 64.9, 63.8, 61.6, 58.2]
        },
        concrete: {
          q5: [14.6, 20.5, 26.1, 32.0, 37.6, 43.3, 48.7, 54.1, 59.2, 64.2, 68.8, 73.6, 77.9, 82.2, 86.2, 90.1, 94.0, 97.4],
          q7: [10.9, 16.8, 22.5, 28.1, 33.3, 38.5, 43.8, 48.9, 53.9, 58.6, 63.2, 67.9, 72.1, 76.4, 80.1, 84.0, 87.6, 90.6],
          q8: [9.5, 15.5, 21.2, 26.7, 31.9, 36.7, 41.6, 46.5, 51.5, 56.0, 60.5, 65.3, 69.4, 73.6, 77.5, 81.4, 84.8, 88.2],
          q10: [6.5, 13.1, 18.8, 24.1, 28.9, 32.9, 37.0, 41.7, 46.7, 51.0, 55.1, 60.3, 64.0, 68.2, 72.1, 76.0, 79.2, 83.2]
        }
      }

      OBSERVED_VALUES = {
        asphalt: {
          x_values: X_VALUES,
          expected_y_values: {
            q1: [30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0, 110.0, 120.0, 130.0, 140.0, 150.0, 160.0, 170.0, 180.0, 190.0, 200.0],
            q2: [21.9, 29.3, 36.9, 43.7, 50.4, 57.4, 63.7, 69.8, 75.4, 80.7, 85.6, 90.0, 93.9, 97.6, 101.3, 104.3, 106.7, 108.9],
            q3: [16.7, 24.3, 31.1, 37.8, 44.8, 50.7, 56.9, 63.0, 68.3, 73.1, 78.3, 83.3, 88.0, 92.0, 96.3, 99.8, 103.0, 105.0],
            q4: [12.4, 19.3, 26.3, 33.0, 39.4, 45.6, 51.1, 56.7, 62.4, 67.8, 73.1, 78.5, 82.8, 86.9, 90.4, 93.3, 95.9, 98.1],
            q5: [9.3, 16.3, 22.8, 28.9, 35.2, 40.9, 46.7, 51.9, 57.0, 62.4, 67.2, 72.2, 76.7, 80.9, 84.8, 88.1, 91.1, 93.3],
            q6: [6.1, 13.1, 19.8, 25.6, 31.7, 37.6, 43.0, 48.1, 53.3, 58.7, 63.1, 68.0, 72.8, 77.2, 81.3, 84.6, 87.6, 90.2],
            q7: [6.1, 13.1, 19.8, 25.6, 31.7, 37.6, 43.0, 48.1, 53.3, 58.7, 63.1, 67.4, 71.3, 74.8, 77.2, 79.4, 81.1, 82.2],
            q8: ESTIMATED_VALUES[:asphalt][:q8],
            q9: ESTIMATED_VALUES[:asphalt][:q9],
            q10: ESTIMATED_VALUES[:asphalt][:q10]
          }
        },
        concrete: {
          x_values: X_VALUES,
          expected_y_values: {
            q1: [30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0, 110.0, 120.0, 130.0, 140.0, 150.0, 160.0, 170.0, 180.0, 190.0, 200.0],
            q2: [24.8, 32.2, 39.1, 45.9, 51.7, 57.4, 63.3, 69.1, 75.0, 80.2, 85.7, 90.6, 95.2, 99.8, 104.1, 108.1, 111.7, 114.6],
            q3: [18.7, 25.7, 32.0, 38.1, 44.4, 50.7, 56.5, 62.0, 67.4, 72.4, 77.6, 82.8, 88.0, 92.8, 97.4, 101.7, 105.6, 108.5],
            q4: [16.7, 23.0, 28.5, 34.6, 40.4, 46.1, 51.3, 56.9, 62.0, 67.2, 71.7, 76.7, 80.9, 85.2, 89.6, 93.5, 97.6, 101.7],
            q5: ESTIMATED_VALUES[:concrete][:q5],
            q6: [12.4, 18.0, 23.7, 29.4, 34.8, 40.4, 46.1, 51.3, 56.3, 61.1, 65.9, 70.4, 74.8, 79.1, 82.8, 86.7, 90.4, 93.1],
            q7: ESTIMATED_VALUES[:concrete][:q7],
            q8: ESTIMATED_VALUES[:concrete][:q8],
            q9: [8.0, 14.3, 20.0, 25.4, 30.4, 34.8, 39.3, 44.1, 49.1, 53.5, 57.8, 62.8, 66.7, 70.9, 74.8, 78.7, 82.0, 85.7],
            q10: ESTIMATED_VALUES[:concrete][:q10]
          }
        }
      }

    end
  end
end