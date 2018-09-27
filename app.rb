require 'sinatra/base'
require_relative 'lib/bookmarks'
require 'uri'
require 'sinatra/flash'

class BookMarker < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get "/" do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    flash[:notice] = "You must submit a valid url" unless Bookmarks.create(title: params['title'], url: params['url'])
    redirect '/'
  end

  run! if app_file == $0
end
