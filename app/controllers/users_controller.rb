class UsersController < ApplicationController
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'users/show'
    binding.pry
  end
end
