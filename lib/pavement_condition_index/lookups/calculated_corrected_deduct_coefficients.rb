# generate this whole file by running the following command:
# rake regression:generate_calculated_corrected_deduct_coefficients_file > lib/pavement_condition_index/lookups/calculated_corrected_deduct_coefficients.rb

module PavementConditionIndex
  module Lookups
    class CalculatedCorrectedDeductCoefficients

# Output of `rake regression:generate_corrected_deduct_coefficients`
COEFFICIENTS = 
{:asphalt=>
  {:coefficients=>
    {:q1=>[0.0, 0.9999999999999999],
     :q2=>[-4.767827657379179, 0.9204018317853505, -0.001751870485036131],
     :q3=>[-7.225000000000371, 0.8352547729618199, -0.0013491357069143565],
     :q4=>[-12.07301341589303, 0.8359713622291058, -0.0013966718266254004],
     :q5=>[-12.825902992776388, 0.7672961816305504, -0.0011578947368421164],
     :q6=>[-15.061893704850672, 0.7418633900928823, -0.0010566950464396384],
     :q7=>[-18.186068111455448, 0.8352115583075376, -0.0016336429308565648],
     :q8=>
      [-11.661042311659124,
       0.5804493464050489,
       0.0012355521155837934,
       -9.988820089439906e-06],
     :q9=>
      [-10.821138630889415,
       0.5307870370368919,
       0.0020743464052291917,
       -1.4092420593968467e-05],
     :q10=>
      [-33.76740887897169,
       2.045383029591749,
       -0.033305999495864574,
       0.00035829181520672087,
       -1.7915566098874656e-06,
       3.173417753551723e-09]}},
 :concrete=>
  {:coefficients=>
    {:q1=>[0.0, 0.9999999999999999],
     :q2=>[2.7629772961812407, 0.7731404798761636, -0.0010528250773993893],
     :q3=>[-2.3389834881324347, 0.7286151960784343, -0.0008510706914344763],
     :q4=>[-2.8658410732717314, 0.6712409700722424, -0.0007479360165118755],
     :q5=>[-5.263725490196382, 0.6719569143446881, -0.000787796697626424],
     :q6=>[-7.638157894737134, 0.6712648348813237, -0.0008214009287925783],
     :q7=>[-7.904979360165406, 0.6438796439628511, -0.0007446465428276629],
     :q8=>[-8.123555211558568, 0.6151412538699716, -0.0006607972136222964],
     :q9=>[-8.39037667698684, 0.5877560629514988, -0.0005840428276573835],
     :q10=>[-8.657198142415098, 0.5603708720330258, -0.0005072884416924711]}}}
    end
  end
end