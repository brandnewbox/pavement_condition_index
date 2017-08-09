module PavementConditionIndex
  module SampleUnitConditionSurvey
    class AsphaltSurvey < BaseSurvey

      def initialize(area:,distresses:,identifier: nil,sample_type: :random)
        @identifier = identifier
        @area = area
        @size_of_sample_unit = area # in square feet
        @pavement_type = :asphalt
        @distresses = distresses
        @sample_type = sample_type
      end

    end
  end
end