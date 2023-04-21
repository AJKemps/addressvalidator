class AddressValidator
  # the AddressValidator class is responsible returning a corrected address string
  # which is either the corrected address or 'Invalid Address'
  # which is then added to the output_data array in the ValidatorApp class

  def initialize(api_client)
    @api_client = api_client
  end

  def validate(address)
    response = @api_client.validate_address(address)

    if response.any?
      address = response.first
      first_line = address['delivery_line_1']
      city_name, zipcode, plus4_code = address['components'].values_at('city_name', 'zipcode', 'plus4_code')
  
      "#{first_line}, #{city_name}, #{zipcode}-#{plus4_code}"
    else
      'Invalid Address'
    end
  end

end
