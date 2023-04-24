require 'spec_helper'
require_relative 'fixtures/addresses'

describe CLIWriter do
  subject(:cli_writer) { CLIWriter.new }

  describe '#write_output' do
    it 'writes the output data in CSV format' do
      expected_output = "143 E Main St, Columbus, 43215 -> 143 E Main St, Columbus, 43215-5370\n1 Empora St, Title, 11111 -> Invalid Address\n"
      expect { cli_writer.run(VALIDATED_ADDRESSES) }.to output(expected_output).to_stdout
    end
  end
end
