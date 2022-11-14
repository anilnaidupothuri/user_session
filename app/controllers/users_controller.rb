class UsersController < ApplicationController

  before_action :user_id, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.page(params[:page])
  end

  def show; end

  def new

    @user = User.new
      byebug
  end

  def create
    byebug
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = user.id
      byebug
      UserMailer.account_activation(@user).deliver_now
      byebug
      flash[:info] = "Please check your email to activate your account."

    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
      flash[:success] = "your details updated succefully"
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:users).permit(:name, :email, :password, :password_confirmation, :activation_digest)
    byebug
  end

  def user_id
    @user = User.find(params[:id])
  end
end
