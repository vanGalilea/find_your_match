class PagesController < ApplicationController
  def home
  end

  def settings
    @users = User.all
  end

  def toggle
    @user.toggle_admin
  end

end
