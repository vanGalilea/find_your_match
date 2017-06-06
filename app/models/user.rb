class User < ApplicationRecord
  has_many :matches
  has_many :matched_users, through: :matches

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def toggle_admin
    admin ? self.admin = false : self.admin = true
  end

end
