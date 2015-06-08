$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fiscal_calc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fiscal_calc"
  s.version     = FiscalCalc::VERSION
  s.authors     = ["Blaz Balon"]
  s.email       = ["blaz.balon@laly.si"]
  s.homepage    = "TODO"
  s.summary     = "Calculator for fiscal years"
  s.description = "Calculator for fiscal years"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"

  s.add_development_dependency "sqlite3"
end
