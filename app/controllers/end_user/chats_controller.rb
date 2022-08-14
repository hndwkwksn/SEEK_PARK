class EndUser::ChatsController < ApplicationController
  before_action :reject_non_related, only: [:show]

  def show
    @end_user = EndUser.find(params[:id])
    rooms = current_end_user.user_rooms.pluck(:room_id) #ログイン中のユーザーの部屋情報を全て取得
    user_rooms = UserRoom.find_by(end_user_id: @end_user.id, room_id: rooms) #その中にチャットする相手とのルームがあるか確認

    unless user_rooms.nil? #ユーザールームが無くなかった（つまりあった。）
      @room = user_rooms.room #変数@roomにユーザー（自分と相手）と紐づいているroomを代入
    else #ユーザールームが無かった場合
      @room = Room.new
      @room.save
      UserRoom.create(end_user_id: current_end_user.id, room_id: @room.id) #自分の中間テーブルを作る
      UserRoom.create(end_user_id: @end_user.id, room_id: @room.id) #相手の中間テーブルを作る
    end
    @chats = @room.chats #チャットの一覧用の変数
    @chat = Chat.new(room_id: @room.id) #チャットの投稿用の変数
  end

  def create
    @chat = current_end_user.chats.new(chat_params)
    render :validater unless @chat.save #新規投稿が保存されなかった場合validater.js.erbを探す
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end

  # 相互フォローかどうかを見る
  def reject_non_related
    end_user = EndUser.find(params[:id])
    unless current_end_user.following?(end_user) && end_user.following?(current_end_user)
      redirect_to parks_path
    end
  end
end
