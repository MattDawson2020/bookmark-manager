require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:home)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  post '/bookmarks' do
    Bookmark.new_bookmark(title: params[:title], url: params[:bookmark_url])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb(:new)
  end

  run! if app_file == $0

end
