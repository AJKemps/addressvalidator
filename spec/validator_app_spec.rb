require 'spec_helper'
require_relative 'fixtures/addresses'

describe ValidatorApp do
  let(:file_path) { 'spec/fixtures/input.csv' }
  subject(:validator_app) { ValidatorApp.new(file_path) }

  describe '#run' do
    let(:csv_reader) { instance_double(CSVReader) }
    let(:api_client) { instance_double(APIClient) }
    let(:address_validator) { instance_double(AddressValidator) }
    let(:cli_writer) { instance_double(CLIWriter) }

    before do
      allow(CSVReader).to receive(:new).and_return(csv_reader)
      allow(APIClient).to receive(:new).and_return(api_client)
      allow(AddressValidator).to receive(:new).and_return(address_validator)
      allow(CLIWriter).to receive(:new).and_return(cli_writer)

      allow(csv_reader).to receive(:read_addresses).and_return(ADDRESSES)
      allow(address_validator).to receive(:validate_addresses).and_return(VALIDATED_ADDRESSES)
      allow(cli_writer).to receive(:run)
    end

    it 'reads input, validates addresses, and writes output' do
      expect(csv_reader).to receive(:read_addresses)
      expect(address_validator).to receive(:validate_addresses)
      expect(cli_writer).to receive(:run)

      validator_app.run
    end
  end
end
