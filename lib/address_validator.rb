class AddressValidator
  # The AddressValidator class is responsible returning an array of validated addresses
  # It takes in an array of addresses and an instance of the APIClient class.

  def initialize(api_client)
    @api_client = api_client
  end

  def validate_addresses(addresses)
    validated_addresses = []

    addresses.each do |address|
      response = @api_client.validate_address(address)
      validated_addresses << { original: address, validated: response }
    end

    validated_addresses
  end

end
