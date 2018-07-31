# Controller class
require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'I am here'
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    Bookmark.all
  end

  run! if app_file == $0
end
