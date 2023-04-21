require 'spec_helper'

describe APIClient do
  subject(:api_client) { APIClient.new }

  describe '#validate_address' do
    let(:valid_address) { { street: '143 E Main St', city: 'Columbus', zip_code: '43215' } }
    let(:invalid_address) { { street: '1 Empora St', city: 'Title', zip_code: '11111' } }

    it 'returns needed values for a valid address' do
      VCR.use_cassette('valid_address') do
        response = api_client.validate_address(valid_address)
        expect(response).to be_an_instance_of(Array)
        expect(response.first.keys).to include('delivery_line_1')
        expect(response.first['components']).to include('city_name', 'zipcode', 'plus4_code')
      end
    end

    it 'returns an empty array for an invalid address' do
      VCR.use_cassette('invalid_address') do
        response = api_client.validate_address(invalid_address)
        expect(response).to be_an_instance_of(Array)
        expect(response.length).to eq(0)
      end
    end
  end
end
