module PavementConditionIndex
  class ConcreteSampleUnitConditionSurvey < SampleUnitConditionSurvey

    def initialize(area:nil,number_of_slabs:,distresses:nil)
      @area = area
      @sample_unit_size = number_of_slabs
      @pavement_type = :concrete
      @distresses = distresses
    end

  end
end