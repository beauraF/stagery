require_relative "lib/stagery/version"

Gem::Specification.new do |spec|
  spec.name        = "stagery"
  spec.version     = Stagery::VERSION
  spec.summary     = "Know at what development life cycle stage you are 👀"
  spec.homepage    = "https://github.com/beauraF/stagery"
  spec.license     = "MIT"

  spec.author      = "Florent Beaurain"
  spec.email       = "beaurain.florent@gmail.com"

  spec.files = Dir["lib/**/*", "LICENSE", "README.md"]

  spec.required_ruby_version = ">= 2.6"

  spec.add_dependency "activesupport", ">= 5"
end
