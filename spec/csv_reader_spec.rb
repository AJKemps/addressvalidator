require 'spec_helper'

describe CSVReader do
  describe '#read_addresses' do
    context 'when reading from a file' do
      let(:file_path) { 'spec/fixtures/input.csv' }
      subject(:csv_reader) { CSVReader.new(file_path) }

      it 'returns an array of address objects' do
        addresses = csv_reader.read_addresses
        expect(addresses).to be_an_instance_of(Array)
        expect(addresses.first).to eq({ street: '143 E Main St', city: 'Columbus', zip_code: '43215' })
      end
    end

    context "when headers are invalid" do
      let(:invalid_headers_file) { "spec/fixtures/bad_headers.csv" }
      let(:csv_reader) { CSVReader.new(invalid_headers_file) }

      it "raises an error" do
        expect { csv_reader.read_addresses }.to raise_error(StandardError, /CSV file headers do not match expected headers/)
      end
    end

    context "when row values are invalid" do
      let(:invalid_row_value_file) { "spec/fixtures/bad_row.csv" }
      let(:csv_reader) { CSVReader.new(invalid_row_value_file) }

      it "raises an error" do
        expect { csv_reader.read_addresses }.to raise_error(StandardError, /CSV row does not contain the expected number of fields/)
      end
    end
  end
end