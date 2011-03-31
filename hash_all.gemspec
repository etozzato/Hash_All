# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hash_all/version"

Gem::Specification.new do |s|
  s.name        = "hash_all"
  s.version     = HashAll::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Emanuele Tozzato"
  s.email       = "etozzato@gmail.com"
  s.homepage    = "http://blog.mekdigital.com"
  s.summary     = %q{Wrapper for find(:all) that returns Hash}
  s.description = <<-EOF
  Wrapper/helper for ActiveRecord find(:all, *args).\n
  Returns a collection of objects injected into a Hash. 
  EOF

  s.rubyforge_project = "hash_all"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
