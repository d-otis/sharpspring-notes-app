class SessionsController < ApplicationController

  def new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      login_user(@user)

      redirect_to user_path(@user)
    else
      flash[:notice] = "Error logging in" if @user.nil?
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to "/login"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end