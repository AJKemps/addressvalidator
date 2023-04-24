class AddressValidator
  # The AddressValidator class is responsible returning an array of validated addresses
  # It takes in an array of addresses and an instance of the APIClient class.

  REQUIRED_KEYS = %i[street city zip_code].freeze

  def initialize(api_client)
    @api_client = api_client
  end

  def validate_addresses(addresses)
    raise ArgumentError, "Expected input to be an array" unless addresses.is_a?(Array)

    validated_addresses = []

    addresses.each do |address|
      validate_address_keys(address)
      response = @api_client.validate_address(address)
      validated_addresses << { original: address, validated: response }
    end

    validated_addresses
  end

  def validate_address_keys(address)
    missing_keys = REQUIRED_KEYS - address.keys
    raise KeyError, "Missing required key(s) in address hash" if missing_keys.any?
  end

end
