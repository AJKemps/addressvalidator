class AddressValidator
  def initialize(api_client)
    @api_client = api_client
  end

  def validate(address)
    response = @api_client.validate_address(address)

    if response.any?
      first_line = response.first[:delivery_line_1]
      city_name, zipcode, plus4_code = response.first[:components].values_at(:city_name, :zipcode, :plus4_code)
  
      "#{first_line}, #{city_name}, #{zipcode}-#{plus4_code}"
    else
      'Invalid Address'
    end
  end
end
