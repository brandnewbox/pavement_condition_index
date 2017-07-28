module PavementConditionIndex
  module Lookups
    class CalculatedDeductCoefficients

# Output of `rake regression:generate_coefficients`
COEFFICIENTS = {:asphalt=>
  {:alligator_cracking=>
    {:valid_min=>0.1,
     :valid_max=>100.0,
     :chart_type=>:log,
     :coefficients=>
      {:low=>[11.81030706543641, 14.716555458137659, 5.254969146645571],
       :medium=>[21.641468980402742, 19.850106754347717, 4.129291159183641],
       :high=>
        [30.698348853111792,
         26.819142548270502,
         5.653897800825902,
         -2.0562458038186975]}},
   :bleeding=>
    {:valid_min=>0.1,
     :valid_max=>100.0,
     :chart_type=>:log,
     :coefficients=>
      {:low=>[-0.931469501043735, 1.3952566824120953, 4.1942825592338355],
       :medium=>[2.081457254535345, 6.047558331759381, 6.057233124228379],
       :high=>
        [5.739963736596728,
         7.319479502282341,
         7.086578195546586,
         3.075398183100246]}},
   :edge_cracking=>
    {:valid_min=>0.1,
     :valid_max=>20.0,
     :chart_type=>:log,
     :coefficients=>
      {:low=>[3.289551803220166, 5.394317209948413, 2.777343147235769],
       :medium=>[9.38292671744566, 9.608124129013511, 4.3396040463768015],
       :high=>[15.664668848033116, 15.377839697997818, 7.293639747414968]}},
   :joint_reflection_cracking=>
    {:valid_min=>0.1,
     :valid_max=>30.0,
     :chart_type=>:log,
     :coefficients=>
      {:low=>[2.599637864741199, 7.548320214895041, 6.035620574755107],
       :medium=>
        [7.3706021587136945,
         14.171221565284236,
         15.866202990160389,
         2.4043690893325156,
         -5.641584115146486],
       :high=>
        [14.913856646582829,
         23.764625047301806,
         28.527415522075152,
         5.796532294554539,
         -12.008222629608007]}},
   :lane_shoulder_drop_off=>
    {:valid_min=>0.5,
     :valid_max=>15.0,
     :chart_type=>:log,
     :coefficients=>
      {:low=>[1.7330434661503789, 2.2479876898054147, 8.492414136167602],
       :medium=>[3.1018055744999637, 0.9748217115112947, 15.880585262031168],
       :high=>[5.588313880268777, 5.140183474398842, 22.853461108687]}},
   :patching_and_utility_cut_patching=>
    {:valid_min=>0.1,
     :valid_max=>50.0,
     :chart_type=>:log,
     :coefficients=>
      {:low=>[1.8384973325128793, 7.632382033226324, 6.507032451977727],
       :medium=>[8.929258996532853, 14.056348057074333, 8.632199015982204],
       :high=>
        [18.05379050800971,
         18.570848940912526,
         15.195881745184764,
         4.634730303593308,
         -4.282412070934171]}},
   :potholes=>
    {:valid_min=>0.01,
     :valid_max=>10.0,
     :chart_type=>:log,
     :coefficients=>
      {:low=>
        [58.574736886209024,
         41.33443795417745,
         2.307796828048822,
         -2.1009955078236295],
       :medium=>
        [91.64010353001909,
         65.40209466565399,
         5.262639941411422,
         -3.0315939096971647],
       :high=>
        [109.3323221736685,
         56.29275767507379,
         -0.3934988005267144,
         -3.0772594822340906]}},
   :rutting=>
    {:valid_min=>0.1,
     :valid_max=>100.0,
     :chart_type=>:log,
     :coefficients=>
      {:low=>
        [7.166892989037484,
         15.480212329682374,
         7.204541988003889,
         -2.056356612335577],
       :medium=>
        [17.07939650585985,
         23.042120387468632,
         7.267187817332259,
         -2.992255156045317],
       :high=>
        [26.55168225206831,
         25.25096737467123,
         9.616695504985966,
         2.709242740203141,
         -2.9515698599184823]}},
   :weathering=>
    {:valid_min=>0.1,
     :valid_max=>100.0,
     :chart_type=>:log,
     :coefficients=>
      {:low=>[1.3778828784876276, 2.6016535714865956, 2.2333518570353172],
       :medium=>[7.3898371316253915, 6.9596588594995685, 5.3812111918177346],
       :high=>
        [15.287212880590612,
         12.713212203226831,
         11.470876324575428,
         5.038585870016526,
         -3.053732169374685]}}}}

    end
  end
end