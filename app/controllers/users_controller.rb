class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
    redirect_to user_path(current_user) if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user(@user)
      redirect_to user_path(@user), notice: "You have created a new account!"
    else
      redirect_to new_user_path, notice: @user.errors.full_messages
    end
  end
  
  def show
    redirect_to "/login" unless logged_in?
    @notes = current_user.notes.order(:pinned => :desc)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: ["You've updated your info"]
    else
      flash[:notice] = current_user.errors.full_messages
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, 
                                  :last_name, 
                                  :email, 
                                  :password, 
                                  :password_confirmation)
  end

end