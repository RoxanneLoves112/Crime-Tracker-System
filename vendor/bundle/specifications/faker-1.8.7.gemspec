# -*- encoding: utf-8 -*-
# stub: faker 1.8.7 ruby lib

Gem::Specification.new do |s|
  s.name = "faker".freeze
  s.version = "1.8.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Benjamin Curtis".freeze]
  s.date = "2017-12-22"
  s.description = "Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.".freeze
  s.email = ["benjamin.curtis@gmail.com".freeze]
  s.homepage = "https://github.com/stympy/faker".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1".freeze)
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Easily generate fake data".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>.freeze, [">= 0.7"])
    else
      s.add_dependency(%q<i18n>.freeze, [">= 0.7"])
    end
  else
    s.add_dependency(%q<i18n>.freeze, [">= 0.7"])
  end
end
