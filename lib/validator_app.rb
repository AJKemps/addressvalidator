require_relative 'address_validator'
require_relative 'api_client'
require_relative 'csv_reader'
require_relative 'cli_writer'

class ValidatorApp
  # The ValidatorApp class is responsible for orchestrating the flow of the application
  # and is the only class that is called from the app's root validator script

  def initialize(file_path = nil)
    @csv_reader = CSVReader.new(file_path)
    api_client = APIClient.new
    @address_validator = AddressValidator.new(api_client)
    @cli_writer = CLIWriter.new
  end

  def run
    # grab the addresses from the input file
    addresses = @csv_reader.read_addresses

    # grab the validated addresses from the API
    validated_addresses =  @address_validator.validate_addresses(addresses)

    # pass the validated addresses to the CLIWriter class to print to the console
    @cli_writer.run(validated_addresses)
  end
end
