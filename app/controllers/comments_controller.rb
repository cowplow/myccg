class CommentsController < ApplicationController
  before_action :require_user

  def create
    @comment = Comment.new(comment_params)
    @card = Card.find_by(slug: params[:card_id])
    @comment.user = current_user

    if @comment.save
      @card.comments << @comment
      redirect_to card_path(@card)
    else
      render 'cards/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end