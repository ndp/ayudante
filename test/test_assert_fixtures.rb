require 'set.rb'
require 'test/unit'
module Ayudante; end
require "#{File.dirname(__FILE__)}/../lib/ayudante/assert_fixtures.rb"

class CandyBar
end

class AssertFixturesTest < Test::Unit::TestCase

  include Ayudante::AssertFixtures

  # faux fixture
  def candy_bars(sym)
    case sym
      when :mars:
        @mars ||= CandyBar.new
      when :m_and_ms:
        @m_and_ms ||= CandyBar.new
      when :almond_joys:
        @almond_joys ||= CandyBar.new
      when :mounds:
        @mounds ||= CandyBar.new
      else
        nil
    end
  end

  def test_assert_set_of_fixtures
    assert_set_of_fixtures :candy_bars, [], []
    assert_set_of_fixtures :candy_bars, [:almond_joys], [candy_bars(:almond_joys)]
    assert_set_of_fixtures :candy_bars, [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:almond_joys)]
    assert_raises Test::Unit::AssertionFailedError do
      assert_set_of_fixtures :candy_bars, [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:m_and_ms)], 'Different'
    end
    assert_raises Test::Unit::AssertionFailedError do
      assert_set_of_fixtures :candy_bars, [:almond_joys, :mounds], [candy_bars(:mounds)], 'Missing item'
    end
    assert_raises Test::Unit::AssertionFailedError do
      assert_set_of_fixtures :candy_bars, [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:almond_joys), candy_bars(:m_and_ms)], 'Extra item'
    end
  end

  def test_assert_list_of_fixtures
    assert_list_of_fixtures :candy_bars, [], []
    assert_list_of_fixtures :candy_bars, [:almond_joys], [candy_bars(:almond_joys)]
    assert_list_of_fixtures :candy_bars, [:almond_joys, :mounds], [candy_bars(:almond_joys), candy_bars(:mounds)]
    assert_raises Test::Unit::AssertionFailedError do
      assert_list_of_fixtures :candy_bars, [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:almond_joys)], 'wrong order'
    end
    assert_raises Test::Unit::AssertionFailedError do
      assert_list_of_fixtures :candy_bars, [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:m_and_ms)], 'Different'
    end
    assert_raises Test::Unit::AssertionFailedError do
      assert_list_of_fixtures :candy_bars, [:almond_joys, :mounds], [candy_bars(:mounds)], 'Missing item'
    end
    assert_raises Test::Unit::AssertionFailedError do
      assert_list_of_fixtures :candy_bars, [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:almond_joys), candy_bars(:m_and_ms)], 'Extra item'
    end
  end

  def test_method_missing
    assert_set_of_candy_bars [], []
    assert_set_of_candy_bars [:almond_joys], [candy_bars(:almond_joys)]
    assert_set_of_candy_bars [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:almond_joys)]
    assert_raises Test::Unit::AssertionFailedError do
      assert_set_of_candy_bars [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:m_and_ms)], 'Different'
    end
    assert_raises Test::Unit::AssertionFailedError do
      assert_set_of_candy_bars [:almond_joys, :mounds], [candy_bars(:mounds)], 'Missing item'
    end
    assert_raises Test::Unit::AssertionFailedError do
      assert_set_of_candy_bars [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:almond_joys), candy_bars(:m_and_ms)], 'Extra item'
    end
    assert_list_of_candy_bars [], []
    assert_list_of_candy_bars [:almond_joys], [candy_bars(:almond_joys)]
    assert_list_of_candy_bars [:almond_joys, :mounds], [candy_bars(:almond_joys), candy_bars(:mounds)]
    assert_raises Test::Unit::AssertionFailedError do
      assert_list_of_candy_bars [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:almond_joys)], 'wrong order'
    end
    assert_raises Test::Unit::AssertionFailedError do
      assert_list_of_candy_bars [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:m_and_ms)], 'Different'
    end
    assert_raises Test::Unit::AssertionFailedError do
      assert_list_of_candy_bars [:almond_joys, :mounds], [candy_bars(:mounds)], 'Missing item'
    end
    assert_raises Test::Unit::AssertionFailedError do
      assert_list_of_candy_bars [:almond_joys, :mounds], [candy_bars(:mounds), candy_bars(:almond_joys), candy_bars(:m_and_ms)], 'Extra item'
    end
  end
end