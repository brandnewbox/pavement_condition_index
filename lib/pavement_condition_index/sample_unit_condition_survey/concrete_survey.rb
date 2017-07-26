module PavementConditionIndex
  module SampleUnitConditionSurvey
    class ConcreteSurvey < BaseSurvey

      def initialize(area:nil,number_of_slabs:,distresses:nil)
        @area = area
        @size_of_sample_unit = number_of_slabs # in number of slabs
        @pavement_type = :concrete
        @distresses = distresses
      end

    end
  end
end