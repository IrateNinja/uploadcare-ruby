# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "uploadcare-ruby/version"

Gem::Specification.new do |s|
  s.name        = "uploadcare-ruby"
  s.version     = Uploadcare::VERSION
  s.authors     = ["Geoffrey Byers"]
  s.email       = ["geoff@seaandco.com"]
  s.homepage    = "https://github.com/gdcbyers/uploadcare-ruby"
  s.summary     = "Ruby Uploadcare.com API Wrapper"
  s.description = "Allow easy access to the Uploadcare.com API"

  s.rubyforge_project = "uploadcare-ruby"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake'
  s.add_runtime_dependency 'httparty'
  s.add_runtime_dependency 'json'
end
