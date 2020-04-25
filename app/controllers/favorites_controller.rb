class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @user = current_user
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = "投稿をお気に入りに追加しました"
    redirect_back(fallback_location: likes_user_path(@user))
  end

  def destroy
    @user = current_user
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = "投稿をお気に入りから削除しました"
    redirect_back(fallback_location: likes_user_path(@user))
  end

end
