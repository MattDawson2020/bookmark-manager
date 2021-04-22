require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  configure :development do
    register Sinatra::Reloader
  end



  get '/' do
    erb(:'bookmarks/home')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  post '/bookmarks' do
    Bookmark.new_bookmark(title: params[:title], url: params[:bookmark_url])
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
