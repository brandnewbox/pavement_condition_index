module PavementConditionIndex
  module SampleUnitConditionSurvey
    class ConcreteSurvey < BaseSurvey

      def initialize(area:,number_of_slabs:,distresses:,identifier: nil)
        @identifier = identifier
        @area = area
        @size_of_sample_unit = number_of_slabs # in number of slabs
        @pavement_type = :concrete
        @distresses = distresses
      end

    end
  end
end