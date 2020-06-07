class PagesController < ApplicationController
  def home
    @article = Article.all
    most_liked
  end

  def about
  end

  private

  def most_liked
    @most_liked  = Like.order('articles.likes DESC').limit(9) # gets the articles with highest count of likes
  end

  def show_latest
  end
end
