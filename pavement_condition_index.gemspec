# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pavement_condition_index/version"

Gem::Specification.new do |spec|
  spec.name          = "pavement_condition_index"
  spec.version       = PavementConditionIndex::VERSION
  spec.authors       = ["Andy Monroe", "Nate Clark"]
  spec.email         = ["hello@brandnewbox.com"]

  spec.summary       = %q{A ruby solution for solving Pavement Condition Index using the ASTM D6433 Standard Practice for Roads and Parking Lots Pavement Condition Index Surveys}
  spec.homepage      = "https://github.com/brandnewbox/pavement_condition_index"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
