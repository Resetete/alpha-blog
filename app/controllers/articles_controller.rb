class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id]) # find the article with id from url
  end

  def index
    @articles = Article.all
  end

  def create
    # create new instance variable from Article based on the params information; params need to have the top level key :article and from it we allow the attributes :title, :description to be stored
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save 
    redirect_to articles_path(@article) # rails extracts the id from this instance variable
  end

  def new
  end
end
