class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    @post.user = User.find(rand(User.count) + 1)
    if @post.save
      flash[:notice] = "Congratulation!  Your post was saved"
      @posts = Post.all
      redirect_to @post
    else
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Congratulation!  Your post was saved"
      @posts = Post.all
      redirect_to @post
    else
      redirect_to :edit
    end
  end

end
