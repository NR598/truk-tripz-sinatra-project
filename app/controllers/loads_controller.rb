class LoadsController < ApplicationController
  get '/loads' do
    if is_logged_in
      @loads = Load.all
      erb :'/loads/index'
    else
      redirect '/'
    end
  end

  get '/loads/new' do # GET
    erb :'loads/new'
  end

  get '/loads/:id' do # GET
    @loads = find_load
    erb :'loads/show'
  end

  get '/loads/:id/edit' do # GET
    if authorized_to_edit
      @loads = find_load
      erb :'loads/edit'
    else erb :'/sessions/fail'
    end
  end

  patch '/loads/:id' do # UPDATE
    load = find_load
    load.update(params[:load])
    redirect '/loads'
  end

  post '/loads' do # POST
    load = Load.new(params[:load])
    load.user_id = session[:user_id]
    load.save
    redirect '/loads'
  end

  delete '/loads/:id' do # DELETE
    load = Load.find_by_id(params[:id])
    load.destroy
    redirect '/loads'
  end

  private

  def find_load
    Load.find_by(id: params[:id])
  end
end
