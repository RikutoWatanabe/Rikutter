 class FavoritesController < ApplicationController
 
 	before_filter :require_login

 	def create
 		@tweet	= Tweet.find(params[:tweet_id])
 		@favorite = current_user.favorites.build(tweet: @tweet)

 		if @favorite.save
 			redirect_to request.referer, notice: "お気に入りに登録しました"
 		else
 			redirect_to request.referer, alert: "このツイートはお気に入りに登録できません"
 		end
 	end

 	def destroy
 		if 	@favorite = current_user.favorites.find_by!(tweet_id: params[:tweet_id])
 		 	@favorite.destroy
 			redirect_to request.referer, notice: "お気に入りを解除しました"
 		else
 			redirect_to request.referer, alert: "お気に入りの解除に失敗しました。"
 		end
 	end

 end 