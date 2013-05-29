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
    @mode = params[:mode]
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Congratulation!  Your post was saved"
      @posts = Post.all
      redirect_to @post
    else
      render :edit
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
  
  def vote
    @post = Post.find(params[:id])
    vote = Vote.new(votable: @post, user: current_user, vote: params[:vote])
    if vote.save
      flash.now[:notice] = "Thanks for your vote!"
    else
      flash.now[:warning] = "Uh oh.  For some reason we couldn't record your vote"
    end
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js
    end
    
  end

end
