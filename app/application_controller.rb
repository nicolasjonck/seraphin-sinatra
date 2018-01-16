require './app/services/amazon_service.rb'

class ApplicationController < Sinatra::Base

  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    config = YAML.load(File.read('config/application.yml'))
    username == config["username"]  and password == config["password"]
  end

  get '/' do
    @message ||= AmazonService.call_api
    erb :index
  end
end
