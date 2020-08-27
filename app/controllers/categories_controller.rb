# frozen_string_literal: true

class CategoriesController < ActionController::Base
  layout 'application'
  before_action :require_login, only: %i[new edit update]

  include ApplicationHelper

  def index
    @categories = Category.paginate(page: params[:page], per_page: 3)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(build_params)
    if @category.save
      flash[:notice] = 'Category added!'
      redirect_to(categories_path)
    else
      render('new')
    end
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.paginate(page: params[:page], per_page: 3)
    redirect_to(categories_path) if @category.nil?
  end

  private

  def build_params
    params.require(:category).permit(:name)
  end
end
