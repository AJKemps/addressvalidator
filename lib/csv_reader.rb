require 'csv'

class CSVReader
  def initialize(file_path = nil)
    @file_path = file_path
  end

  def read_addresses
    input_data = @file_path.nil? ? ARGF.read : File.read(@file_path)
    addresses = []
    CSV.parse(input_data, headers: true) do |row|
      addresses << { street: row[0].strip, city: row[1].strip, zip_code: row[2].strip }      
    end
    addresses
  end
end
