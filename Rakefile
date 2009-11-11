require 'rubygems'
require 'rake/testtask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "ayudante"
    gemspec.summary = "Test helpers to DRY up your tests."
    gemspec.description = "Assertions for working with fixtures more easily. Assertions to assert pre/post conditions concisely."
    gemspec.email = "ndp@mac.com"
    gemspec.homepage = "http://github.com/ndp/ayudante"
    gemspec.authors = ["Andy Peterson"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end



desc "Default Task"
task :default => :test_units


Rake::TestTask.new(:test_units) do |t|
  t.test_files = FileList['test/test*.rb']
  t.warning = true
  t.verbose = false
end
