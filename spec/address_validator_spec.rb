require 'spec_helper'

describe AddressValidator do
  let(:api_client) { instance_double(APIClient) }
  subject(:address_validator) { AddressValidator.new(api_client) }

  describe '#validate' do
    let(:address) { { street: '143 E Main St', city: 'Columbus', zip_code: '43215' } }

    context 'when the address is valid' do
      let(:api_response) { [ {
        'delivery_line_1': '143 E Main St',
        'components': {
          'city_name': 'Columbus',
          'zipcode': '43215',
          'plus4_code': '5370'
          }
        } ] }

      it 'returns the corrected address' do
        allow(api_client).to receive(:validate_address).with(address).and_return(api_response)
        expect(address_validator.validate(address)).to eq('143 E Main St, Columbus, 43215-5370')
      end
    end

    context 'when the address is invalid' do
      it 'returns "Invalid Address"' do
        allow(api_client).to receive(:validate_address).with(address).and_return([])
        expect(address_validator.validate(address)).to eq('Invalid Address')
      end
    end
  end
end
