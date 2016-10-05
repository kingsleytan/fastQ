class UsersController < ApplicationController

  before_action :authenticate!, only: [:edit, :update]

  def show
    @user = User.friendly.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to offices_path
      flash[:success] = "Welcome to FastQ."
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.friendly.find(params[:id])
    authorize @user
  end

  def update
    @user = User.friendly.find(params[:id])
    authorize @user
    if @user.update(user_params)
      flash[:success] = "You've updated the user."

      redirect_to root_path
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to edit_user_path(@user)

    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :image, :username, :country)
    end

  end
