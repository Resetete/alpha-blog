class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    # this is needed to have an empty article variable when the new page is loaded the first time
    @article = Article.new
  end

  def edit
  end

  def create
    # create new instance variable from Article based on the params information; params need to have the top level key :article and from it we allow the attributes :title, :description to be stored
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article successful saved'
      redirect_to @article # rails extracts the id from this instance variable
    else
      render 'new' # render new template again
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully.'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
end

private

def set_article
  @article = Article.find(params[:id])
end

def article_params
  params.require(:article).permit(:title, :description)
end

def require_same_user
  if current_user != @article.user && !current_user.admin?
    flash[:alert] = "You can only edit or delete your own article"
    redirect_to @article
  end
end
