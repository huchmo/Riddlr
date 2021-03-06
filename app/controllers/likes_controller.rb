class LikesController < ApplicationController
  def create

    @like = Like.new(like_params)
    @like.user_id = current_user.id
    if @like.save
      render json: @like
    else
      render json: @like.errors.full_messages, status: :unprocessable_entity
    end
  end
  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    render json: {}
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
