class LoadsController < ApplicationController

  get '/loads' do
    if is_logged_in
      @loads = Load.all 
      erb :'/loads/index'
    else 
      redirect "/"
    end
  end 

  get '/loads/new' do #get
    erb :'loads/new'
  end

  get '/loads/:id' do #get
    @loads = find_load
    erb :'loads/show'
  end

  get '/loads/:id/edit' do #get
    @loads = find_load
      erb :'loads/edit'
  end
    
  

  patch "/loads/:id" do #update
    load = find_load
      load.update(params[:load])
      redirect "/loads" 
  end

  post '/loads' do # load
    load = Load.new(params[:load])
    load.user_id = session[:user_id]
    load.save
    redirect "/loads"
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
