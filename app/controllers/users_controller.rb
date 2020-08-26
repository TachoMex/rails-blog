class UsersController < ActionController::Base
  layout 'application'

  before_action :find_user, only: %i[show edit update destroy]

  def new
    @user = User.new
  end

  def show
    @articles = @user.articles
  end

  def create
    @user = User.new(build_params)
    if @user.save
      flash[:notice] = "You signup was successful. Welcome #{@user.username}!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(build_params)
      flash[:notice] = 'Updated correctly'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def build_params
    params.require(:user).permit(:username, :email, :password)
  end
end
