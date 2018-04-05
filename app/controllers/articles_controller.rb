class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article].inspec
    @article = Article.new(article_parmas)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

    def update
    @article = Artilce.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

  private
  def article_parmas
    params.require(:article).permit(:title, :text)
  end
end
