class CommentController < ApplicationController

  def new
    @comment = Comment.new

    @comment[:code_id] = params[:id]
    @comment[:email] = params[:comment][:email]
    @comment[:nick] = params[:comment][:nick]
    @comment[:content] = params[:comment][:content]
    @comment[:page] = params[:comment][:page] if params[:comment][:page] != "" && params[:comment][:page] != nil
    
    if params[:comment][:page] != "" && params[:comment][:page] != nil
      if params[:comment][:page] =~ /http:\/\//
        @comment[:page] = params[:comment][:page]
      else
        @comment[:page] = "http://#{params[:comment][:page]}"
      end
    end

    @comment.save
    redirect_to "/code/show/#{@comment[:code_id]}"
  end

end