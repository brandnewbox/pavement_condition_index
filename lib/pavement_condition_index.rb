require "pavement_condition_index/version"

module PavementConditionIndex
  extend self

  def self.make_sample_survey
    @sample_survey = PavementConditionIndex::SampleUnitConditionSurvey.new({
      area: 2500, # Required: for asphalt: square footage of entire sample unit, for concrete: number of slabs
      pavement_type: :asphalt, # Required
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
        {severity: :low, type: :weathering_ravelling, quantity: 250}
      ]
    })

    @sample_survey
  end
end

require 'pavement_condition_index/sample_unit_condition_survey'
require 'pavement_condition_index/distress'
require 'pavement_condition_index/distress_group'