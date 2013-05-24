class CommentsController < ApplicationController
  before_filter :require_user, :only => :vote
  def create
    #binding.pry
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:notice] = "Great!  Thanks for your comment!"
      puts "***** This saved *****"
      redirect_to post_path(@comment.post)
    else
      flash[:error] = "Sorry...Um you didn't enter a comment"
      @post = Post.find(params[:post_id])
      redirect_to @post
    end
  end
  
  def vote
    #binding.pry
    comment = Comment.find(params[:comment_id])
    post = Post.find(params[:post_id])
    vote = Vote.new(votable: comment, user: current_user, vote: params[:vote])
    if vote.save
      flash[:notice] = "Thanks for your vote!"
    else
      flash[:warning] = "Uh oh.  For some reason we couldn't record your vote"
    end
    redirect_to post_path(post)
  end
  
end