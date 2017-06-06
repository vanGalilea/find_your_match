class PagesController < ApplicationController
  def home
  end

  def settings
    @users = User.all
  end
end
