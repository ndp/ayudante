require 'test/unit'
 
require 'ayudante/assert_changes'
require 'ayudante/assert_fixtures'
require 'ayudante/rails' if defined? RAILS_ROOT
 
module Test # :nodoc: all
  module Unit
    class TestCase
      include Ayudante::AssertChanges
      include Ayudante::AssertFixtures
    end
  end
end