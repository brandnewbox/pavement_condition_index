# require "spec_helper"

# RSpec.describe PavementConditionIndex do

#   describe 'concrete_deduct_value_equations' do

#     # Severity: Low
#     describe 'blow_ups deduct value equation' do
#       before do
#         @severity_here = PavementConditionIndex::Lookups::DeductValues.new(pavement_type: :concrete, distress_type: :blow_ups, severity: :severity_here)

#         @x = [0.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0]
#         @y = [0, 8, 16, 23, 29, 34, 37, 40, 42, 43, 44]
#         @error_margin = 3
#       end

#       it "gets :severity_here equation within #{@error_margin} of the right deduct_values" do
#         @x.each_with_index do |x, index|
#           expect(@severity_here.call(x)).to be_within(@error_margin).of(@y[index].to_f)
#         end
#       end

#     end

#     # Severity: Medium
#     describe 'blow_ups deduct value equation' do
#       before do
#         @severity_here = PavementConditionIndex::Lookups::DeductValues.new(pavement_type: :concrete, distress_type: :blow_ups, severity: :severity_here)

#         @x = [0.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0]
#         @y = [0, 19, 33, 46, 57, 66, 72, 77, 80, 81, 83]
#         @error_margin = 3
#       end

#       it "gets :severity_here equation within #{@error_margin} of the right deduct_values" do
#         @x.each_with_index do |x, index|
#           expect(@severity_here.call(x)).to be_within(@error_margin).of(@y[index].to_f)
#         end
#       end

#     end

#   # Severity: High
#     describe 'blow_ups deduct value equation' do
#       before do
#         @severity_here = PavementConditionIndex::Lookups::DeductValues.new(pavement_type: :concrete, distress_type: :blow_ups, severity: :severity_here)

#         @x = [0.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0]
#         @y = [0, 59, 71, 81, 87, 93, 99, 100, 100, 100, 100]
#         @error_margin = 3
#       end

#       it "gets :severity_here equation within #{@error_margin} of the right deduct_values" do
#         @x.each_with_index do |x, index|
#           expect(@severity_here.call(x)).to be_within(@error_margin).of(@y[index].to_f)
#         end
#       end

#     end

#     # Severity: Low
#     describe 'corner_break deduct value equation' do
#       before do
#         @severity_here = PavementConditionIndex::Lookups::DeductValues.new(pavement_type: :concrete, distress_type: :corner_break, severity: :severity_here)

#         @x = [0.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0]
#         @y = [0, 8, 17, 24, 31, 36, 41, 45, 47, 49, 50]
#         @error_margin = 3
#       end

#       it "gets :severity_here equation within #{@error_margin} of the right deduct_values" do
#         @x.each_with_index do |x, index|
#           expect(@severity_here.call(x)).to be_within(@error_margin).of(@y[index].to_f)
#         end
#       end

#     end

#     # Severity: Medium
#     describe 'corner_break deduct value equation' do
#       before do
#         @severity_here = PavementConditionIndex::Lookups::DeductValues.new(pavement_type: :concrete, distress_type: :corner_break, severity: :severity_here)

#         @x = [0.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0]
#         @y = [0, 15, 28, 38, 46, 52, 56, 58, 60, 62, 64]
#         @error_margin = 3
#       end

#       it "gets :severity_here equation within #{@error_margin} of the right deduct_values" do
#         @x.each_with_index do |x, index|
#           expect(@severity_here.call(x)).to be_within(@error_margin).of(@y[index].to_f)
#         end
#       end

#     end

#     # Severity: High
#     describe 'corner_break deduct value equation' do
#       before do
#         @severity_here = PavementConditionIndex::Lookups::DeductValues.new(pavement_type: :concrete, distress_type: :corner_break, severity: :severity_here)

#         @x = [0.0, 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0, 100.0]
#         @y = [0, 25, 40, 52, 60, 66, 71, 74, 76, 78, 79]
#         @error_margin = 3
#       end

#       it "gets :severity_here equation within #{@error_margin} of the right deduct_values" do
#         @x.each_with_index do |x, index|
#           expect(@severity_here.call(x)).to be_within(@error_margin).of(@y[index].to_f)
#         end
#       end

#     end





#   end
# end