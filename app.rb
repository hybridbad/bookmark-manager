require 'sinatra/base'
require './lib/bookmarks'

# Web app class
class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.display_all
    erb :bookmarks
  end

  post '/bookmarks/create' do
    Bookmarks.add(params[:url_text])
    erb :bookmark_saved
  end

  get '/bookmarks/create' do
    erb :create
  end

  run! if app_file == $0
end
