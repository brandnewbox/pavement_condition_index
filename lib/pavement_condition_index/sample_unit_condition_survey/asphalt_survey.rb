module PavementConditionIndex
  module SampleUnitConditionSurvey
    class AsphaltSurvey < BaseSurvey

      def initialize(area:,distresses:,identifier: nil)
        @identifier = identifier
        @area = area
        @size_of_sample_unit = area # in square feet
        @pavement_type = :asphalt
        @distresses = distresses
      end

    end
  end
end