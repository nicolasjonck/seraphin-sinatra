require 'sinatra'
require 'dotenv/load'

require './app/application_controller.rb'

map('/') { run ApplicationController }
