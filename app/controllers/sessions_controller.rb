class SessionsController < ApplicationController

  get '/login' do
    if is_logged_in
      redirect '/loads'
    else
      erb :'sessions/login'
    end
  end

  get '/signup' do
    if is_logged_in
      'A user is already logged in'
    else
      erb :'sessions/signup'
    end
  end

  post '/signup' do
    # binding.pry
    user = User.find_by_username(params[:user][:username])
    if !user
      user = User.create(params[:user])
      session[:user_id] = user.id
      redirect '/login'
    else
      'Username already taken'
    end
  end

  post '/login' do
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/loads'
    else
      erb :'sessions/fail'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
