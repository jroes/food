# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','food','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'food'
  s.version = Food::VERSION
  s.author = 'Jon Roes'
  s.email = 'jroes@jroes.net'
  s.homepage = 'http://github.com/jroes/food'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Query nutritional information for food.'
  s.files = %w(
bin/food
lib/food/version.rb
lib/food/food_finder.rb
lib/food.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','food.rdoc']
  s.rdoc_options << '--title' << 'food' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'food'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_dependency('netrc')
  s.add_runtime_dependency('gli','2.5.6')
end
