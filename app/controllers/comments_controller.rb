class CommentsController < ApplicationController
  def create
    #binding.pry
    @comment = Comment.new(params[:comment])
    @comment.user = User.find(rand(User.count) + 1)
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
  
end