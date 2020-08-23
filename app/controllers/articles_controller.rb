class ArticlesController < ActionController::Base
  layout 'application'

  before_action :find_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show; end

  def create
    @article = Article.new(build_params)
    if @article.save
      flash[:notice] = 'Article added'
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @article.update(build_params)
      flash[:notice] = 'Updated correctly'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def build_params
    params.require(:article).permit(:title, :description)
  end
end
