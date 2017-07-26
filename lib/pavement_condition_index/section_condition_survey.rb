module PavementConditionIndex
  class SectionConditionSurvey

    attr_reader :sample_unit_condition_surveys, :total_number_of_sample_units, :acceptable_error, :pci_standard_deviation

    def initialize(sample_unit_condition_surveys:,total_number_of_sample_units:nil,acceptable_error:5,pci_standard_deviation:10)
      @sample_unit_condition_surveys = sample_unit_condition_surveys
      @total_number_of_sample_units = total_number_of_sample_units
      @acceptable_error = acceptable_error
      @pci_standard_deviation = pci_standard_deviation
      @number_of_sample_units = @sample_unit_condition_surveys.length
    end

    def required_number_of_sample_unit_condition_surveys
      @required_number_of_sample_unit_condition_surveys ||= begin
        if @total_number_of_sample_units
          t = (@total_number_of_sample_units * @pci_standard_deviation**2)
          b = (@acceptable_error**2/4) * (@total_number_of_sample_units - 1) + @pci_standard_deviation**2
          (t/b.to_f).ceil
        else
          1
        end
      end
    end

    def sample_is_statistically_significant
      @sample_is_statistically_significant ||= @number_of_sample_units >= required_number_of_sample_unit_condition_surveys
    end

    def sample_spacing_interval
      @sample_spacing_interval ||= (@number_of_sample_units/required_number_of_sample_unit_condition_surveys.to_f).floor
    end

    def weighted_pci_scores
      @weighted_pci_scores ||= @sample_unit_condition_surveys.map{|sample_unit_condition_survey| sample_unit_condition_survey.pavement_condition_index * sample_unit_condition_survey.area}
    end

    def sum_of_sample_unit_condition_survey_areas
      @sum_of_sample_unit_condition_survey_areas ||= @sample_unit_condition_surveys.map{|sample_unit_condition_survey| sample_unit_condition_survey.area}.sum
    end

    def pavement_condition_index
      @pavement_condition_index ||= weighted_pci_scores.sum / sum_of_sample_unit_condition_survey_areas.to_f
    end
    alias_method :pci, :pavement_condition_index

    def rating
      @rating ||= PavementConditionIndex::Lookups::PciRatings.new(pavement_condition_index).rating
    end
  end
end