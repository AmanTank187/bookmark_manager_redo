require 'sinatra/base'
require './lib/bookmark'
require './lib/user'
require './database_connection_setup'
require 'sinatra/flash'
require_relative './lib/comment'


class BookmarkManager < Sinatra::Base 

    enable :sessions, :method_override
    register Sinatra::Flash

    get '/' do
        'Bookmark Manager'
    end 

    get '/bookmarks' do
      # Fetch the user from the database, using an ID stored in the session
      @user = User.find(session[:user_id])
      @bookmarks = Bookmark.all
      erb :"bookmarks/index"  
    end

    get '/bookmarks/new' do

        erb:'/bookmarks/new'
    end 

    post '/bookmarks' do
        flash[:notice] = "You must submit a valid URL." unless Bookmark.create(url: params[:url], title: params[:title])
        redirect '/bookmarks'
    end 

    get '/bookmarks/:id/edit' do
        @bookmark = Bookmark.find(id: params[:id])
        erb:'/bookmarks/edit'
      end

    patch '/bookmarks/:id' do
        Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
        redirect '/bookmarks'
      end

      delete '/bookmarks/:id' do
        Bookmark.delete(id: params[:id])
        redirect '/bookmarks'
      end

      get '/bookmarks/:id/comments/new' do
        @bookmark_id = params[:id]
        erb:'comments/new'
      end

      post '/bookmarks/:id/comments' do
        Comment.create(text: params[:comment], bookmark_id: params[:id])
        redirect '/bookmarks'
      end

      get '/users/new' do
        erb :"users/new"
      end
      
      post '/users' do
        user = User.create(email: params[:email], password: params[:password])
        session[:user_id] = user.id
        redirect '/bookmarks'
      end
    

    run! if app_file == $0 

end 