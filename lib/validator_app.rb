require_relative 'address_validator'
require_relative 'api_client'
require_relative 'csv_reader'
require_relative 'cli_writer'

class ValidatorApp
  # The ValidatorApp class is responsible for orchestrating the flow of the application
  # and is the only class that is called from the bin/validator script

  def initialize(file_path = nil)
    @csv_reader = CSVReader.new(file_path)
    api_client = APIClient.new
    @address_validator = AddressValidator.new(api_client)
    @cli_writer = CLIWriter.new
  end

  def run
    # grab the addresses from the input file
    addresses = @csv_reader.read_addresses
    # instantiate an empty array to store the output data
    output_data = []

    # iterate over the addresses and validate each one, then add the original and corrected address to the output_data array
    addresses.each do |address|
      original_address = "#{address[:street]}, #{address[:city]}, #{address[:zip_code]}"
      corrected_address = @address_validator.validate(address)
      output_data << { original: original_address, corrected: corrected_address }
    end

    # print the output data to the console
    @cli_writer.print_addresses(output_data)
  end
end
