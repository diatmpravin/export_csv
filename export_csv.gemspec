# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'export_csv/version'

Gem::Specification.new do |gem|
  gem.name          = "export_csv"
  gem.version       = ExportCsv::VERSION
  gem.authors       = ["Pravin Mishra"]
  gem.email         = ["diatm.pravin.it.07.27@gmail.com"]
  gem.description   = "ExportCsv is a small library intended to simplify the common steps involved with export table data to CSV files. ExportCsv is compatible with recent 1.8 versions of Ruby as well as Ruby 1.9+"
  gem.summary       = %q{Export data from multiple table}
  gem.homepage      = "https://github.com/diatmpravin/export_csv.git"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
end
