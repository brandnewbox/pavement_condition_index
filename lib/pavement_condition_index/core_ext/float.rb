module PavementConditionIndex
  module CoreExt
    module Float
      def clamp min, max
        [[self, max].min, min].max
      end
    end
  end
end

class Float
  include PavementConditionIndex::CoreExt::Float
end