require "spec_helper"

RSpec.describe PavementConditionIndex do
  
  describe 'section_condition_survey' do

    describe 'section_with_only_random_samples' do
      before do
        @asphalt_random_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::AsphaltSurvey.new({
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

        @concrete_random_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::ConcreteSurvey.new({
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
            @asphalt_random_sample_survey,
            @concrete_random_sample_survey],
          area: 75000,
          total_number_of_sample_units: 30
        })
      end

      it 'has correct pci score' do
        expect(@section_survey.pci.score).to be_within(3).of(49)
      end

      it 'has correct pci rating' do
        expect(@section_survey.pci.rating).to eq('Poor')
      end

      it 'has correct pci color' do
        expect(@section_survey.pci.color).to eq('fc2e1f')
      end
    end

    describe 'section_with_only_additional_samples' do
      before do
        @asphalt_additional_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::AsphaltSurvey.new({
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
          ],
          sample_type: :additional
        })

        @concrete_additional_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::ConcreteSurvey.new({
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
          ],
          sample_type: :additional
        })

        @section_survey = PavementConditionIndex::SectionConditionSurvey.new({
          sample_unit_condition_surveys: [
            @asphalt_additional_sample_survey,
            @concrete_additional_sample_survey],
          area: 75000,
          total_number_of_sample_units: 30
        })
      end

      it 'has total random sample area of zero' do
        expect(@section_survey.total_area_of_sample_unit_condition_surveys(@section_survey.random_sample_unit_condition_surveys)).to eq(0)
      end

      it 'raises an error because random sample area is zero' do
        expect{@section_survey.pci}.to raise_error(RuntimeError, 'Total area of random sample units surveyed must be greater than zero.')
      end
    end

    describe 'section_with_mixed_samples' do
      before do
        @asphalt_random_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::AsphaltSurvey.new({
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
            {severity: :low, type: :edge_cracking, quantity: 31},
            {severity: :medium, type: :joint_reflection_cracking, quantity: 20},
            {severity: :medium, type: :joint_reflection_cracking, quantity: 15},
            {severity: :medium, type: :joint_reflection_cracking, quantity: 35},
            {severity: :medium, type: :joint_reflection_cracking, quantity: 27},
            {severity: :medium, type: :joint_reflection_cracking, quantity: 23},
            {severity: :medium, type: :joint_reflection_cracking, quantity: 10},
            {severity: :medium, type: :joint_reflection_cracking, quantity: 13},
            {severity: :high, type: :patching_and_utility_cut_patching, quantity: 6},
            {severity: :high, type: :patching_and_utility_cut_patching, quantity: 10},
            {severity: :low, type: :potholes, quantity: 1},
            {severity: :low, type: :rutting, quantity: 4},
            {severity: :low, type: :rutting, quantity: 9},
            {severity: :low, type: :rutting, quantity: 8},
            {severity: :low, type: :weathering, quantity: 250}
          ]
        })

        @concrete_random_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::ConcreteSurvey.new({
          area: 2500,
          number_of_slabs: 20,
          distresses: [
            {severity: :high, type: :joint_seal_damage, quantity: 123}, # joint_seal_damage has no 'quantity'
            {severity: :low, type: :corner_break, quantity: 3},
            {severity: :medium, type: :corner_break, quantity: 1},
            {severity: :medium, type: :divided_slab, quantity: 3},
            {severity: :medium, type: :patching_small, quantity: 11},
            {severity: :medium, type: :punchouts, quantity: 11},
            {severity: :low, type: :spalling_corner, quantity: 20},
            {severity: :high, type: :spalling_joint, quantity: 20},
          ],
          sample_type: :additional
        })

        @section_survey = PavementConditionIndex::SectionConditionSurvey.new({
          sample_unit_condition_surveys: [
            @asphalt_random_sample_survey,
            @concrete_random_sample_survey],
          area: 10000,
          total_number_of_sample_units: 30
        })
      end

      it 'has one random sample with pci of 50' do
        expect(@section_survey.sample_unit_condition_surveys.select{|ss| ss.sample_type == :random}.first.pci.score).to be_within(0.5).of(50)
      end

      it 'has one additional sample with pci of 10' do
        expect(@section_survey.sample_unit_condition_surveys.select{|ss| ss.sample_type == :additional}.first.pci.score).to be_within(0.5).of(10)
      end

      it 'correctly weights random vs additional samples to calculate pci score' do
        expect(@section_survey.pci.score).to be_within(1).of(40)
      end

      it 'has correct pci rating' do
        expect(@section_survey.pci.rating).to eq('Very Poor')
      end

      it 'has correct pci color' do
        expect(@section_survey.pci.color).to eq('a81a10')
      end
    end

    describe 'a section where total sample area exceeds the area of the section' do
      before do
        @asphalt_random_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::AsphaltSurvey.new({
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

        @concrete_random_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::ConcreteSurvey.new({
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
          ],
          sample_type: :additional
        })

        @section_survey = PavementConditionIndex::SectionConditionSurvey.new({
          sample_unit_condition_surveys: [
            @asphalt_random_sample_survey,
            @concrete_random_sample_survey],
          area: 4000,
          total_number_of_sample_units: 30
        })
      end

      it 'raises an error because total sample area exceeds section area' do
        expect{@section_survey.pci}.to raise_error(RuntimeError, 'Total area of sample units surveyed cannot exceed area of section.')
      end
    end

  end
end
