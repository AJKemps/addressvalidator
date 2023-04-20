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

    context 'when reading from piped input' do
      let(:piped_input) { StringIO.new("Street,City,Zip Code\n143 E Main St,Columbus,43215") }
        subject(:csv_reader) { CSVReader.new }

        before do
          allow(ARGF).to receive(:read).and_return(piped_input.read)
        end
  
        it 'returns an array of address objects' do
          addresses = csv_reader.read_addresses
          expect(addresses).to be_an_instance_of(Array)
          expect(addresses.first).to eq({ street: '143 E Main St', city: 'Columbus', zip_code: '43215' })
        end
      end
    end
  end
  