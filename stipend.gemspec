# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'stipend/version'

Gem::Specification.new do |s|
  s.rubygems_version      = '1.3.5'

  s.name                  = 'stipend'
  s.rubyforge_project     = 'stipend'

  s.version               = Stipend::VERSION
  s.platform              = Gem::Platform::RUBY

  s.authors               = %w{jfelchner m5rk}
  s.email                 = 'support@chirrpy.com'
  s.date                  = Date.today
  s.homepage              = 'https://github.com/chirrpy/stipend'

  s.summary               = %q{STIpend is a quick way to allow assignment and modification of Single Table Inheritance in Rails.}
  s.description           = %q{}

  s.rdoc_options          = ["--charset = UTF-8"]
  s.extra_rdoc_files      = %w[README.md LICENSE]

  #= Manifest =#
  s.executables           = Dir["{bin}/**/*"]
  s.files                 = Dir["{app,config,db,lib}/**/*"] + %w{Rakefile README.md}
  s.test_files            = Dir["{test,spec,features}/**/*"]
  s.require_paths         = ["lib"]
  #= Manifest =#

  s.add_development_dependency  'rspec',                '~> 2.11'
  s.add_development_dependency  'fuubar',               '~> 1.0'
  s.add_development_dependency  'guard',                '~> 1.4.0'
  s.add_development_dependency  'guard-rspec',          '~> 2.0.0'
  s.add_development_dependency  'rb-fsevent',           '~> 0.9.1'
  s.add_development_dependency  'awesome_print',        '~> 1.1.0'
  s.add_development_dependency  'activerecord',         '~> 3.1.8'
  s.add_development_dependency  'sqlite3',              '~> 1.3.6'
end
