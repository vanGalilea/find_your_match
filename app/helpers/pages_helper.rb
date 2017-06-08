module PagesHelper
  def check_cycle
    if @students.first.matched_user_ids.length == @cycle_turns
      @students.each do |student|
        student.matched_user_ids = []
      end
      puts "***************CYCLE!!!!!***********************************************************"
    end
  end

  def loop_through_students
    check_cycle
    if @students.first.matched_user_ids.include?(@students.second.id) && @students.length > 3
      @students = @students.shuffle
      loop_through_students
    elsif @students.length <= 3 && @students.first.matched_user_ids.include?(@students.second.id)
      match_call_back
      generate_match_of_today
    else
      Match.create(user: @students.first, matched_user:@students.second)
      @students = @students.drop(2)
      if @students.length > 0
        loop_through_students
      else
        puts "*****************DAY!!!!**********************************************"
      end
    end
  end

  def match_call_back
    Match.matches_per_day(Time.now).destroy_all
  end

  def generate_match_of_today
    @students = User.return_students
    @cycle_turns = @students.length-1
    @students = @students.shuffle
    loop_through_students
  end
end
