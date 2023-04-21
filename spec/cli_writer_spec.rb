require 'spec_helper'

describe CLIWriter do
  let(:output_data) { [
      { 
        original: '143 E Main St, Columbus, 43215',
        corrected: '143 E Main St, Columbus, 43215-5370' 
      },
      { 
        original: '1 Empora St, Title, 11111',
        corrected: 'Invalid Address' 
      }
    
    ] }
  subject(:cli_writer) { CLIWriter.new }

  describe '#write_output' do
    it 'writes the output data in CSV format' do
      expected_output = "143 E Main St, Columbus, 43215 -> 143 E Main St, Columbus, 43215-5370\n1 Empora St, Title, 11111 -> Invalid Address\n"
      expect { cli_writer.print_addresses(output_data) }.to output(expected_output).to_stdout
    end
  end
end
