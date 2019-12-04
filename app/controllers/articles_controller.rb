class ArticlesController < ApplicationController
  def index
    if params[:country_id] && params[:category_id]
      country = Country.find_by(id: params[:country_id])
      articles = country.articles.select do |article|
        article.category_id == params[:category_id].to_i
      end
    else
      articles = Article.all.order("published_at DESC").limit(100)
    end
    render json: articles
  end

  def show
    article = Article.find_by(id: params[:id])

    render json: article, include: :category
  end
end
