require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/bookmark'
require './lib/comment'
require './database_connection_setup.rb'
require 'uri'

class BookmarkManager < Sinatra::Base
  configure :development do
    enable :sessions, :method_override
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  get '/' do
    erb(:'bookmarks/home')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  post '/bookmarks' do
    flash[:notice] = "Invalid url" unless Bookmark.new_bookmark(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb(:'bookmarks/new')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete_bookmark(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]
    erb(:'bookmarks/edit')
  end

  patch '/bookmarks/:id' do
    Bookmark.edit_bookmark(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(bookmark_id: params[:id], text: params[:comment])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
