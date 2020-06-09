class LikesPair < ApplicationRecord
  belongs_to :article

  NumberOfArticles = 9.freeze

  def self.sort_articles_by_likes
    LikesPair.all.sort_by do |pair|
      [pair.likes_count, pair.article_id]
    end.reverse!.first(NumberOfArticles)
  end
end
