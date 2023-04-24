require 'csv'

class CSVReader
  # the CSVReader class takes in a file_path and reads the data from the file
  # it then validates the format of the data and returns an array of address objects
  # if the format is invalid, it raises an error

  EXPECTED_HEADERS = ['Street', 'City', 'Zip Code'].freeze

  def initialize(file_path)
    @file_path = file_path
    @headers_checked = false
  end

  def read_addresses
    input_data = File.read(@file_path)
    addresses = []

    CSV.parse(input_data, headers: true) do |row|
      validate_format(row)
      addresses << { street: row[0].strip, city: row[1].strip, zip_code: row[2].strip }      
    end

    addresses
  end

  private

  def validate_format(row)
    # Check headers only once
    unless @headers_checked
      unless row.headers.map(&:strip) == EXPECTED_HEADERS
        raise StandardError, "CSV file headers do not match expected headers\nEXPECTED: #{EXPECTED_HEADERS}\nACTUAL: #{row.headers}"
      end
      @headers_checked = true
    end

    # Check row values and make sure it matches the expected number of fields
    unless row.fields.compact.count == EXPECTED_HEADERS.count
      raise StandardError, "CSV row does not contain the expected number of fields\n #{row}"
    end
  end

end
