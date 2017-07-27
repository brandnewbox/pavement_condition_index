require "spec_helper"

RSpec.describe PavementConditionIndex do

  LOG_X_VALUES = [0.1, 0.2, 0.4, 1.0, 2.0, 4.0, 10.0, 20.0, 40.0, 100.0]

  DEDUCTS = [
    {pavement_type: :asphalt, distress_type: :alligator_cracking, severity: :low, x: LOG_X_VALUES, expected_y: [ 3.7, 4.0, 4.9, 10.7, 16.9, 23.7, 32.8, 40.0, 48.7, 61.7]},
    {pavement_type: :asphalt, distress_type: :alligator_cracking, severity: :medium, x: LOG_X_VALUES, expected_y: [6.3, 9.9, 13.8, 21.3, 27.9, 35.3, 45.8, 54.8, 64.3, 77.4]},
    {pavement_type: :asphalt, distress_type: :alligator_cracking, severity: :high, x: LOG_X_VALUES, expected_y: [11.9, 15.6, 20.1, 30.0, 39.9, 49.8, 61.1, 70.0, 78.9, 91.1]},
    {pavement_type: :asphalt, distress_type: :bleeding, severity: :low, x: LOG_X_VALUES, expected_y: [0.6, 0.1, 0.1, 0.7, 0.6, 1.4, 3.4, 6.5, 10.9, 20.6]},
    {pavement_type: :asphalt, distress_type: :bleeding, severity: :medium, x: LOG_X_VALUES, expected_y: [0.6, 1.2, 1.6, 3.3, 5.3, 7.7, 13.2, 18.9, 25.9, 40.4]},
    {pavement_type: :asphalt, distress_type: :bleeding, severity: :high, x: LOG_X_VALUES, expected_y: [2.4, 3.0, 3.8, 5.9, 8.6, 13.7, 22.3, 34.1, 49.1, 73.0]},
    {pavement_type: :asphalt, distress_type: :lane_shoulder_drop_off, severity: :low, x: LOG_X_VALUES, expected_y: [1.6, 1.6, 1.6, 2.0, 3.4, 6.1, 11.7, 16.7, 16.7, 16.7]},
    {pavement_type: :asphalt, distress_type: :lane_shoulder_drop_off, severity: :medium, x: LOG_X_VALUES, expected_y: [3.6, 3.6, 3.6, 3.9, 5.5, 9.0, 18.2, 27.6, 27.6, 27.6]},
    {pavement_type: :asphalt, distress_type: :lane_shoulder_drop_off, severity: :high, x: LOG_X_VALUES, expected_y: [5.5, 5.5, 5.5, 6.5, 9.7, 16.1, 33.0, 43.9, 43.9, 43.9]}
  ]

  describe 'asphalt_deduct_value_equations' do
    DEDUCTS.each do |deduct|

      describe "#{deduct[:pavement_type]}/#{deduct[:distress_type]}/#{deduct[:severity]}" do
        it "has the same number of x and expected_y values" do
          expect(deduct[:x].length).to eq deduct[:expected_y].length
        end
        it "has all actual_y values above zero" do
          value_below_zero = false
          deduct[:x].each_with_index do |x, index|
            actual_y = PavementConditionIndex::Lookups::DeductValues.new(pavement_type: deduct[:pavement_type], distress_type: deduct[:distress_type], severity: deduct[:severity]).call(x)
            if actual_y < 0.0
              value_below_zero = true
            end
          end
          expect(value_below_zero).to eq false
        end
        it "has a low sum_of_squares" do
          sum_of_squares = 0
          deduct[:x].each_with_index do |x, index|
            actual_y = PavementConditionIndex::Lookups::DeductValues.new(pavement_type: deduct[:pavement_type], distress_type: deduct[:distress_type], severity: deduct[:severity]).call(x)
            sum_of_squares += (actual_y - deduct[:expected_y][index])**2
          end
          expect(sum_of_squares).to be < 5.0
        end
      end

    end
  end

end