require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to have_many (:matches) }
    it { is_expected.to have_many (:matched_users) }
  end

  describe "toggle_admin" do
    let!(:user1)    { create :user, admin: true}
    let!(:user2)    { create :user, admin: false}

    it { expect(user1.toggle_admin).to eq(false) }
    it { expect(user2.toggle_admin).to eq(true) }
  end

  describe "return_students" do
    let!(:user1)    { create :user, admin: true}
    let!(:user2)    { create :user, admin: false}
    let!(:user3)    { create :user, admin: true}
    let!(:user4)    { create :user, admin: false}

    it { expect(User.return_students).to eq([user2, user4]) }
      it { expect(User.return_students).not_to eq([user1, user3]) }
  end

end
