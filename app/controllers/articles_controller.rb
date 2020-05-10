class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id]) # find the article with id from url
  end
end
