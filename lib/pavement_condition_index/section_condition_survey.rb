module PavementConditionIndex
  class SectionConditionSurvey

    attr_reader :sample_unit_condition_surveys, :area, :total_number_of_sample_units, :acceptable_error, :pci_standard_deviation

    def initialize(sample_unit_condition_surveys:,area:,total_number_of_sample_units: nil,acceptable_error: 5,pci_standard_deviation: 10)
      @sample_unit_condition_surveys = sample_unit_condition_surveys
      @area = area
      @total_number_of_sample_units = total_number_of_sample_units
      @acceptable_error = acceptable_error
      @pci_standard_deviation = pci_standard_deviation
      @number_of_sample_unit_condition_surveys = @sample_unit_condition_surveys.length
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
      @sample_is_statistically_significant ||= @number_of_sample_unit_condition_surveys >= required_number_of_sample_unit_condition_surveys
    end

    def sample_spacing_interval
      @sample_spacing_interval ||= (@number_of_sample_unit_condition_surveys/required_number_of_sample_unit_condition_surveys.to_f).floor
    end

    def random_sample_unit_condition_surveys
      @random_sample_unit_condition_surveys ||= @sample_unit_condition_surveys.select {|sample_unit_condition_survey| sample_unit_condition_survey.sample_type == :random}.to_a
    end

    def additional_sample_unit_condition_surveys
      @additional_sample_unit_condition_surveys ||= @sample_unit_condition_surveys.select {|sample_unit_condition_survey| sample_unit_condition_survey.sample_type == :additional}.to_a
    end

    def summation_of_pci_times_area_for_sample_unit_condition_surveys(sample_unit_condition_surveys)
      unless sample_unit_condition_surveys.empty?
        sample_unit_condition_surveys.map{|sample_unit_condition_survey| sample_unit_condition_survey.pavement_condition_index.score * sample_unit_condition_survey.area}.reduce(:+).to_f
      else
        0
      end
    end

    def total_area_of_sample_unit_condition_surveys(sample_unit_condition_surveys)
      unless sample_unit_condition_surveys.empty?
        sample_unit_condition_surveys.map{|sample_unit_condition_survey| sample_unit_condition_survey.area}.reduce(:+).to_f
      else
        0
      end
    end

    def pavement_condition_index
      @pavement_condition_index ||= begin
        raise "Total area of random sample units surveyed must be greater than zero." unless total_area_of_sample_unit_condition_surveys(random_sample_unit_condition_surveys) > 0
        raise "Total area of sample units surveyed cannot exceed area of section." if total_area_of_sample_unit_condition_surveys(@sample_unit_condition_surveys) > @area
        PavementConditionIndex::PCI.new(score: section_pci_score)
      end
    end
    alias_method :pci, :pavement_condition_index

    def section_pci_score
      @section_pci_score ||= begin
        random_sample_weighted_pci = area_weighted_pci_for_sample_units(random_sample_unit_condition_surveys) * (@area - total_area_of_sample_unit_condition_surveys(additional_sample_unit_condition_surveys))
        additional_sample_weighted_pci = area_weighted_pci_for_sample_units(additional_sample_unit_condition_surveys) * total_area_of_sample_unit_condition_surveys(additional_sample_unit_condition_surveys)
        (random_sample_weighted_pci + additional_sample_weighted_pci) / @area
      end
    end

    def area_weighted_pci_for_sample_units(sample_unit_condition_surveys)
      unless total_area_of_sample_unit_condition_surveys(sample_unit_condition_surveys) == 0
        summation_of_pci_times_area_for_sample_unit_condition_surveys(sample_unit_condition_surveys) / total_area_of_sample_unit_condition_surveys(sample_unit_condition_surveys)
      else
        0
      end
    end

  end
end