require "spec_helper"

RSpec.describe PavementConditionIndex do

  ERROR_MARGIN = 3
  ERROR_MARGIN_SMALL = 0.3333

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

    it 'gets the right highest_deduct_value' do
      expect(@sample_survey.highest_deduct_value).to be_within(ERROR_MARGIN).of(25.1)
    end

    it 'gets the right allowable number of deduct_values' do
      expect(@sample_survey.allowable_number_of_deduct_values).to be_within(ERROR_MARGIN_SMALL).of(7.9)
    end

    it 'gets the right maximum_corrected_deduct_value' do
      expect(@sample_survey.maximum_corrected_deduct_value).to be_within(ERROR_MARGIN).of(51)
    end

    it 'has correct pci score' do
      expect(@sample_survey.pci.score).to be_within(ERROR_MARGIN).of(49)
    end

    it 'has correct pci rating' do
      expect(@sample_survey.pci.rating).to eq('Poor')
    end

    it 'has correct pci color' do
      expect(@sample_survey.pci.color).to eq('fc2e1f')
    end

    describe 'zero_distresses' do
      before do
        @empty_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::AsphaltSurvey.new({
          area: 2200,
          distresses: []
        })
      end

      it 'has correct pci score' do
        expect(@empty_sample_survey.pci.score).to be_within(ERROR_MARGIN).of(100)
      end

      it 'has correct pci rating' do
        expect(@empty_sample_survey.pci.rating).to eq('Good')
      end

      it 'has correct pci color' do
        expect(@empty_sample_survey.pci.color).to eq('0f7d1d')
      end
    end

    describe 'distress_groups' do
      before do
        @distress_groups = @sample_survey.distress_groups
        @first_distress_group = @distress_groups.first
      end

      it 'has the right total_quantity' do
        @distress_groups.each_with_index do |distress_group, index|
          expect(distress_group.total_quantity).to eq [13,14,130,143,22,1,21,250][index]
        end
      end

      it 'has the right density_percentage' do
        @distress_groups.each_with_index do |distress_group, index|
          expect(distress_group.density_percentage).to be_within(0.1).of([0.52,0.56,5.20,5.72,0.88,0.04,0.84,10.0][index])
        end
      end

      it 'has the right deduct_values' do
        @distress_groups.each_with_index do |distress_group, index|
          expect(distress_group.deduct_value).to be_within(2).of([7.9,23.4,7.5,25.1,17.9,11.2,6.9,5.3][index])
        end
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
        expect(@first_distress_group.deduct_value).to be_within(ERROR_MARGIN_SMALL).of(7.9)
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

      it 'gets the right total_deduct_values' do
        @cdv_iterations.each_with_index do |cdv_iteration, index|
          expect(cdv_iteration.total_deduct_value).to be_within(ERROR_MARGIN).of([104.7,101.9,96.0,90.5,84.6,75.4,59.5,38.1][index])
        end
      end

      describe 'first cdv_iteration' do 
        it 'gets the right \'q\' value' do
          expect(@first_cdv_iteration.q).to eq(8)
        end

        it 'has the right deduct_values' do
          @first_cdv_iteration.deduct_values.each_with_index do |dv, index|
            expect(dv).to be_within(ERROR_MARGIN).of([25.1,23.4,17.9,11.2,7.9,7.5,6.9,4.8][index])
          end
        end

        it 'gets the right total_deduct_value' do
          cdvi = @first_cdv_iteration
          expect(cdvi.total_deduct_value).to be_within(cdvi.deduct_values.count * ERROR_MARGIN).of(104.7)
        end

        it 'gets the right \'q\' value' do
          expect(@first_cdv_iteration.q).to be_within(1).of(7)
        end

        it 'gets the right corrected_deduct_value' do
          expect(@first_cdv_iteration.corrected_deduct_value).to be_within(ERROR_MARGIN).of(51)
        end
      end
    end

    it 'gets the right highest_deduct_value' do
      expect(@sample_survey.highest_deduct_value).to be_within(ERROR_MARGIN).of(25.1)
    end

    it 'gets the right allowable number of deduct_values' do
      expect(@sample_survey.allowable_number_of_deduct_values).to be_within(ERROR_MARGIN_SMALL).of(7.9)
    end

    it 'gets the right maximum_corrected_deduct_value' do
      expect(@sample_survey.maximum_corrected_deduct_value).to be_within(ERROR_MARGIN).of(51)
    end

    it 'has correct pci score' do
      expect(@sample_survey.pci.score).to be_within(ERROR_MARGIN).of(49)
    end

    it 'has correct pci rating' do
      expect(@sample_survey.pci.rating).to eq('Poor')
    end

    it 'has correct pci color' do
      expect(@sample_survey.pci.color).to eq('fc2e1f')
    end

  end
end
