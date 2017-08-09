module PavementConditionIndex
  module SampleUnitConditionSurvey
    class AsphaltSurvey < BaseSurvey

      def initialize(area:,distresses:,identifier: nil,sample_type: :random,number_of_slabs:nil)
        @size_of_sample_unit = area # in square feet
        @pavement_type = :asphalt
        super
      end

    end
  end
end