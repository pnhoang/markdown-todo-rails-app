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
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Signed up!"
    else
      render "new"
    end
  end
  
end
