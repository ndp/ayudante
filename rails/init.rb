if RAILS_ENV == 'test'
  if defined? Spec
    require 'ayudante/rspec'
  else
    require 'ayudante/rails'
  end
end
