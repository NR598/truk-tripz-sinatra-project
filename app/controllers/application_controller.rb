require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :home
  end

  helpers do

    def is_logged_in
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def authorized_to_edit(load)
      load.user_id == session[:user_id]
    end

  end

end
