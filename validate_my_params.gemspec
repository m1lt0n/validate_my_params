
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "validate_my_params/version"

Gem::Specification.new do |spec|
  spec.name          = "validate_my_params"
  spec.version       = ValidateMyParams::VERSION
  spec.authors       = ["Pantelis Vratsalis"]
  spec.email         = ["pvratsalis@gmail.com"]

  spec.summary       = %q{A tiny library that allows parameter validation on methods}
	spec.description   = %q{Inspired by Airbnb blog post https://medium.com/airbnb-engineering/large-scale-payments-systems-and-ruby-on-rails-bfe5b89f6f4 - by including a module in any of your classes, you can validate the type and presence of a method's parameters.}
  spec.homepage      = "https://github.com/m1lt0n/validate_my_params"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
		spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
