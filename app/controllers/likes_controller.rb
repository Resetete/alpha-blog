class LikesController < ApplicationController
  before_action :find_article
  before_action :find_like, only: [:destroy]

  def create
    @article.likes.create(article_id: params[:article_id])
    redirect_to article_path(@article)
  end

  def destroy
    if !already_liked?
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to article_path(@article)
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_like
    @like = @article.likes.find(params[:id])
  end

  def already_liked?
    Like.where(article_id: params[:article_id]).exists?
  end
end