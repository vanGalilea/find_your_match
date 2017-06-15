require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "relations" do
    it { is_expected.to belong_to (:user) }
    it { is_expected.to belong_to (:matched_user) }
  end

  describe "matches_per_day" do
    let!(:user1)    { create :user, admin: false}
    let!(:user2)    { create :user, admin: false}
    let!(:user3)    { create :user, admin: false}
    let!(:user4)    { create :user, admin: false}
    let!(:match1)   { create :match, user_id: user1.id, matched_user_id: user2.id, created_at: Time.now - 1.days}
    let!(:match2)   { create :match, user_id: user3.id, matched_user_id: user4.id, created_at: Time.now - 1.days}
    let!(:match3)   { create :match, user_id: user1.id, matched_user_id: user4.id, created_at: Time.now + 1.days}

    it { expect(Match.matches_per_day(Time.now - 1.days)).to eq([match1, match2]) }
    it { expect(Match.matches_per_day(Time.now + 1.days)).to eq([match3]) }
  end

  describe "matches_history" do
    let!(:user1)    { create :user, admin: false}
    let!(:user2)    { create :user, admin: false}
    let!(:user3)    { create :user, admin: false}
    let!(:user4)    { create :user, admin: false}
    let!(:match1)   { create :match, user_id: user1.id, matched_user_id: user2.id, created_at: Time.now - 1.days}
    let!(:match2)   { create :match, user_id: user3.id, matched_user_id: user4.id, created_at: Time.now - 1.days}
    let!(:match3)   { create :match, user_id: user1.id, matched_user_id: user4.id, created_at: Time.now - 2.days}
    let!(:match4)   { create :match, user_id: user3.id, matched_user_id: user2.id, created_at: Time.now}
    let!(:match5)   { create :match, user_id: user2.id, matched_user_id: user4.id, created_at: Time.now}

    it { expect(Match.matches_history).to eq([match1, match2, match3]) }
    it { expect(Match.matches_history).not_to eq([match4, match5]) }
  end

  describe "matches_per_user(id_user)" do
    let!(:user1)    { create :user, admin: false}
    let!(:user2)    { create :user, admin: false}
    let!(:user3)    { create :user, admin: false}
    let!(:user4)    { create :user, admin: false}
    let!(:match1)   { create :match, user_id: user1.id, matched_user_id: user2.id, created_at: Time.now - 1.days}
    let!(:match2)   { create :match, user_id: user3.id, matched_user_id: user4.id, created_at: Time.now - 1.days}
    let!(:match3)   { create :match, user_id: user1.id, matched_user_id: user4.id, created_at: Time.now - 2.days}
    let!(:match4)   { create :match, user_id: user3.id, matched_user_id: user2.id, created_at: Time.now}
    let!(:match5)   { create :match, user_id: user2.id, matched_user_id: user4.id, created_at: Time.now}

    it { expect(Match.matches_per_user(user1.id)).to eq([match1, match3]) }
    it { expect(Match.matches_per_user(user3.id)).to eq([match2, match4]) }
    it { expect(Match.matches_per_user(user4.id).count).to eq(3) }
    it { expect(Match.matches_per_user(user2.id).count).to eq(3) }
  end

end
