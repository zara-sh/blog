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

  def create
    # render plain: params[:article].inspec
    @article = Article.new(article_parmas)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private
  def article_parmas
    params.require(:article).permit(:title, :text)
  end
end
