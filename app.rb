require 'sinatra/base'
require_relative 'lib/bookmarks'

class BookMarker < Sinatra::Base

  enable :sessions

  get "/" do
    @bookmarks = Bookmarks.all?
    erb :bookmarks
  end


  run! if app_file == $0
end
