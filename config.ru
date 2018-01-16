require 'sinatra'

require 'dotenv'
Dotenv.load('config/application.env')

require './app/application_controller.rb'

map('/') { run ApplicationController }
