class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: "Welcome to the site!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
