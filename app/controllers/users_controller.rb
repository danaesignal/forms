class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find_by id: params[:id]
  end

  def update
    @user = User.find_by id: params[:id]
    if @user.update(user_params)
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  def show
    redirect_to edit_user_path
  end

  def create

    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end
end

private

def user_params
  params.require(:user).permit(:username, :email, :password, :authenticity_token)
end
