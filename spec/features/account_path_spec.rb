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

  it "allows admin to update user accounts to preferred" do
    visit accounts_path
    click_on "Make Preferred"
    expect(Account.first.preferred).to eq(true)
  end

  it "allows admin to remove preferred status from user accounts" do
    @user.account.update(preferred: true)
    visit accounts_path
    click_on "Remove Preferred"
    expect(Account.first.preferred).to eq(false)
  end
end
