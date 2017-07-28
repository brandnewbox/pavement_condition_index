require "bundler/gem_tasks"
require "rspec/core/rake_task"
import "./lib/tasks/regression.rake"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
