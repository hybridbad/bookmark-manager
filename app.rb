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
    @title = session[:title]

    erb :bookmarks
  end

  get '/bookmarks/add' do
    erb :add
  end

  post '/bookmarks' do
    Bookmarks.add(url: params[:url_text])
    session[:title] = params[:title]

    redirect '/bookmarks'
  end
 
  run! if app_file == $0
end
