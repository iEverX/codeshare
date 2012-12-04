class CommentController < ApplicationController

  def newx
    @comment = Comment.new
  end

  def new
    @comment = Comment.new

    @comment[:code_id] = params[:id]
    @comment[:email] = params[:comment][:email]
    @comment[:nick] = params[:comment][:nick]
    @comment[:content] = params[:comment][:content]
    @comment[:page] = params[:comment][:page] if params[:comment][:page]
    @comment.save!
    redirect_to "/code/show/#{@comment[:code_id]}"
  end

end