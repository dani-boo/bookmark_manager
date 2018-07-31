# Controller class
require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    'I am here'
  end

  run! if app_file == $0
end
