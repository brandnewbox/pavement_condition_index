module PavementConditionIndex
  module SampleUnitConditionSurvey
    class ConcreteSurvey < BaseSurvey

      def initialize(area:,number_of_slabs:,distresses:,identifier:nil,sample_type: :random)
        @identifier = identifier
        @area = area
        @size_of_sample_unit = number_of_slabs # in number of slabs
        @pavement_type = :concrete
        @distresses = distresses
        @sample_type = sample_type
      end

    end
  end
end