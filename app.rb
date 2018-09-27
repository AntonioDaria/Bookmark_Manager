require 'sinatra/base'
require_relative 'lib/bookmarks'

class BookMarker < Sinatra::Base

  enable :sessions

  get "/" do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end


  post '/bookmarks' do
    Bookmarks.create(url: params['url'])
    redirect '/'
  end

  run! if app_file == $0
end
