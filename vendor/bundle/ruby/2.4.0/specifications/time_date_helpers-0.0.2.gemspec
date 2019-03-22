# -*- encoding: utf-8 -*-
# stub: time_date_helpers 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "time_date_helpers".freeze
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Klingon Code Warrior".freeze]
  s.date = "2012-05-03"
  s.description = "The initial version has only a few date and time helpers and was created primarily for teaching purposes (how to create gems), but does have some value. I will try to get back to this gem and add more methods as time allows.".freeze
  s.email = ["profh@cmu.edu".freeze]
  s.homepage = "https://github.com/profh/time_date_helpers".freeze
  s.rubyforge_project = "time_date_helpers".freeze
  s.rubygems_version = "2.7.9".freeze
  s.summary = "A series of helpers to deal with time and date issues in Rails.".freeze

  s.installed_by_version = "2.7.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<chronic>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<chronic>.freeze, [">= 0"])
    else
      s.add_dependency(%q<chronic>.freeze, [">= 0"])
      s.add_dependency(%q<chronic>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<chronic>.freeze, [">= 0"])
    s.add_dependency(%q<chronic>.freeze, [">= 0"])
  end
end
