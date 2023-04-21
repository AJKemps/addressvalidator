require_relative 'lib/validator_app'

input_file = ARGV[0]

if input_file.nil?
  puts "Error: Please provide an input file."
  exit 1
end

app = ValidatorApp.new(input_file)
app.run