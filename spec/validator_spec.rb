require 'spec_helper'

describe 'Validator Script' do
  let(:input_file) { 'spec/fixtures/input.csv' }
  let(:output_file) { 'spec/fixtures/output.csv' }

  before do
    # Redirect stdout to a StringIO object to capture script output
    @original_stdout = $stdout
    $stdout = StringIO.new
  end

  after do
    # Reset stdout back to original
    $stdout = @original_stdout
  end

  describe 'End-to-End Integration Test' do
    it 'processes input file and prints corrected addresses' do
      VCR.use_cassette('validator_script') do
        ARGV.replace [input_file]
        load 'validator.rb'

        expect($stdout.string).to include(
          '143 E Main St, Columbus, 43215 -> 143 E Main St, Columbus, 43215-5370',
          '1 Empora St, Title, 11111 -> Invalid Address'
        )
      end
    end
  end
end