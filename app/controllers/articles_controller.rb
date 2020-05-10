class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id]) # find the article with id from url
  end

  def index
    @articles = Article.all
  end
end
