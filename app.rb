require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmarks'
require './lib/db_connection_setup'
require './lib/comment'
require 'uri'

# Web app class
class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

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
    flash[:notice] = "You must submit a valid URL." unless Bookmark.add(url: params[:url_text], title: params[:title])
    # Bookmark.add(url: params[:url_text], title: params[:title])

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

  # PATCH method route do to update bookmark with params given from update view form
  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:update_title], url: params[:update_url])
    redirect '/bookmarks'
  end

  # GET route to new view with bookmark id passed on
  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :"comments/new"
  end

  # post route for posting form data for new comment on bookmark using id ref
  post '/bookmarks/:id/comments' do
    Comment.create(bookmark_id: params[:id], text: params[:comment])

    redirect '/bookmarks'
  end
 
  run! if app_file == $0
end
