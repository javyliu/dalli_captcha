
require 'rails/generators'

module DalliCaptcha
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "Copy DalliCaptcha default files"

      def copy_initializer
        copy_file "dalli_captcha.rb", "config/initializers/dalli_captcha.rb"
      end

      def show_readme
          readme "README"
      end

    end
  end
end
