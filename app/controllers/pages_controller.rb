class PagesController < ApplicationController
  def home
    @all_articles = Article.all
    @sorted_liked_articles = LikesPair.all.sort_by do |pair|
      [pair.likes_count, pair.article_id]
    end.reverse!.first(9)
    @most_liked_articles = @sorted_liked_articles.map do |article|
      Article.find(article.article_id)
    end
  end

  def about
  end
end
