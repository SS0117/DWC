class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def edit
    user = User.find(params[:id])
    unless current_user == user
      redirect_to user_path(current_user.id)
    end
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    unless current_user == user
      redirect_to user_path(current_user.id)
    end

    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
