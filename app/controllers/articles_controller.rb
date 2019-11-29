class ArticlesController < ApplicationController
  def index
    articles = Article.all.limit(300)
    render json: articles
  end
end
