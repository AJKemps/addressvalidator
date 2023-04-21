class CLIWriter
  def print_addresses(output_data)
    output_data.each do |address|
      puts "#{address[:original]} -> #{address[:corrected]}"
    end
  end
end