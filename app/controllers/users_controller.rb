class UsersController < ApplicationController
  skip_before_action :authenticated_user!
  before_action :redirect_if_authenticated, only: %i[new]
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "You have successfully signed up"
    else
      render :new , status: :unprocessable_entity
    end
  end
    
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,:password_confirmation)
  end
end
