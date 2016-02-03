class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_back_or @user
    else
      flash.now[:danger] = 'Invalid email and password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to home_path
  end

  #Before action filters
  def logged_in_user
    if logged_in?
      redirect_to home_path
    end
  end

end
