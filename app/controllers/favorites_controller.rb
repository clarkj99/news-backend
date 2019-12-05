class FavoritesController < ApplicationController
  before_action :find_favorite, only: [:show, :edit, :delete, :update]

  def index
    @favorites = Favorite.all
  end

  def show
  end

  def create
    @favorite = Favorite.new(favorite_params)

    if @favorite.valid?
      @favorite.save
      render json: @favorite
    else
      render json: { status: 899, message: @favorite.errors.full_messages[0] }
    end
  end

  def destroy
    @favorite.destroy
  end

  def find_favorite
    @favorite = Favorite.find_by(id: params[:id].to_i)
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :article_id)
  end
end
