require 'spec_helper'
require_relative 'fixtures/addresses'

describe AddressValidator do
  let(:api_client) { APIClient.new }
  subject(:address_validator) { AddressValidator.new(api_client) }

  describe '#validated_addresses' do
    context 'when passed both valid and invalid addresses' do
      it 'returns the validated addresses in the expected format' do
        VCR.use_cassette('address_validator') do
          validated_addresses = address_validator.validate_addresses(ADDRESSES)

          expect(validated_addresses).to eq(VALIDATED_ADDRESSES)
        end
      end
    end
  end
  
end
