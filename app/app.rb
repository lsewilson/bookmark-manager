require 'sinatra/base'
require_relative './models/link.rb'

class Bookmark < Sinatra::Base
  get '/' do
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_links
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
