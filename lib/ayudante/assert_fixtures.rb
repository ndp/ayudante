module AssertFixtures

  # Given a table/fixture name and set of expected fixtured, identified their symbols,
  # makes sure the actual is a list/set of the same items.
  # Ignores order.
  def assert_set_of_fixtures(fixture_name, expected, actual, message = '')
    expected = objects_from_fixture_syms(fixture_name, expected)
    assert_equal expected.length, actual.length, "Expected #{expected.length} but got #{actual.length}. #{message}"

    expected_set = ::Set.new(expected)
    actual_set = ::Set.new(actual)
    assert_equal expected_set, actual_set, "Difference: #{(expected_set - actual_set).sort.inspect}. #{message}"
  end


  def assert_list_of_fixtures(fixture_name, expected, actual, message='')
    assert_equal expected.length, actual.length

    expected_objs = objects_from_fixture_syms(fixture_name, expected)
    actual_syms = actual.map {|o| expected_objs.index(o).nil? ? o : expected[expected_objs.index(o)]}

    assert_equal expected_objs, actual, "Expected #{expected.inspect} but got #{actual_syms.inspect}.  #{message}"
  end


  def method_missing(method, *args)
    if method.to_s[/^assert_list_of_.*/]
      send(:assert_list_of_fixtures, method.to_s.gsub(/^assert_list_of_/, '').to_sym, *args)
    elsif method.to_s[/^assert_set_of_.*/]
      send(:assert_set_of_fixtures, method.to_s.gsub(/^assert_set_of_/, '').to_sym, *args)
    else
      super
    end
  end

  # Look up fixtures from their symbols.
  # objects_from_fixture_syms :users, [:quentin, :aaron]
  #                           => [users(:quentin), users(:aaron)]
  # objects_from_fixture_syms :users, :quentin
  #                           => [users(:quentin)]
  def objects_from_fixture_syms(fixture_name, fixture_syms)
    if fixture_syms.is_a? Symbol
      [send(fixture_name.to_sym, fixture_syms)]
    else
      fixture_syms.map { |sym| send(fixture_name.to_sym, sym) }
    end
  end

end