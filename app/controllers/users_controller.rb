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
    if user.update(user_params)
      #   redirect_to user_path(@user)
    else
      #   render :edit
    end
  end

  private

  def find_user
    @user = User.find_by(username: user_params[:username].strip)
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
