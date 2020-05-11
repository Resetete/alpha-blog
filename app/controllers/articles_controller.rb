class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id]) # find the article with id from url
  end

  def index
    @articles = Article.all
  end

  def new
    # this is needed to have an empty article variable when the new page is loaded the first time
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # create new instance variable from Article based on the params information; params need to have the top level key :article and from it we allow the attributes :title, :description to be stored
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = 'Article successful saved'
      redirect_to @article # rails extracts the id from this instance variable
    else
      render 'new' # render new template again
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = 'Article was updated successfully.'
      redirect_to @article
    else
      render 'edit'
    end
  end
end
