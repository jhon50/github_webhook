ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

ENV['GITHUB_WEBHOOK_SECRET'] = "fc76526226750fc5fa31fc78cdebacfc6ed7464e"