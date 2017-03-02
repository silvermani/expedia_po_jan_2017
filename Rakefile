require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
  end

# Cucumber::Rake::Task.new(:smoke_tests) do |t|
#   t.profile = 'smoke_tests'
#   end
#
# Cucumber::Rake::Task.new(:regression_tests) do |t|
#   t.profile = 'regression_tests'
#   end
#
# Cucumber::Rake::Task.new(:dev_regression_tests) do |t|
#   t.profile = 'dev_regression_tests'
#   end
#
# Cucumber::Rake::Task.new(:dev_cars_regression_tests) do |t|
#   t.profile = 'dev_cars_regression_tests'
# end



task :default => :features