class PostsController < ApplicationController
  before_filter :require_user, :except => [:index, :show, :search]
  
  def index
    @posts = Post.all.reverse
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
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
  
  def search
    searchstring = "%#{params[:q]}%"
    @posts = Post.where("description like ? or title like ? or url like ?", searchstring, searchstring, searchstring ).reverse
    if @posts.count > 0
      flash.now[:notice] = "Your search returned #{@posts.count} results"
    else
      flash.now[:warning] = "Your search didn't return any results"
    end
    render :index
  end

end
