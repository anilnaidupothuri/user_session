class MicropostsController < ApplicationController
  include SessionsHelper
  def new
    @micropost = Micropost.new
  end

  def show
    @post = Micropost.find(params[:id])
  end

  def create
    @micropost = current_user.microposts.create(micropost_params)
    byebug
    return unless @micropost.save
    byebug

    flash[:success] = ' post created succefully'
    redirect_to root_path
  end

  def destroy; end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end
end
