require "spec_helper"

RSpec.describe PavementConditionIndex do

  describe 'concrete_sample_unit_condition_survey' do 
    before do
      @sample_survey = PavementConditionIndex::SampleUnitConditionSurvey.new({
        area: 20, # Required: number of slabs
        pavement_type: :concrete, # Required
        distresses: [
          {severity: :high, type: :joint_seal_damage, quantity: nil}, # joint_seal_damage has no area
          {severity: :low, type: :corner_break, quantity: 3},
          {severity: :medium, type: :corner_break, quantity: 1},
          {severity: :medium, type: :divided_slab, quantity: 3},
          {severity: :medium, type: :patching_small, quantity: 4},
          {severity: :medium, type: :punchouts, quantity: 2},
          {severity: :low, type: :spalling_corner, quantity: 6},
          {severity: :high, type: :spalling_joint, quantity: 1},
        ]
      })
    end

    it 'has a correct area' do
      expect(@sample_survey.area).to eql(20)
    end

    it 'has a correct pavement_type' do
      expect(@sample_survey.pavement_type).to eql(:concrete)
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
        expect(@first_distress_group.type).to eq(:joint_seal_damage)
      end

      it 'has correct distress severity' do
        expect(@first_distress_group.severity).to eq(:high)
      end

      it 'has correct area' do
        expect(@first_distress_group.area).to eq(20)
      end

      it 'has correct pavement_type' do
        expect(@first_distress_group.pavement_type).to eq(:concrete)
      end

      it 'gets a correct total_quantity' do
        expect(@first_distress_group.total_quantity).to eq(20)
      end

      it 'gets a correct density' do
        expect(@first_distress_group.density).to eq(1.0)
      end

      it 'gets a correct density_percentage' do
        expect(@first_distress_group.density_percentage).to eq(100.0)
      end

      it 'gets a correct enough deduct_value' do
        expect(@first_distress_group.deduct_value).to be_within(3).of(8.0)
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
        expect(@cdv_iterations.count).to eq(7)
      end

      it 'has the right deduct_values' do
        @first_cdv_iteration.deduct_values.each_with_index do |dv, index|
          expect(dv).to be_within(3).of([30.5,25.1,12.6,9.0,8.0,7.7,5.8,1.76][index])
        end
          expect(@first_cdv_iteration.deduct_values.last).to be_within(0.2).of(1.76)
      end

      it 'gets the right total_deduct_value' do
        cdvi = @first_cdv_iteration
        expect(cdvi.total_deduct_value).to be_within(cdvi.deduct_values.count * 3).of(100.5)
      end

      it 'gets the right \'q\' value' do
        expect(@first_cdv_iteration.q).to eq(7)
      end

      it 'gets the right corrected_deduct_value' do
        expect(@first_cdv_iteration.corrected_deduct_value).to be_within(3).of(50.0)
      end
    end

    it 'gets the right highest_deduct_value' do
      expect(@sample_survey.highest_deduct_value).to be_within(3).of(30.5)
    end

    it 'gets the right allowable number of deduct_values' do
      expect(@sample_survey.allowable_number_of_deduct_values).to be_within(0.25).of(7.4)
    end

    it 'gets the right maximum_corrected_deduct_value' do
      expect(@sample_survey.maximum_corrected_deduct_value).to be_within(3).of(51)
    end

    it 'gets the right pavement_condition_index' do
      expect(@sample_survey.pavement_condition_index).to be_within(3).of(49)
    end

    it 'gets the right rating' do
      expect(@sample_survey.rating).to eq('Poor')
    end

  end
end