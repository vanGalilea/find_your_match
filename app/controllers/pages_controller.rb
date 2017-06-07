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
    generate_match_of_today
  end

  private

  def authorized?
    unless current_user.admin
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def loop_through_students
    if @students.first.matched_user_ids.include?(@students.second.id)
      if @students.length <= 3
        match_call_back
        generate_match_of_today
      end
      @students = @students.shuffle
      loop_through_students
    else
      Match.create(user: @students.first, matched_user:@students.second)
      @students = @students.drop(2)
      loop_through_students if @students.length > 0
    end
  end

  def match_call_back
    Match.matches_per_day(Time.now).destroy_all
  end

  def generate_match_of_today
    @students = User.return_students
    @students = @students.shuffle
    loop_through_students
  end

end
