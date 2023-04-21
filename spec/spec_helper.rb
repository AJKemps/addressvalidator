require 'rspec'
require 'byebug'
require_relative '../lib/address_validator'
require_relative '../lib/api_client'
require_relative '../lib/validator_app'
require_relative '../lib/csv_reader'
require_relative '../lib/cli_writer'
require_relative 'support/vcr_setup'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.order = :random
end
