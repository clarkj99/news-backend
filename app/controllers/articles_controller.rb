class ArticlesController < ApplicationController
  def index
    articles = Article.all.order("published_at DESC").limit(300)
    render json: articles
  end

  def show
    article = Article.find_by(id: params[:id])
    render json: article, include: :category
  end
end
