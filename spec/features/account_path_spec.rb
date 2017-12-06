require 'rails_helper'

describe "the order history management path" do
  before do
    @user = FactoryBot.create(:user, admin: true)
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "allows admin to view all acounts" do
    visit accounts_path
    expect(page).to have_content("test@test.com")
  end


end
