class Match < ApplicationRecord
  belongs_to :user
  belongs_to :matched_user, class_name: "User"

  after_create :create_inverse, unless: :has_inverse?


  def create_inverse
    self.class.create(inverse_match_options)
  end

  def has_inverse?
    self.class.exists?(inverse_match_options)
  end

  def inverses
    self.class.where(inverse_match_options)
  end

  def inverse_match_options
    { matched_user_id: user_id, user_id: matched_user_id }
  end

  def self.matches_per_day(date)
    self.where('created_at < ? AND created_at > ?',date.end_of_day , date.beginning_of_day)
  end

  def generate_match_of_today
    @students = User.return_students
    @students = @students.shuffle
    loop_through_students

  end

  def loop_through_students
    if @students.first.matched_user_ids.include?(@students.second.id)
      if @students.length <= 3
        match_call_back
        generate_match_of_today
      end
      @students.shuffle
      loop_through_students
    else
      Match.create(user: @students.first, matched_user:@students.second)
      @students = @students.drop(2)
      loop_through_students
      puts Match.matches_per_day(Time.now)
    end
  end

  def match_call_back

  end

end
