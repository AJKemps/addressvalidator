require 'rspec'
require 'byebug'
require_relative '../lib/address_validator'
require_relative '../lib/api_client'
require_relative '../lib/cli'
require_relative '../lib/csv_reader'
require_relative '../lib/csv_writer'
require_relative 'support/vcr_setup'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.order = :random
end
