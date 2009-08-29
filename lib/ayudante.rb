#$:.unshift(File.dirname(__FILE__)) unless
#  $:.include?(File.dirname(__FILE__)) || #$:.include?(File.expand_path(File.dirname(__FILE__)))

module Ayudante
end

if defined? Spec
  require File.dirname(__FILE__) <<  '/ayudante/rspec.rb'
else
  require File.dirname(__FILE__) <<  '/ayudante/test_unit.rb'
end