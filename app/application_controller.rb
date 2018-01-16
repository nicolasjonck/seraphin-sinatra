require './app/services/amazon_service.rb'

class ApplicationController < Sinatra::Base

  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    username == ENV["username"]  and password == ENV["password"]
  end

  get '/' do
    @message ||= AmazonService.call_api
    erb :index
  end
end
