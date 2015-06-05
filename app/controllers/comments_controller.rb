class CommentsController < ApplicationController

  before_filter :authorize

  def new
    @comment = Comment.new
  end

  def create
    @beer = Beer.find_by(id: params[:beer_id])
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to "/comments/#{comment.id}"
    else
      redirect_to "/beers/#{beer.id}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(:user_id => @current_user.id, :beer_id => params[@beer.id])
  end
end