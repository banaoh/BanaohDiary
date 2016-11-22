class ArticlesController < ApplicationController
  before_action :set_params, only:[:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(post_params)
    @article.save
    redirect_to articles_path
  end

  def show
  end

  def edit
  end

  def update
    @article.update(post_params)
    redirect_to article_path(params[:id])
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_params
    @article = Article.find(params[:id])
  end

  def post_params
    params.require(:article).permit(:title, :body, :author)
  end
end
