require 'spec_helper'

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

      allow(csv_reader).to receive(:read_addresses).and_return([{ street: '143 E Main St', city: 'Columbus', zip_code: '43215' }])
      allow(address_validator).to receive(:validate).and_return('143 E Main St, Columbus, 43215-5370')
      allow(cli_writer).to receive(:print_addresses)
    end

    it 'reads input, validates addresses, and writes output' do
      expect(csv_reader).to receive(:read_addresses)
      expect(address_validator).to receive(:validate)
      expect(cli_writer).to receive(:print_addresses)

      validator_app.run
    end
  end
end
