require 'rubygems'
require 'bundler'
require 'debugger'

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Citibike
	class App < Sinatra::Application
    before do
      json = File.open("data/citibikenyc.json").read
      @data = MultiJson.load(json)
    end

    get '/' do
      erb :home
    end

    get '/form' do
      erb :form
    end

    # post '/route' do
    #   @params = params
    #   erb :route
    # end

    post '/map' do
      @start = params["start"].split(",").collect do |element| 
        element.to_f / 1000000
      end
      @end = params["end"].split(",").collect do |element|
        element.to_f / 1000000
      end
      # debugger
      erb :map
    end

  end
end