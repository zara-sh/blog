class ArticlesController < ApplicationController

  http_basic_authenticate_with name:'dhh',
  password: 'secret', expect:[:index, :show]
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
    @article = Article.find(params[:id])
    if @article.update(article_parmas)
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    #render "index"
  end

  private
  def article_parmas
    params.require(:article).permit(:title, :text)
  end
end
