class UsersController < ApplicationController
  before_action :find_user, only: [:create, :update]

  def index
    users = User.all
    render json: users, include: :articles
  end

  def show
    render json: user, include: :articles
  end

  def create
    if @user
      render json: @user, include: :articles
    else
      user = User.new(username: user_params[:username].strip)
      if user.valid?
        user.save
        render json: user
      else
        render json: { status: 999, message: user.errors.full_messages[0] }
      end
    end
  end

  def update
    # get article
    article = Article.find_by(id: user_params[:article_id])

    # create favorite
    favorite = Favorite.create(user: @user, article: article)
    if favorite.valid?
      render json: @user.favorites
    else
      render json: { status: 899, message: favorite.errors.full_messages[0] }
    end
  end

  private

  def find_user
    @user = User.find_by(username: user_params[:username].strip)
  end

  def user_params
    params.require(:user).permit(:username, :article_id)
  end
end
