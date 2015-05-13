class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'Great! You have successfully signed up'
      redirect_to @user
    else
      flash.now[:danger] = 'Could not sign you up for some reason. Sorry but we are on it!'
      render 'new'
    end
  end
  
#   def index
#     @users = User.all
#   end
  
  def edit
  end
  
  def show
    @user = User.find_by_id(params[:id])
  end
  
#   def delete
#   end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :profile_picture)
  end
end
