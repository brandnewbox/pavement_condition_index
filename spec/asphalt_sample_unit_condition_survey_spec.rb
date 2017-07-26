require "spec_helper"

RSpec.describe PavementConditionIndex do

  describe 'asphalt_sample_unit_condition_survey' do 
    before do
      @sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::AsphaltSurvey.new({
        identifier: 'B9',
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
    end

    it 'has a correct identifier' do
      expect(@sample_survey.identifier).to eql('B9')
    end

    it 'has a correct area' do
      expect(@sample_survey.area).to eql(2500)
    end

    it 'has a correct pavement_type' do
      expect(@sample_survey.pavement_type).to eql(:asphalt)
    end

    it 'has distresses' do
      expect(@sample_survey.distresses).not_to be nil
    end

    it 'has distress_groups' do
      expect(@sample_survey.distress_groups).not_to be nil
    end

    describe 'distress_groups' do
      before do
        @distress_groups = @sample_survey.distress_groups
        @first_distress_group = @distress_groups.first
      end

      it 'is an array' do
        expect(@distress_groups).to be_an(Array)
      end

      it 'shows correct count' do 
        expect(@distress_groups.count).to eq(8)
      end

      it 'has correct distress type' do
        expect(@first_distress_group.type).to eq(:alligator_cracking)
      end

      it 'has correct distress severity' do
        expect(@first_distress_group.severity).to eq(:low)
      end

      it 'has correct size_of_sample_unit' do
        expect(@first_distress_group.size_of_sample_unit).to eq(2500)
      end

      it 'has correct pavement_type' do
        expect(@first_distress_group.pavement_type).to eq(:asphalt)
      end

      it 'gets a correct total_quantity' do
        expect(@first_distress_group.total_quantity).to eq(13)
      end

      it 'gets a correct density' do
        expect(@first_distress_group.density).to eq(0.0052)
      end

      it 'gets a correct density_percentage' do
        expect(@first_distress_group.density_percentage).to eq(0.52)
      end

      it 'gets a correct enough deduct_value' do
        expect(@first_distress_group.deduct_value).to be_within(3).of(7.9)
      end
    end

    describe 'cdv_iterations' do
      before do
        @cdv_iterations = @sample_survey.cdv_iterations
        @first_cdv_iteration = @cdv_iterations.first
      end

      it 'is an array' do
        expect(@cdv_iterations).to be_an(Array)
      end

      it 'has the right count' do
        expect(@cdv_iterations.count).to eq(8)
      end

      it 'has the right deduct_values' do
        @first_cdv_iteration.deduct_values.each_with_index do |dv, index|
          expect(dv).to be_within(3).of([25.1,23.4,17.9,11.2,7.9,7.5,6.9,4.8][index])
        end
      end

      it 'gets the right total_deduct_value' do
        cdvi = @first_cdv_iteration
        expect(cdvi.total_deduct_value).to be_within(cdvi.deduct_values.count * 3).of(104.7)
      end

      it 'gets the right \'q\' value' do
        expect(@first_cdv_iteration.q).to eq(8)
      end

      it 'gets the right corrected_deduct_value' do
        expect(@first_cdv_iteration.corrected_deduct_value).to be_within(3).of(51)
      end
    end

    it 'gets the right highest_deduct_value' do
      expect(@sample_survey.highest_deduct_value).to be_within(3).of(25.1)
    end

    it 'gets the right allowable number of deduct_values' do
      expect(@sample_survey.allowable_number_of_deduct_values).to be_within(0.25).of(7.9)
    end

    it 'gets the right maximum_corrected_deduct_value' do
      expect(@sample_survey.maximum_corrected_deduct_value).to be_within(3).of(51)
    end

    it 'has correct pci score' do
      expect(@sample_survey.pci.score).to be_within(3).of(49)
    end

    it 'has correct pci rating' do
      expect(@sample_survey.pci.rating).to eq('Poor')
    end

    it 'has correct pci color' do
      expect(@sample_survey.pci.color).to eq('#fc2e1f')
    end

  end
end
