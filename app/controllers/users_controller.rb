class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    #raise params.inspect
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
      session[:user_id] = @user.id
    else
      render :new
    end 
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
