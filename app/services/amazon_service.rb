require 'httparty'
require 'base64'
require 'figaro'
# require 'sinatra/config_file'

# config_file = '/application.yml'

class AmazonService
  def self.call_api
    config ||= YAML.load(File.read('config/application.yml'))
    @full_challenge ||= HTTParty.get('https://e7lqr7l4z5.execute-api.eu-central-1.amazonaws.com/prod/NewCrewMemberChallenge', :headers => {"X-API-key" => config["AWS_API_KEY"]})
    @coded_message ||= @full_challenge.values.first
    decode_message(@coded_message)
  end

  private

  def self.decode_message(message)
    Base64.decode64(message)
  end
end

