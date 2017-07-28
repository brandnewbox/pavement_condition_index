require "spec_helper"

RSpec.describe PavementConditionIndex do

  describe 'lookup_deduct_values' do
    PavementConditionIndex::Lookups::ObservedDeductValues::OBSERVED_VALUES.each do |pavement_type,distress_types|
      distress_types.each do |distress_type,observed_deduct|
        [:low,:medium,:high].each do |severity|

          describe "#{pavement_type}/#{distress_type}/#{severity}" do

            before do
              @actual_y_values = observed_deduct[:x_values].map {|x| PavementConditionIndex::Lookups::DeductValues.new(pavement_type: pavement_type, distress_type: distress_type, severity: severity).call(x) }
            end
            it "has the same number of x and expected_y values" do
              expect(observed_deduct[:x_values].length).to eq observed_deduct[:expected_y_values][severity].length
            end
            it "has all actual_y_values values above zero" do
              t = @actual_y_values.map {|y| y < 0.0}.include?(true)
              expect(t).to eq false
            end
            it "has a low sum_of_squares (< 15.0)" do
              sum_of_squares = 0.0
              observed_deduct[:x_values].each_with_index do |x, index|
                sum_of_squares += (@actual_y_values[index]) - observed_deduct[:expected_y_values][severity][index].clamp(0.0,100.0)**2
              end
              expect(sum_of_squares).to be < 15.0
            end
          end

        end
      end

    end
  end

end