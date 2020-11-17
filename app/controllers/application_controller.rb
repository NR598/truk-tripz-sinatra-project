require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "5b397928e3c16ef1f7d9"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do #helper methods are available in all controllers BUT most importantly, are available in all views

    def is_logged_in
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def authorized_to_edit(post)
      post.user_id == session[:user_id]
    end

  end

end
