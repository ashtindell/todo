class UsersController < ApplicationController
  # before_action :correct_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: "Welcome!"
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email,
        :password, :password_confirmation) # do not allow :admin
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end