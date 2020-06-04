class PagesController < ApplicationController
  def home
    @article = Article.all
    redirect_to articles_path if logged_in?
  end

  def about
  end
end
