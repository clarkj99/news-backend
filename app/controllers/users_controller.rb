class UsersController < ApplicationController
  before_action :find_user, only: [:create, :update]

  def index
    users = User.all
    render json: users, include: [:articles, :favorites]
  end

  def show
    if params[:id]
      @user = User.find_by(id: params[:id])
    else
      @user = User.find_by(user_params[:username].strip)
    end
    render json: @user, include: [:articles, :favorites]
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
  end

  private

  def find_user
    @user = User.find_by(username: params[:id] || user_params[:username].strip)
  end

  def user_params
    params.require(:user).permit(:username, :article_id)
  end
end
