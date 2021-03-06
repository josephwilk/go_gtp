DIR     = File.dirname(__FILE__)
LIB     = File.join(DIR, *%w[lib go gtp.rb])
VERSION = open(LIB) { |lib|
  lib.each { |line|
    if v = line[/^\s*VERSION\s*=\s*(['"])(\d\.\d\.\d)\1/, 2]; break v end
  }
}

SPEC = Gem::Specification.new do |s|
  s.name        = "go_gtp"
  s.version     = VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James Edward Gray II", "Ryan Bates"]
  s.email       = ["james@graysoftinc.com"]
  s.homepage    = "http://github.com/JEG2/go_gtp"
  s.summary     = "A wrapper for GNU Go's Go Text Protocol (GTP)."
  s.description = <<-END_DESCRIPTION.gsub(/\s+/, " ").strip
  This library runs GNU Go in a separate process and allows you to communicate
  with it using the Go Text Protocol (GTP).  This makes it easy to manage full
  games of Go, work with SGF files, analyze Go positions, and more.
  END_DESCRIPTION

  s.required_rubygems_version = "~> 1.9.2"
  s.required_rubygems_version = "~> 1.3.6"

  s.add_development_dependency "rspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*_spec.rb`.split("\n")
  s.require_paths = %w[lib]
end
