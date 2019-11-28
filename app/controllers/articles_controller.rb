class ArticlesController < ApplicationController
  def index
    articles = Article.all.limit(100)
    render json: articles
  end
end
