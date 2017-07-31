# PavementConditionIndex

The pavement_condition_index gem is a tool for generating Pavement Condition Inventory (PCI) scores for assessed sections of pavement. This gem follows the [ASTM Standard Practice for Forads and Parking Lots Pavement Condition Index Surveys](https://www.astm.org/Standards/D6433.htm).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pavement_condition_index'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pavement_condition_index

## Usage

To start using the pavement_condition_index gem, first you will need pavement distress data from a series of sample surveys from within a section of pavement. Once these samples have been assessed, one simply needs to create a SectionConditionSurvey object that contains SampleUnitConditionSurveys representing the pavement section and its samply surveys respectively. Once this is complete, you can now call various methods on your SectionConditionSurvey to the final PCI score, or even the intermediate values used to calculate the PCI if you would like to double check the process.

Example Code:
```
@asphalt_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::AsphaltSurvey.new({
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

@concrete_sample_survey = PavementConditionIndex::SampleUnitConditionSurvey::ConcreteSurvey.new({
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

@section_survey.pci.score
# => 49

@section_survey.pci.rating
# =>'Poor'

@section_survey.pci.color
# => 'fc2e1f'
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andrew-monroe/pavement_condition_index.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
