require_relative 'lib/validator_app'

# Get input file from command line arguments
input_file = ARGV[0]

# Exit with error message if no input file is provided
if input_file.nil?
  puts "Error: Please provide an input file."
  exit 1
end

# Run the app
app = ValidatorApp.new(input_file)
app.run