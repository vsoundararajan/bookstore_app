class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]

  def index
    @users = User.all  
  end

  def new
    @user = User.new
    @user.addresses.build
  end

  def show
    
  end

  def edit

  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User has been created"
      redirect_to signin_path
    else
      #require 'pry'; binding.pry
      flash[:danger] = "User has not been created"
      render :new
    end
  end

  def update
    #@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User has been updated"
      redirect_to @user
    else
      flash[:danger] = "User has not been updated"
      render :edit 
    end
    
  end


  def destroy
    #@user = User.find(params[:id])
    @user.destroy

    flash[:success] = "User has been deleted"
    redirect_to users_path
  end



 private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                  addresses_attributes: [:address_line1, :address_line2, :city, :zip_code])
  end

  def set_user
    @user = User.find(params[:id])
  end
end