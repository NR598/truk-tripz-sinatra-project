class PostsController < ApplicationController

  get '/posts' do # index
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/new' do # new
    erb :'posts/new'
  end

  get '/posts/:id' do # show
    @post = find_post
    erb :'posts/show'
  end

  get '/posts/:id/edit' do # edit
    @post = find_post
    erb :'posts/edit'
  end

  patch "/posts/:id" do # update
    post = find_post
    if authorized_to_edit(post)
      post.update(params[:post])
      redirect "/posts/#{post.id}"
    else
      "You can't do that!!!"
    end
  end

  post '/posts' do # create
    post = Post.new(params[:post])
    post.user_id = session[:user_id]
    post.save
    redirect "/posts/#{post.id}"
  end

  private

  def find_post
    Post.find_by(id: params[:id])
  end

end
