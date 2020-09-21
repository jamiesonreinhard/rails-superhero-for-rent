class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.superhero = Superhero.find(params[:superhero_id])
    @favorite.save
  end

  def destroy
    @favorite = current_user.favorites.find_by(superhero_id: params[:superhero_id])
    @favorite.destroy
  end
end
