$:.push File.expand_path("../lib", __FILE__)
require "omniauth-miicard/version"

Gem::Specification.new do |s|
  s.name = "omniauth-miicard"
  s.version = Omniauth::MiiCard::VERSION
  s.authors = ["Paul O'Neill"]
  s.email = ["info@miicard.com"]
  s.homepage = "https://github.com/miicard/modules-ruby-omniauth"
  s.summary = %q{OmniAuth strategy for miiCard}
  s.description = %q{OmniAuth strategy for miiCard}

  s.rubyforge_project = "omniauth-miicard"

  s.files = ["lib/omniauth-miicard.rb", "lib/omniauth/strategies/miicard.rb", "lib/omniauth-miicard/version.rb"]
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth', '~> 1.0'
end