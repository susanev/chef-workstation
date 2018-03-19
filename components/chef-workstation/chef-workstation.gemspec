
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "chef-workstation/version"

Gem::Specification.new do |spec|
  spec.name          = "chef-workstation"
  spec.version       = ChefWorkstation::VERSION
  spec.authors       = ["Chef Software, Inc"]
  spec.email         = ["engineering@chef.io"]

  spec.summary       = "The essential tool for the Chef ecosystem."
  spec.description   = "Manage individual nodes or the complete Chef ecosystem."
  spec.homepage      = "https://github.com/chef/chef-workstation/components/chef"
  spec.license       = "Apache-2.0"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = %w{Rakefile LICENSE.txt README.md} +
    Dir.glob("Gemfile*") + # Includes Gemfile and locks
    Dir.glob("*.gemspec") +
    Dir.glob("{lib,bin,vendor,i18n}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "mixlib-cli"    # Provides argument handling DSL for CLI applications
  spec.add_dependency "mixlib-config" # shared chef configuration library that
                                      # simplifies managing a configuration file
  spec.add_dependency "mixlib-log" # Basis for our traditional logger
  spec.add_dependency "mixlib-install" # URL resolver + install tool for chef products
  spec.add_dependency "r18n-desktop" # easy path to message text management via
                                     # localization gem...
  spec.add_dependency "toml-rb" # This isn't ideal because mixlib-config uses 'tomlrb'
                                # but that library does not support a dumper
  spec.add_dependency "train" # remote connection management over ssh, winrm
  spec.add_dependency "tty-spinner" # Pretty output for status updates in the CLI

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "pry-stack_explorer"
  spec.add_development_dependency "rspec_junit_formatter"
  spec.add_development_dependency "chefstyle"
end