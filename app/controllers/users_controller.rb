class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(first_name: params[:first_name], last_name: params[:last_name], location: params[:location])
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "/users/#{@user.id}"
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :location, :username, :password, :password_confirmation)
    end
end