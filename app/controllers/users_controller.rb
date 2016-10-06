class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def register_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if !@user.admin?
        @user.balance = 1500
      else
        @user.balance = 0
      end
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def reset_accounts
    @participants = User.participants
    @participants.each do |p|
      p.balance = 1500
      p.save
    end
    redirect_to '/stocks'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :company_account_id, :admin, :balance)
  end

  #Before filters

  #Confirms logged-in User

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  #Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(home_url) unless current_user?(@user) || current_user.admin?
  end

  def admin_user
    redirect_to(home_url) unless current_user.admin?
  end
end
