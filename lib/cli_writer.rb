class CLIWriter
  # The CLIWriter class is responsible for printing the output data to the console
  # it is called from the ValidatorApp class

  def print_addresses(output_data)
    output_data.each do |address|
      puts "#{address[:original]} -> #{address[:corrected]}"
    end
  end
end