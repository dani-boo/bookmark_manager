require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    # p ENV
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url: params['url'], title: params['title'])
    else
      flash[:notice] = "Please submit a valid URL"
    end
      redirect '/bookmarks'
  end

  run! if app_file == $0
end
