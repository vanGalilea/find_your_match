class PagesController < ApplicationController
  include PagesHelper
  before_action :authenticate_user!

  def home
    @date = Date.new
  end

  def settings_update
    @user = User.find(params[:id])
    @user.toggle_admin
    @user.save

    respond_to do |format|
      format.html { render action: :settings }
      format.json { render json: @user }
    end



  end

  def settings
    @users = User.all
  end

  def toggle
    @user.toggle_admin
  end

  def create_day_match
    generate_match_of_today
    redirect_to root_path
  end

  private

  def authorized?
    unless current_user.admin
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

end
