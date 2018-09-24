require 'sinatra/base'

class BookMarker < Sinatra::Base

  enable :sessions

  get "/" do
    "Testing"
  end

  run! if app_file == $0
end
