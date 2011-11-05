# Inspired by the view generator of radar/forem, thanks!
require 'rails/generators'

module Restbook
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../app/views/restbook', __FILE__)
      desc "Used to copy restbook's views to your application's views"
      
      def copy_views
        view_directory :comments
      end
      
      protected
      
      def view_directory(name)
        directory name.to_s, "app/views/restbook/#{name}"
      end
    end
  end
end