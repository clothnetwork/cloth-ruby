source 'https://rubygems.org'

# Specify your gem's dependencies in cloth-ruby.gemspec
gemspec

group :development do

  platforms :mri do
    if Gem::Version.new(RUBY_VERSION.dup) >= Gem::Version.new("2.0.0")
      gem "byebug"
      gem "pry"
      gem "pry-byebug"
    end
  end
end

