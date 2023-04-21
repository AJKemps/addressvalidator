require_relative 'address_validator'
require_relative 'api_client'
require_relative 'csv_reader'
require_relative 'cli_writer'

class ValidatorApp
  def initialize(file_path = nil)
    @csv_reader = CSVReader.new(file_path)
    api_client = APIClient.new
    @address_validator = AddressValidator.new(api_client)
    @cli_writer = CLIWriter.new
  end

  def run
    addresses = @csv_reader.read_addresses
    output_data = []

    addresses.each do |address|
      original_address = "#{address[:street]}, #{address[:city]}, #{address[:zip_code]}"
      corrected_address = @address_validator.validate(address)
      output_data << { original: original_address, corrected: corrected_address }
    end

    @cli_writer.print_addresses(output_data)
  end
end
