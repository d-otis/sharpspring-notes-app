class SessionsController < ApplicationController

  def new
    
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
    
  end

end