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
      "User is already logged in."
    else
      erb :'sessions/signup'
    end
  end

  post '/signup' do
    user = User.create(params[:user])
    session[:user_id] = user.id
    redirect "/loads"
  end

  post '/login' do
    user = User.find_by_username(params[:username])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/loads"
      else
        "Username/password invalid."
      end
    else
      "User name does not exist."
    end
  end

  get '/super_secret' do
    if is_logged_in
      "You're logged in! Welcome driver."
    else
      "Driver not logged in."
    end
  end

  get '/logout' do
    session.clear
    redirect "/home"
  end

end
