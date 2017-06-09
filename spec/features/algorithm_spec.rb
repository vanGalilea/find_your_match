require 'rails_helper'

  describe "Algorithm sets up matches without putting a user in 2 teams" do
    before { login_as user }
    let(:user1) { create :user, :student, name: "Bob" }
    let(:user2) { create :user, :student, name: "Roderick" }
    let(:user3) { create :user, :student, name: "Hans" }
    let(:user4) { create :user, :student, name: "Cilia" }
    let(:user) { create :user, :admin, name: "Anna", password: "test123" }

    it "returns unique pairs"do
      visit root_path

      click

    end
  end

describe "Navigating rooms" do
  before { login_as user }

  let(:user) { create :user }
  let!(:room) { create :room , user: user }

  it "allows navigation from the detail page to the listing page" do
    visit room_url(room)

    click_link "Back"

    expect(current_path).to eq(rooms_path)
  end
end
