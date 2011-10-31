module Restbook
  class Engine < Rails::Engine
    isolate_namespace Restbook
    
    config.generators do |g|
      g.template_engine :haml
      g.stylesheet_engine :sass
      g.test_framework :rspec, :view_specs => false
    end
  end
end
