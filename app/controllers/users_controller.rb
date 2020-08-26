class UsersController < ActionController::Base
  layout 'application'

  def new
    @user = User.new
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

  private

  def build_params
    params.require(:user).permit(:username, :email, :password)
  end
end
