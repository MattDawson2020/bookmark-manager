require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # before do
  #   @bookmark = Bookmark.instance
  # end

  get '/' do
    erb(:home)
  end

  get '/list' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  post '/list' do
    Bookmark.new_bookmark(params[:bookmark_url])
    redirect '/list'
  end

  get '/new' do
    erb(:new)
  end

  run! if app_file == $0
end