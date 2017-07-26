module PavementConditionIndex
  class AsphaltSampleUnitConditionSurvey < SampleUnitConditionSurvey

    def initialize(area:nil,distresses:nil)
      @area = area
      @sample_unit_size = area
      @pavement_type = :asphalt
      @distresses = distresses
    end

  end
end