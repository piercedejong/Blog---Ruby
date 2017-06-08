class ArticlesController < ApplicationController
  before_action :check_current_user, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = current_user.articles.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)
    @article.update(user_uuid: current_user.uuid)
    if @article.save
      redirect_to article_path(@article.uuid)
    else
      render 'new'
    end
  end

  def update
     @article= current_user.articles.find_by(uuid: params[:uuid])
    if @article.update(article_params)
      redirect_to article_path(@article.uuid)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    def check_current_user
      if !current_user
        redirect_to articles_path
      end
    end

    def article_params
      params.require(:article).permit(:title, :about, :text)
    end

    def set_article
        @article= current_user.articles.find_by(uuid: params[:id])
      if @article.nil?
        @article= Article.find_by(uuid: params[:id])
      end
    end

end
