require 'httparty'
require 'yaml'

class APIClient
  # The APIClient class is responsible for making the API request to the SmartyStreets API
  # and returning the response body as a JSON object to the AddressValidator class

  include HTTParty
  base_uri 'https://us-street.api.smartystreets.com'

  def initialize()
    @auth_id = YAML.load_file('config.yml')['smarty']['auth_id']
    @auth_token = YAML.load_file('config.yml')['smarty']['auth_token']
  end

  def validate_address(address)
    response = self.class.get('/street-address', query: query_params(address))

    if response.code == 200
      JSON.parse(response.body)
    else
      raise "API request failed with code #{response.code}"
    end
  end

  private

  def query_params(address)
    {
      street: address[:street],
      city: address[:city],
      zipcode: address[:zip_code],
      "auth-id": @auth_id,
      "auth-token": @auth_token,
      license: 'us-core-cloud',
    }
  end
end
