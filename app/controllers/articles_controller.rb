class ArticlesController < ApplicationController
  def index
    if params[:country_id] && params[:category_id]
      country = Country.find_by(id: params[:country_id])
      articlesCo = country.articles
      category = Category.find_by(id: params[:category_id])
      articlesCa = category.articles
      articles = articlesCo.select do |article|
        articlesCa.include?(article)
      end
    elsif params[:country_id]
      country = Country.find_by(id: params[:country_id])
      articles = country.articles.limit(199)
    elsif params[:category_id]
      category = Category.find_by(id: params[:category_id])
      articles = category.articles.limit(199)
    else
      articles = Article.all.order("published_at DESC").limit(199)
    end
    render json: articles
  end

  def show
    article = Article.find_by(id: params[:id])

    render json: article, include: [:categories, :countries]
  end
end
