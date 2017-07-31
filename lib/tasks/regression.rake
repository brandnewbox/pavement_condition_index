require 'pavement_condition_index/lookups/observed_deduct_values'
require 'pavement_condition_index/lookups/observed_corrected_deduct_values'
require 'pp'
require 'matrix'

namespace :regression do

  task :generate_deduct_coefficients do
    output = PavementConditionIndex::Lookups::ObservedDeductValues::OBSERVED_VALUES.map do |pavement_type_key,pavement_type_values|
      remapped_pavement_type_values = pavement_type_values.map do |distress_type_key,distress_type_values|
        coefficients = {low: nil, medium: nil, high: nil}.map do |severity_key,coefficient|
          polynomial_degree = 0
          @candidate_coefficients = []
          @x_values = distress_type_values[:chart_type] == :log ? distress_type_values[:x_values].map {|x| Math.log10(x)} : distress_type_values[:x_values]
          loop do 
            polynomial_degree += 1
            @candidate_coefficients = regress_polynomial(@x_values,distress_type_values[:expected_y_values][severity_key],polynomial_degree)
            candidate_y_values = @x_values.map {|x| evaluate_polynomial(*@candidate_coefficients).call(x) }
            sum_of_squares = 0.0
            distress_type_values[:x_values].each_with_index do |x, index|
              sum_of_squares += (candidate_y_values[index] - distress_type_values[:expected_y_values][severity_key][index])**2
            end
            break if sum_of_squares < 10.0
          end
          [severity_key, @candidate_coefficients]
        end.to_h
        remapped_distress_type_values = {
          valid_min: distress_type_values[:valid_min],
          valid_max: distress_type_values[:valid_max],
          chart_type: distress_type_values[:chart_type],
          coefficients: coefficients
        }
        [distress_type_key,remapped_distress_type_values]
      end.to_h
      [pavement_type_key,remapped_pavement_type_values]
    end.to_h
    pp output
  end

  task :generate_corrected_deduct_coefficients do
    output = PavementConditionIndex::Lookups::ObservedCorrectedDeductValues::OBSERVED_VALUES.map do |pavement_type_key,pavement_type_values|
      coefficients = pavement_type_values[:expected_y_values].map do |q_value_key,observed_values|
        polynomial_degree = 0
        @candidate_coefficients = []
        @x_values = pavement_type_values[:x_values]
        loop do 
          polynomial_degree += 1
          @candidate_coefficients = regress_polynomial(@x_values,observed_values,polynomial_degree)
          candidate_y_values = @x_values.map {|x| evaluate_polynomial(*@candidate_coefficients).call(x) }
          sum_of_squares = 0.0
          pavement_type_values[:x_values].each_with_index do |x, index|
            sum_of_squares += (candidate_y_values[index] - observed_values[index])**2
          end
          break if sum_of_squares < 10.0
        end
        [q_value_key, @candidate_coefficients]
      end.to_h
      remapped_pavement_type_values = {
        coefficients: coefficients
      }
      [pavement_type_key,remapped_pavement_type_values]
    end.to_h
    pp output
  end

  task :generate_calculated_deduct_coefficients_file do
    header =
      "# generate this whole file by running command:\n"+
      "# rake regression:generate_calculated_coefficients_file > lib/pavement_condition_index/lookups/calculated_deduct_coefficients.rb\n"+
      "\n"+ 
      "module PavementConditionIndex\n"+
      "  module Lookups\n"+
      "    class CalculatedDeductCoefficients\n"+
      "\n"+
      "# Output of `rake regression:generate_deduct_coefficients`\n"+
      "COEFFICIENTS = "
    puts header

    Rake::Task["regression:generate_deduct_coefficients"].invoke

    footer = 
      "    end\n"+
      "  end\n"+
      "end\n"
    puts footer
  end

  task :generate_calculated_corrected_deduct_coefficients_file do
    header =
      "# generate this whole file by running command:\n"+
      "# rake regression:generate_calculated_corrected_deduct_coefficients_file > lib/pavement_condition_index/lookups/calculated_corrected_deduct_coefficients.rb\n"+
      "\n"+ 
      "module PavementConditionIndex\n"+
      "  module Lookups\n"+
      "    class CalculatedCorrectedDeductCoefficients\n"+
      "\n"+
      "# Output of `rake regression:generate_corrected_deduct_coefficients`\n"+
      "COEFFICIENTS = "
    puts header

    Rake::Task["regression:generate_corrected_deduct_coefficients"].invoke

    footer = 
      "    end\n"+
      "  end\n"+
      "end\n"
    puts footer
  end  
end

def regress_polynomial x, y, degree
  rows = x.map do |i|
    (0..degree).map { |power| (i ** power).to_f }
  end
  mx, my = Matrix.rows(rows), Matrix.columns([y])
  ((mx.transpose * mx).inv * mx.transpose * my).transpose.row(0).to_a
end

def evaluate_polynomial(*coefficients)
  Proc.new {|x| coefficients.map.with_index{|c,i| c*(x**i)}.reduce(:+)}
end
