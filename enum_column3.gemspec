# -*- encoding: utf-8 -*-
require File.expand_path('../lib/enum_column3/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nick Pohodnya", "Hannes Fostie"]
  gem.email         = ["hannes@openminds.be"]
  gem.description   = %q{Enables enumerations (enum) for MySQL.}
  gem.summary       = %q{Enables enumerations (enum) for MySQL.}
  gem.homepage      = %q{http://github.com/electronick/enum_column}

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "enum_column3"
  gem.require_paths = ["lib"]
  gem.version       = EnumColumn3::VERSION
end
