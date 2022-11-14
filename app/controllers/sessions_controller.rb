class SessionsController < ApplicationController
  def home
  
  end

  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "succefully logged in "
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination' #
      render 'new'
    end
    end
    def destroy
      session[:user_id] = nil
   flash[:success] = 'Logged out succefully'
   redirect_to login_path
 end
  end
