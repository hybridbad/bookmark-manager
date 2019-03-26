require 'sinatra/base'
require './lib/bookmarks'

# Web app class
class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.display_all
    erb :bookmarks
  end

  run! if app_file == $0
end
