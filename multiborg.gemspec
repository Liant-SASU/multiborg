# frozen_string_literal: true

require_relative "lib/multiborg/version"

Gem::Specification.new do |spec|
  spec.name = "multiborg"
  spec.version = Multiborg::VERSION
  spec.authors = ["Roland Edouard Jean Laurès"]
  spec.email = ["roland@liant.dev"]

  spec.summary = "MultiBorg is a secure backup tool using Borg to manage multiple repositories."
  spec.description = "
    MultiBorg facilitates the management of secure and deduplicated backups for multiple sites or
    services using BorgBackup. It provides a simple interface to automate and monitor backup processes.
    "
  spec.homepage = "https://github.com/Liant-SASU/multiborg"
  spec.license = "GPL-3.0"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
