require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/bookmark'
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
    p params
    flash[:notice] = "Invalid url" unless Bookmark.new_bookmark(title: params[:title], url: params[:url])
    redirect '/bookmarks'
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

  get '/bookmarks/new' do
    erb(:'bookmarks/new')
  end

  run! if app_file == $0

end
