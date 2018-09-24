require 'sinatra/base'

class BookMarker < Sinatra::Base

  enable :sessions

  get "/" do
    "Testing"
  end

  get "/bookmarks" do
    erb :bookmark
  end

  run! if app_file == $0
end
