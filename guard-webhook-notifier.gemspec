lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "guard-webhook-notifier/version"

Gem::Specification.new do |spec|
  spec.name          = "guard-webhook-notifier"
  spec.version       = GuardWebHookNotifier::VERSION
  spec.authors       = ["Yuku Takahashi"]
  spec.email         = ["taka84u9@gmail.com"]
  spec.summary       = "Notify Guard Events by HTTP POST Requests"
  spec.homepage      = "https://github.com/yuku-t/guard-webhook-notifier"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.8"
  spec.add_dependency "guard", "~> 2.11"
  spec.add_dependency "notiffany", "~> 0.0.2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
end
