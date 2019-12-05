class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories
  end

  def show
    category = Category.find_by(id: params[:id])
    render json: category, include: :articles
  end
end
