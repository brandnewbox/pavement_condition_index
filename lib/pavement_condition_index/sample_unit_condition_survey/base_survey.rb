module PavementConditionIndex
  module SampleUnitConditionSurvey
    class BaseSurvey

      attr_reader :area, :pavement_type, :distresses, :size_of_sample_unit

      def distress_groups
        @distress_groups ||= begin
          grouped_distresses = @distresses.group_by{|distress| [distress[:type],distress[:severity]]}
          grouped_distresses.map{|key,value| PavementConditionIndex::DistressGroup.new(type: key[0],severity: key[1],distresses: value,size_of_sample_unit: @size_of_sample_unit,pavement_type: @pavement_type)}
        end
      end

      def cdv_iterations
        @cdv_iterations ||= begin
          cdv_iterations = [PavementConditionIndex::CdvIteration.new(deduct_values: allowed_deduct_values, pavement_type: @pavement_type)] # first row
          while next_iteration_deduct_values = cdv_iterations.last.next_iteration_deduct_values # while next_iteration_deduct_values != nil
            cdv_iterations << PavementConditionIndex::CdvIteration.new(deduct_values: next_iteration_deduct_values, pavement_type: @pavement_type)
          end
          cdv_iterations
        end
      end

      def allowed_deduct_values
        @allowed_deduct_values ||= begin
          dvs = deduct_values.clone
          adv = dvs.shift(allowable_number_of_deduct_values.floor)
          adv << (allowable_number_of_deduct_values % 1).to_f * dvs[0].to_f if dvs.any?
          adv
        end
      end

      def allowable_number_of_deduct_values
        @allowable_number_of_deducts ||= begin
          m = 1 + ((9/98.0) * (100-highest_deduct_value))
          [m,10.0].min
        end
      end

      def highest_deduct_value
        @highest_deduct_value ||= deduct_values.max || 0
      end

      def deduct_values
        @deduct_values ||= distress_groups.map(&:deduct_value).sort {|x,y| y <=> x}
      end

      def maximum_corrected_deduct_value
        @maximum_corrected_deduct_value ||= cdv_iterations.map(&:corrected_deduct_value).max
      end

      def pavement_condition_index
        @pavement_condition_index ||= begin
          pci_score = 100 - maximum_corrected_deduct_value
          PavementConditionIndex::PCI.new(score: pci_score)
        end
      end
      alias_method :pci, :pavement_condition_index

    end
  end
end