class SessionsController < ApplicationController
  
  #include SessionsHelper
  
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to root_url
    else
      flash.now[:danger] = 'Wrong email and/or password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
