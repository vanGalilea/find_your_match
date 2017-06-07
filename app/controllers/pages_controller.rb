class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def settings
    @users = User.all
  end

  def toggle
    @user.toggle_admin
  end

  def day_match
  end

  private

  def authorized?
    unless current_user.admin
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end
end
