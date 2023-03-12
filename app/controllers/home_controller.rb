class HomeController < ApplicationController
  def index
    if session[:user_id].present?
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to new_user_path
    end
  end
end
