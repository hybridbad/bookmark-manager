require 'sinatra/base'
require './lib/bookmarks'
require 'pg'

# Web app class
class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

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
    erb :"bookmarks/add"
  end

  # post route for add form, calls add class method and passes in url argument as params
  post '/bookmarks/add' do
    Bookmark.add(url: params[:url_text], title: params[:title])

    redirect '/bookmarks'
  end

  # delete route for delete request using bookmark ID and Sinatra named parameters and method_override 
  # (because silly HTML doesn't allow delete requests)
  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"bookmarks/update"
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:update_title], url: params[:update_url])
    redirect '/bookmarks'
  end
 
  run! if app_file == $0
end
