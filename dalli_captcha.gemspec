$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dalli_captcha/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dalli_captcha"
  s.version     = DalliCaptcha::VERSION
  s.authors     = ["javy_liu"]
  s.email       = ["javy_liu@163.com"]
  s.homepage    = "https://github.com/javyliu/dalli_captcha"
  s.summary     = "generate captcha by dalli"
  s.description = "generate captcha by dalli,use the memcache"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "dalli"
  s.add_dependency "uuid"
  # s.add_dependency "jquery-rails"

  #s.add_development_dependency "sqlite3"
end
