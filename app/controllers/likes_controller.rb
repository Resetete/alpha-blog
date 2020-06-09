class LikesController < ApplicationController
  before_action :find_article
  before_action :find_like, only: [:destroy]
  before_action :find_likes_pair, only: [:destroy, :create]

  def create
    @article.likes.create(params[:id])
    if !@article.likes_pairs.exists?
      create_likes_pair
    else
      update_likes_pair
    end
    redirect_to article_path(@article)
  end

  def destroy
    if !already_liked?
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
      update_likes_pair
    end
    redirect_to article_path(@article)
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_like
    @like = @article.likes.last
  end

  def find_likes_pair
    @likes_pair = @article.likes_pairs
  end

  def update_likes_pair
    @likes_pair.update(likes_count: @article.likes.count)
  end

  def create_likes_pair
    @likes_pair.create(likes_count: @article.likes.count)
  end

  def already_liked?
    Like.where(article_id: params[:article_id]).exists?
  end
end
