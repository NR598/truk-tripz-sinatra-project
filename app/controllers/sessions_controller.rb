class SessionsController < ApplicationController

  get '/login' do
    if is_logged_in
      redirect "/loads"
    else
      erb :'sessions/login'
    end
  end

  get '/signup' do
    if is_logged_in
      "A user is already logged in"
    else
      erb :'sessions/signup'
    end
  end

  post '/signup' do
    @user = User.create(params[:user])
    session[:user_id] = @user.id
    redirect "/loads"
  end
 
  post '/login' do
    @user = User.find_by_username(params[:username])
    if @user
      if @user.authenticate(params[:password_digest])
        session[:user_id] = @user.id
        redirect "/loads"
      else
        "Password Invalid"
      end
    else
      "Username Invalid"
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end

end


