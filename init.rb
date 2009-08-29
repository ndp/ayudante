if RAILS_ENV == 'test'
  if defined? Spec
    #require 'ayudante/rspec'
  else
	require File.join(File.dirname(__FILE__), 'lib','ayudante','rails', 'init')
  end
end
