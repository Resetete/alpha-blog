class PagesController < ApplicationController
  def home
    @all_articles = Article.all
    @most_liked_articles = LikesPair.sort_articles_by_likes.map do |article|
      Article.find(article.article_id)
    end
  end

  def about
  end
end
