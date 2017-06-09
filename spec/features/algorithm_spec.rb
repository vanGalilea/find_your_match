require 'rails_helper'

  describe "Algorithm sets up matches without putting a user in 2 teams" do
    before { login_as user }
    let!(:user1) { create :user, name: "Bob", password: "test123", admin: false }
    let!(:user2) { create :user, name: "Roderick", password: "test123", admin: false }
    let!(:user3) { create :user, name: "Hans", password: "test123", admin: false }
    let!(:user4) { create :user, name: "Cilia", password: "test123", admin: false }
    let!(:user) { create :user, name: "Anna", password: "test123", admin: true}

    it "returns unique pairs" do
      visit root_path
      click_link("Generate pairs for today")

      expect(todays-matches).to contain_exactly("Bob", "Roderick", "Hans", "Cilia")
      expect(todays-matches).to_not contain_exactly("Bob", "Roderick", "Hans", "Cilia")

    end
  end
