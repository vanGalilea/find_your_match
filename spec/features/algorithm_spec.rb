require 'rails_helper'

  describe "Algorithm sets up matches without putting a student in 2 teams" do
    before { login_as user }
    let!(:user1) { create :user, name: "Bob", password: "test123", admin: false }
    let!(:user2) { create :user, name: "Roderick", password: "test123", admin: false }
    let!(:user3) { create :user, name: "Hans", password: "test123", admin: false }
    let!(:user4) { create :user, name: "Cilia", password: "test123", admin: false }
    let!(:user) { create :user, name: "Anna", password: "test123", admin: true}
    let!(:user5) { create :user, name: "Bernie", password: "test123", admin: true}

    it "returns students on the page" do
      visit root_path
      click_link("Generate pairs for today")

      page.should have_content("Bob", "Roderick", "Hans", "Cilia")
    end

    it "does not show admins in student list" do
      visit root_path
      click_link("Generate pairs for today")

      expect(page).to have_content("Bob")
      expect(page).to have_content ("Roderick")
      expect(page).to have_content ("Hans")
      expect(page).to have_content ("Cilia")
      expect(page).to_not have_content("Anna")
      expect(page).to_not have_content("Bernie")
    end

  end
