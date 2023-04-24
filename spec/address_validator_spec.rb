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

    context 'when input data contains an invalid address format' do
      it 'raises an error for a missing street key' do
        addresses = [{ city: 'Columbus', zip_code: '43215' }]
        expect { address_validator.validate_addresses(addresses) }.to raise_error(KeyError, "Missing required key(s) in address hash")
      end
  
      it 'raises an error for a missing city key' do
        addresses = [{ street: '143 E Main St', zip_code: '43215' }]
        expect { address_validator.validate_addresses(addresses) }.to raise_error(KeyError, "Missing required key(s) in address hash")
      end
  
      it 'raises an error for a missing zip_code key' do
        addresses = [{ street: '143 E Main St', city: 'Columbus' }]
        expect { address_validator.validate_addresses(addresses) }.to raise_error(KeyError, "Missing required key(s) in address hash")
      end
    end

    context 'when input data is not an array' do
      it 'raises an error' do
        addresses = "This is not an array"
        expect { address_validator.validate_addresses(addresses) }.to raise_error(ArgumentError, "Expected input to be an array")
      end
    end
  end
  
end
