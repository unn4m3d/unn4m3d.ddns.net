class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.order("post_date DESC").page(params[:page] || 0)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    authorize! :create, Post
    if params[:title] and params[:content]
      @post = Post.create(
        :title => params[:title],
        :content => params[:content],
        :user => current_user,
        :post_date => Time.now,

      )
      redirect_to action: "index"
    end
  end

  def update
    authorize! :update, Post
    @post = Post.find(params[:id])
    if params[:title] and params[:content] and params[:id]
      @post.content = params[:content]
      @post.title = params[:title]
      @post.save
      redirect_to action: "index"
    end
  end

  def delete
    authorize! :delete, Post
    Post.delete(params[:id])
    redirect_to action: "index"
  end
end
