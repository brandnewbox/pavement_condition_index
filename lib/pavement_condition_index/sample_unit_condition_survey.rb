module PavementConditionIndex
  class SampleUnitConditionSurvey

    def self.hello_hello
      puts 'hello gem class!'
    end

  end
end

    # attr_reader :area

    # def initialize(area:nil,pavement_type:nil,distresses:nil)
    #   @area = area
    #   @pavement_type = pavement_type
    #   @distresses = distresses.map{|distress| Distress.new(distress)}
    #   @distress_groups = @distresses.map{|distress|

    #   }
    # end

    # def distress_groups
    #   @distress_groups ||= @distresses.group_by(&:type)
    # end

    # def cdv_iterations

    # end

    # def highest_individual_deduct_value
    #   @highest_deduct_value ||= @distresses.map(&:deduct_value).max || 0.0
    # end

    # def allowable_number_of_deducts

    # end

    # def maximum_corrected_deduct_value

    # end

    # def pavement_condition_index
    #   @pci ||= 100.0-maximum_corrected_deduct_value
    # end

    # def rating
    #   @rating ||= PavementConditionIndex::RatingLookup.new(pci: pci).rating
    # end





    # def name
    #   @room.number
    # end

    # def id
    #   @room.id
    # end

    # def max_number_of_samples
    #   @max_number_of_samples ||= distress_groups.map {|g| g[1].length}.inject(0) { |a,b| [a,b].max }
    # end

    # def distress_groups
    #   @distress_groups ||= @room.distress_samples.group_by(&:distress_id)
    # end

    # def distresses
    #   @distresses ||= all_distresses.delete_if {|dg| !dg.valid?}
    # end

    # def all_distresses
    #   @all_distresses ||= distress_groups.map {|distress_group| ParkingLotReport::DistressGroup.new(distress_samples: distress_group[1], sample_area: @area)}
    # end

    # def invalid_distresses
    #   @invalid_distresses ||= all_distresses.delete_if {|dg| dg.valid?}
    # end



    # def allowable_number_of_deducts
    #   @allowable_number_of_deducts ||= begin
    #     f = 1 + ((9/98.0) * (100-highest_deduct_value))
    #     [f,10.0].min
    #   end
    # end

    # def corrected_deduct_value_table
    #   @corrected_deduct_value_table ||= ParkingLotReport::CorrectedDeductValueTable.new(allowable_number_of_deducts: allowable_number_of_deducts, deduct_values: distresses.map(&:deduct_value))
    # end

    # def maximum_corrected_deduct_value
    #   @maximum_corrected_deduct_value ||= corrected_deduct_value_table.rows.map(&:cdv).max || 0
    # end

#   end
# end