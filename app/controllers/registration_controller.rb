class RegistrationController < ApplicationController
  def new
    if session[:user_id].present?
      redirect_to index_user_path
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to index_user_path notice: 'Singed Up Successfully!'
    else
      puts @user.errors
      render :new, status: :unprocessable_entity
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to new_user_path
  end

  def login
    if session[:user_id].present?
      redirect_to index_user_path
    end
    @user = User.new
  end

  def login_create
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to index_user_path notice: 'Logged In Successfully!'
    else
      render :login, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
