class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:favorite][:post])
    favorite = @post.favorites.new
    if favorite.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to root_path
    end
  end
end
