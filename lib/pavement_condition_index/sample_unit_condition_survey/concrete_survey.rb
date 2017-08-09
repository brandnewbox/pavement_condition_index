module PavementConditionIndex
  module SampleUnitConditionSurvey
    class ConcreteSurvey < BaseSurvey

      def initialize(area:,number_of_slabs:,distresses:,identifier:nil,sample_type: :random)
        @size_of_sample_unit = number_of_slabs # in number of slabs
        @pavement_type = :concrete
        super
      end

    end
  end
end