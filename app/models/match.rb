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







  def generate_matches

  end

  def method_name

  end
end
