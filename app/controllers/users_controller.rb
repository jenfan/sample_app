class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  def index
    @users = User.paginate(page: params[:page])
  end
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def edit
      @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else 
      render 'edit'
    end
  end

  def destroy
    if User.exists?(params[:id])
        User.find(params[:id]).destroy
        flash[:success] = "User deleted."
        redirect_to users_url
    else
      redirect_to users_path
      flash[:error] = "User doesn't exist or it has been deleted"
      
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
