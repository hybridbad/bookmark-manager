require 'sinatra/base'
require './lib/bookmarks'

# Web app class
class BookmarkManager < Sinatra::Base

  enable :sessions

  # load index view on root of domain url
  get '/' do
    erb :index
  end

  # bookmark route display bookmarks view and populate with display_all class method
  get '/bookmarks' do
    @bookmarks = Bookmark.display_all

    erb :bookmarks
  end

  # route for add bookmark view for form
  get '/bookmarks/add' do
    erb :add
  end

  # post route for add form, calls add class method and passes in url argument as params
  post '/bookmarks/add' do
    Bookmark.add(url: params[:url_text], title: params[:title])

    redirect '/bookmarks'
  end
 
  run! if app_file == $0
end
