module PavementConditionIndex
  module CoreExt
    module Numeric
      def clamp min, max
        [[self, max].min, min].max
      end
    end
  end
end

class Numeric
  include PavementConditionIndex::CoreExt::Numeric
end