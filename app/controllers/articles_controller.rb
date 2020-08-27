# frozen_string_literal: true

class ArticlesController < ActionController::Base
  layout 'application'

  before_action :find_article, only: %i[show edit update destroy]
  before_action :require_login, except: %i[index show]
  before_action :check_user, only: %i[edit update destroy]

  include ApplicationHelper

  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def show; end

  def create
    @article = Article.new(build_params)
    user = current_user
    @article.user = user
    if @article.save
      flash[:notice] = 'Article added'
      redirect_to(@article)
    else
      render('new')
    end
  end

  def edit; end

  def update
    if @article.update(build_params)
      flash[:notice] = 'Updated correctly'
      redirect_to(@article)
    else
      render('edit')
    end
  end

  def destroy
    @article.destroy
    redirect_to(request.referrer || articles_path)
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def build_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def check_user
    require_user(@article.user, article_path(@article))
  end
end
