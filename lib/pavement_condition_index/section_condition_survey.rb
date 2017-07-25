module PavementConditionIndex
  class SectionConditionSurvey

    attr_reader :area, :sample_area, :sample_units

    ACCEPTABLE_ERROR = 5
    PCI_STANDARD_DEVIATION = 10

    def initialize(area:nil,sample_area:nil,sample_units:nil)
      @area = area
      @sample_area = sample_area
      @sample_units = sample_units
    end

    def required_sample_units
      t = (total_number_of_sample_units * PCI_STANDARD_DEVIATION**2)
      b = (ACCEPTABLE_ERROR**2/4) * (total_number_of_sample_units - 1) + PCI_STANDARD_DEVIATION**2
      (t/b.to_f).ceil
    end

    def sample_is_statistically_significant
      @number_of_sample_units >= required_sample_units
    end

    def sample_spacing_interval
      (number_of_sample_units/required_sample_units.to_f).floor
    end

    def pavement_condition_invenetory
      @pavement_condition_invenetory ||= begin
        weighted_pci_scores = sample_units.map{|sample_unit| sample_unit.pavement_condition_invenetory * sample_unit.area}
        weighted_pci_scores.sum / weighted_pci_scores.size.to_f
      end
    end

    def rating
      @rating ||= PavementConditionIndex::PciRatingLookup.new(pavement_condition_index).rating
    end
  end
end