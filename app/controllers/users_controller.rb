class UsersController < ApplicationController
  # we want to make a profile page for user to see his api_key
  before_filter :correct_user, only: :show
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, notice: "Signed up!"
    else
      render "new"
    end
  end
  
private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
