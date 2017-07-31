require "spec_helper"

RSpec.describe PavementConditionIndex do

  ERROR_MARGIN = 3
  ERROR_MARGIN_SMALL = 0.3333

  describe 'concrete_sample_unit_condition_survey' do 
    before do
      @sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::ConcreteSurvey.new({
        identifier: 'G30',
        area: 2500,
        number_of_slabs: 20,
        distresses: [
          {severity: :high, type: :joint_seal_damage, quantity: 123}, # joint_seal_damage has no area
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

    it 'has a correct identifier' do
      expect(@sample_survey.identifier).to eql('G30')
    end

    it 'has a correct area' do
      expect(@sample_survey.area).to eql(2500)
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

    it 'gets the right highest_deduct_value' do
      expect(@sample_survey.highest_deduct_value).to be_within(ERROR_MARGIN).of(30.5)
    end

    it 'gets the right allowable number of deduct_values' do
      expect(@sample_survey.allowable_number_of_deduct_values).to be_within(ERROR_MARGIN_SMALL).of(7.4)
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
        @empty_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::ConcreteSurvey.new({
          area: 2200,
          number_of_slabs: 20,
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
          expect(distress_group.total_quantity).to eq [123,3,1,3,4,2,6,1][index]
        end
      end

      it 'has the right density_percentage' do
        @distress_groups.each_with_index do |distress_group, index|
          expect(distress_group.density_percentage).to be_within(0.1).of([100.0,15.0,5.0,15.0,20.0,10.0,30.0,5.0][index])
        end
      end

      it 'has the right deduct_values' do
        @distress_groups.each_with_index do |distress_group, index|
          expect(distress_group.deduct_value).to be_within(ERROR_MARGIN).of([8.0,12.6,7.7,30.5,4.4,25.1,5.8,9.0][index])
        end
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
        expect(@first_distress_group.size_of_sample_unit).to eq(20)
      end

      it 'has correct pavement_type' do
        expect(@first_distress_group.pavement_type).to eq(:concrete)
      end

      it 'gets a correct total_quantity' do
        expect(@first_distress_group.total_quantity).to eq(123)
      end

      it 'gets a correct density' do
        expect(@first_distress_group.density).to eq(1.0)
      end

      it 'gets a correct density_percentage' do
        expect(@first_distress_group.density_percentage).to eq(100.0)
      end

      it 'gets a correct enough deduct_value' do
        expect(@first_distress_group.deduct_value).to be_within(ERROR_MARGIN).of(8.0)
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
        expect(@cdv_iterations.count).to be_within(1).of(7)
      end

      it 'gets the right total_deduct_values' do
        @cdv_iterations.each_with_index do |cdv_iteration, index|
          expect(cdv_iteration.total_deduct_value).to be_within(ERROR_MARGIN).of([100.5,96.7,91.0,85.0,78.0,67.4,44.3][index])
        end
      end

      it 'gets the right corrected_deduct_values' do
        @cdv_iterations.each_with_index do |cdv_iteration, index|
          expect(cdv_iteration.corrected_deduct_value).to be_within(ERROR_MARGIN).of([50.0,49.5,51.0,49.0,50.0,50.0,44.3][index])
        end
      end

      describe 'first cdv_iteration' do 
        it 'has the right adjusted_deduct_values' do
          @first_cdv_iteration.adjusted_deduct_values.each_with_index do |dv, index|
            expect(dv).to be_within(ERROR_MARGIN).of([30.5,25.1,12.6,9.0,8.0,7.7,5.8,1.76][index])
          end
        end

        it 'gets the right total_deduct_value' do
          cdvi = @first_cdv_iteration
          expect(cdvi.total_deduct_value).to be_within(cdvi.deduct_values.count * ERROR_MARGIN).of(100.5)
        end

        it 'gets the right \'q\' value' do
          expect(@first_cdv_iteration.q).to be_within(1).of(7)
        end

        it 'gets the right corrected_deduct_value' do
          expect(@first_cdv_iteration.corrected_deduct_value).to be_within(ERROR_MARGIN).of(50.0)
        end
      end
    end

    it 'gets the right highest_deduct_value' do
      expect(@sample_survey.highest_deduct_value).to be_within(ERROR_MARGIN).of(30.5)
    end

    it 'gets the right allowable number of deduct_values' do
      expect(@sample_survey.allowable_number_of_deduct_values).to be_within(ERROR_MARGIN_SMALL).of(7.4)
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
