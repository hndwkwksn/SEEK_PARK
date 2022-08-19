class EndUser::ParkCommentsController < ApplicationController
  def create
    park = Park.find(params[:park_id])
    @comment = current_end_user.park_comments.new(park_comment_params)
    @comment.park_id = park.id
    @comment.save
    render :validater unless @comment.save #新規投稿が保存されなかった場合validater.js.erbを探す
  end

  def destroy
    @comment = ParkComment.find(params[:id])
    @comment.destroy
  end

  private

  def park_comment_params
    params.require(:park_comment).permit(:comment)
  end
end
