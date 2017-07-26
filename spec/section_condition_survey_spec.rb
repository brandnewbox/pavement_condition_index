require "spec_helper"

RSpec.describe PavementConditionIndex do
  
  describe 'concrete_sample_unit_condition_survey' do 
    before do
      @asphalt_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey.new({
        area: 2500,
        distresses: [
          {severity: :low, type: :alligator_cracking, quantity: 5},
          {severity: :low, type: :alligator_cracking, quantity: 4},
          {severity: :low, type: :alligator_cracking, quantity: 4},
          {severity: :high, type: :alligator_cracking, quantity: 8},
          {severity: :high, type: :alligator_cracking, quantity: 6},
          {severity: :low, type: :edge_cracking, quantity: 32},
          {severity: :low, type: :edge_cracking, quantity: 15},
          {severity: :low, type: :edge_cracking, quantity: 18},
          {severity: :low, type: :edge_cracking, quantity: 24},
          {severity: :low, type: :edge_cracking, quantity: 41},
          {severity: :medium, type: :joint_reflection_cracking, quantity: 20},
          {severity: :medium, type: :joint_reflection_cracking, quantity: 15},
          {severity: :medium, type: :joint_reflection_cracking, quantity: 35},
          {severity: :medium, type: :joint_reflection_cracking, quantity: 27},
          {severity: :medium, type: :joint_reflection_cracking, quantity: 23},
          {severity: :medium, type: :joint_reflection_cracking, quantity: 10},
          {severity: :medium, type: :joint_reflection_cracking, quantity: 13},
          {severity: :high, type: :patching_and_utility_cut_patching, quantity: 12},
          {severity: :high, type: :patching_and_utility_cut_patching, quantity: 10},
          {severity: :low, type: :potholes, quantity: 1},
          {severity: :low, type: :rutting, quantity: 4},
          {severity: :low, type: :rutting, quantity: 9},
          {severity: :low, type: :rutting, quantity: 8},
          {severity: :low, type: :weathering, quantity: 250}
        ]
      })

      @concrete_sample_survey = PavementConditionIndex::concreteSampleUnitConditionSurvey.new({
        area: 2500,
        number_of_slabs: 20,
        distresses: [
          {severity: :high, type: :joint_seal_damage, quantity: 123}, # joint_seal_damage has no 'quantity'
          {severity: :low, type: :corner_break, quantity: 3},
          {severity: :medium, type: :corner_break, quantity: 1},
          {severity: :medium, type: :divided_slab, quantity: 3},
          {severity: :medium, type: :patching_small, quantity: 4},
          {severity: :medium, type: :punchouts, quantity: 2},
          {severity: :low, type: :spalling_corner, quantity: 6},
          {severity: :high, type: :spalling_joint, quantity: 1},
        ]
      })

      @section_survey = PavementConditionIndex::SectionConditionSurvey.new({
        sample_unit_condition_surveys: [
          @asphalt_sample_survey,
          @concrete_sample_survey],
        total_number_of_sample_units: 30
        })
    end

    it 'has correct pci' do
      expect(@section_survey.pci).to be_within(3).of(49)
    end

  end

end
