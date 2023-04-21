require 'spec_helper'
require_relative 'fixtures/addresses'

describe APIClient do
  subject(:api_client) { APIClient.new }

  describe '#validate_address' do
    it 'returns needed values for a valid address' do
      VCR.use_cassette('valid_address') do
        response = api_client.validate_address(VALID_ADDRESS)
        expect(response).to be_an_instance_of(Array)
        expect(response.first.keys).to include('delivery_line_1')
        expect(response.first['components']).to include('city_name', 'zipcode', 'plus4_code')
      end
    end

    it 'returns an empty array for an invalid address' do
      VCR.use_cassette('invalid_address') do
        response = api_client.validate_address(INVALID_ADDRESS)
        expect(response).to be_an_instance_of(Array)
        expect(response.length).to eq(0)
      end
    end
  end
end
