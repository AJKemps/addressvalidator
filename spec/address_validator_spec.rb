require 'spec_helper'
require_relative 'fixtures/addresses'

describe AddressValidator do
  let(:api_client_mock) { APIClient.new }
  subject(:address_validator) { AddressValidator.new(api_client_mock) }

  describe '#validate' do
    context 'when the address is valid' do
      it 'returns the corrected address from mock' do
        VCR.use_cassette('valid_address') do
          expect(address_validator.validate(VALID_ADDRESS)).to eq('143 E Main St, Columbus, 43215-5370')
        end
      end
    end

    context 'when the address is invalid' do
      it 'returns the empty array from mock' do
        VCR.use_cassette('invalid_address') do
          expect(address_validator.validate(INVALID_ADDRESS)).to eq('Invalid Address')
        end
      end
    end

  end
end
