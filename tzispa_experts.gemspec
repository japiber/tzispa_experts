# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tzispa/experts/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = Tzispa::Experts::GEM_NAME
  s.version     = Tzispa::Experts::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Juan Antonio Piñero']
  s.email       = ['japinero@area-integral.com']
  s.homepage    = 'https://www.area-integral.com'
  s.summary     = 'Specialized misc modules for Tzispa framework'
  s.description = 'Experts for Tzispa'
  s.licenses    = ['MIT']

  s.required_rubygems_version = '~> 2.0'
  s.required_ruby_version     = '~> 2.0'

  s.add_dependency 'mini_magick',           '~> 4.4'

  s.files         = Dir.glob("{lib}/**/*") + %w(README.md CHANGELOG.md)
  s.require_paths = ['lib']
end
