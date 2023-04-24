class CLIWriter
  # The CLIWriter class is responsible for formatting and printing
  # the validated addresses to the console

  def run(addresses)
    formatted_data = format_output_data(addresses)
    print_addresses(formatted_data)
  end

  private

  def print_addresses(output_data)
    output_data.each do |address|
      puts "#{address[:original]} -> #{address[:validated]}"
    end
  end

  def format_output_data(addresses)
    addresses.map do |address|
      {
        original: format_original_address(address[:original]),
        validated: format_validated_address(address[:validated])
      }
    end
  end

  def format_original_address(address)
    "#{address[:street]}, #{address[:city]}, #{address[:zip_code]}"
  end

  def format_validated_address(address)
    if address.any?
      address = address.first
      first_line = address['delivery_line_1']
      city_name, zipcode, plus4_code = address['components'].values_at('city_name', 'zipcode', 'plus4_code')
  
      "#{first_line}, #{city_name}, #{zipcode}-#{plus4_code}"
    else
      "Invalid Address"
    end
  end

end